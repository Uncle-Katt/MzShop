package com.example.banson5s.service.client.Impl;

import com.example.banson5s.dto.client.cart.CartRequest;
import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.entity.admin.LichSuHoaDon;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.enums.BillType;
import com.example.banson5s.enums.InvoiceStatus;
import com.example.banson5s.enums.Status;
import com.example.banson5s.exception.AppException;
import com.example.banson5s.service.admin.IHoaDonChiTietService;
import com.example.banson5s.service.admin.IHoaDonService;
import com.example.banson5s.service.admin.ILichSuHoaDonService;
import com.example.banson5s.service.admin.ISanPhamChiTietService;
import com.example.banson5s.ultiltes.InvoiceGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import static com.example.banson5s.exception.ErrorCode.INVALID_REQUEST;
import static com.example.banson5s.exception.ErrorCode.OUT_OF_STOCK;
import static com.example.banson5s.exception.ErrorCode.PRODUCT_NOT_FOUND;

@Service
public class CartServiceImpl {
    @Autowired
    ISanPhamChiTietService sanPhamChiTietService;

    @Autowired
    IHoaDonChiTietService hoaDonChiTietService;

    @Autowired
    IHoaDonService hoaDonService;

    @Autowired
    ILichSuHoaDonService lichSuHoaDonService;

    @Autowired
    InvoiceGenerator invoiceGenerator;

    @Transactional
    public HoaDon paymentCart(CartRequest req){

        HoaDon hoaDon = new HoaDon();
        List<HoaDonChiTiet> lstSanPham = req.getLstProductDetail().stream().map(item ->{
            SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietService.findById(item.getId())
                    .orElseThrow(() -> new AppException(PRODUCT_NOT_FOUND));
            if (Status.NGUNG_HOAT_DONG.getLabel().equals(sanPhamChiTiet.getSanPham().getTrangThai())){
                throw new AppException(PRODUCT_NOT_FOUND);
            }
            if (item.getQuantity() > sanPhamChiTiet.getSoLuong()){
                throw new AppException(OUT_OF_STOCK);
            }
            HoaDonChiTiet entity = HoaDonChiTiet.builder()
                    .hoaDon(hoaDon)
                    .soLuong(item.getQuantity())
                    .giaGoc(sanPhamChiTiet.getGiaBan())
                    .giaBan(sanPhamChiTiet.getGiaBan())
                    .sanPhamChiTiet(sanPhamChiTiet)
                    .build();
            return entity;
        }).toList();

        BigDecimal tongTienGiaBan = lstSanPham.stream()
                .map(item -> item.getGiaBan().multiply(BigDecimal.valueOf(item.getSoLuong())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        hoaDon.setLoaiHoaDon(BillType.ONLINE.getLabel());
        hoaDon.setDiaChiNguoiNhan(req.getAddress());
        hoaDon.setTenNguoiNhan(req.getNameAddress());
        hoaDon.setSoDienThoaiNguoiNhan(req.getPhoneAddress());
        hoaDon.setNgayDat(LocalDateTime.now());
        hoaDon.setHinhThucHoaDon(BillType.ONLINE.toString());
        hoaDon.setTrangThai(InvoiceStatus.CHO_XAC_NHAN.getLabel());

        hoaDon.setPhiVanChuyen(BigDecimal.valueOf(Double.valueOf(req.getShipMoney())));
        hoaDon.setTongTien(tongTienGiaBan);
        hoaDon.setThanhTien(tongTienGiaBan.add(hoaDon.getPhiVanChuyen()));
        hoaDon.setTienGiam(BigDecimal.ZERO);

        hoaDon.setMaHoaDon(invoiceGenerator.generateInvoiceNumber());

        hoaDonService.createNew(hoaDon);
        lstSanPham.forEach(item ->{
            hoaDonChiTietService.createNew(item);
        });
        LichSuHoaDon lichSuHoaDon = LichSuHoaDon.builder()
                .loai(InvoiceStatus.TAO_DON_HANG.toString()).hoaDon(hoaDon).build();
        LichSuHoaDon lichSuHoaDon2 = LichSuHoaDon.builder()
                .loai(InvoiceStatus.CHO_XAC_NHAN.toString()).hoaDon(hoaDon).build();
        lichSuHoaDonService.createNew(lichSuHoaDon);
        lichSuHoaDonService.createNew(lichSuHoaDon2);
        return hoaDon;
    }
}

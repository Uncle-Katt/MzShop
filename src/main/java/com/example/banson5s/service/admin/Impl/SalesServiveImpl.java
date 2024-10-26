package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.sales.CustomerInvoicesDTO;
import com.example.banson5s.dto.admin.sales.PaymentInvoiceDTO;
import com.example.banson5s.dto.admin.sales.ProductInvoicesDTO;
import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.entity.admin.IInvoiceItem;
import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.entity.admin.PhieuGiamGia;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.enums.CouponStatus;
import com.example.banson5s.enums.InvoiceStatus;
import com.example.banson5s.exception.AppException;
import com.example.banson5s.exception.ErrorCode;
import com.example.banson5s.service.admin.IHoaDonChiTietService;
import com.example.banson5s.service.admin.IHoaDonService;
import com.example.banson5s.service.admin.IKhachHangService;
import com.example.banson5s.service.admin.IPhieuGiamGiaService;
import com.example.banson5s.service.admin.ISalesService;
import com.example.banson5s.service.admin.ISanPhamChiTietService;
import com.example.banson5s.ultiltes.InvoiceGenerator;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class SalesServiveImpl implements ISalesService {

    @Autowired
    ISanPhamChiTietService sanPhamChiTietService;

    @Autowired
    IHoaDonService hoaDonService;

    @Autowired
    IHoaDonChiTietService hoaDonChiTietService;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    InvoiceGenerator invoiceGenerator;

    @Autowired
    IKhachHangService khachHangService;

    @Autowired
    IPhieuGiamGiaService phieuGiamGiaService;

    @Override
    public List<SanPhamChiTiet> lstSanPhamChiTiet(String search) {
        List<SanPhamChiTiet> lst = sanPhamChiTietService.findLstSanPhamChiTiet(search);
        return lst;
    }

    @Override
    public List<HoaDon> lstHoaDon() {
        List<HoaDon> lst = hoaDonService.findAllLstHoaDonSts(InvoiceStatus.NEW.getLabel());
        return lst;
    }


    @Override
    public List<IInvoiceItem> lstHoaDonChiTiet(Long idHoaDon) {
        List<IInvoiceItem> lst = hoaDonChiTietService.getLstIInvoiceItems(idHoaDon);
        return lst;
    }

    @Override
    public HoaDon createHoaDon() {
        HoaDon hoaDon = HoaDon.builder()
                .trangThai(InvoiceStatus.NEW.getLabel())
                .maHoaDon(invoiceGenerator.generateInvoiceNumber()).build();
        return hoaDonService.createNew(hoaDon);
    }

    @Override
    public Boolean addSanPhamToHoaDon(ProductInvoicesDTO req) {
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietService.findById(req.getProductId())
                .orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        if (sanPhamChiTiet.getSoLuong() < req.getQuantity()){
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }
        HoaDon hoaDon = hoaDonService.findById(req.getBillId())
                .orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        HoaDonChiTiet hoaDonChiTiet = HoaDonChiTiet.builder()
                .sanPhamChiTiet(sanPhamChiTiet)
                .giaBan(sanPhamChiTiet.getGiaBan()).soLuong(req.getQuantity()).hoaDon(hoaDon).build();
        hoaDonChiTietService.createNew(hoaDonChiTiet);
        sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() - req.getQuantity());
        sanPhamChiTietService.update(sanPhamChiTiet);
        return true;
    }

    @Override
    public Boolean deleteProduct(Long hdctId) {
        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietService.findById(hdctId)
                .orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        SanPhamChiTiet sanPhamChiTiet = hoaDonChiTiet.getSanPhamChiTiet();
        sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() + hoaDonChiTiet.getSoLuong());
        sanPhamChiTietService.update(sanPhamChiTiet);
        hoaDonChiTietService.physicalDelete(hdctId);
        return true;
    }

    @Override
    public Boolean deleteAllProduct(Long hoaDonId) {
        List<HoaDonChiTiet> lstHdct = hoaDonChiTietService.findLstHdctByHd(hoaDonId);
        lstHdct.stream().forEach(hoaDonChiTiet -> {
            SanPhamChiTiet sanPhamChiTiet = hoaDonChiTiet.getSanPhamChiTiet();
            sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() + hoaDonChiTiet.getSoLuong());
            sanPhamChiTietService.update(sanPhamChiTiet);
            hoaDonChiTietService.physicalDelete(hoaDonChiTiet.getId());
        });
        return true;
    }

    @Override
    public Boolean deleteHoaDon(Long hoaDonId) {
        HoaDon hoaDon = hoaDonService.findById(hoaDonId)
                .orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        deleteAllProduct(hoaDon.getId());
        hoaDonService.physicalDelete(hoaDon.getId());
        return true;
    }

    @Override
    public List<KhachHang> findAllCustomer(String value) {
        return khachHangService.findAllCustomer(value);
    }

    @Override
    public Boolean cstomerInvoices(CustomerInvoicesDTO customerInvoicesDTO) {
        HoaDon hoaDon = hoaDonService.findById(customerInvoicesDTO.getBillId())
                .orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        KhachHang khachHang = null;
        if (customerInvoicesDTO.getCustomerId() != null) {
            khachHang = khachHangService.findById(customerInvoicesDTO.getCustomerId())
                    .orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        }
        hoaDon.setKhachHang(khachHang);
        hoaDonService.update(hoaDon);
        return true;
    }

    @Override
    public Boolean paymentInvoice(PaymentInvoiceDTO paymentInvoiceDTO) {
        HoaDon hoaDon = hoaDonService.findById(paymentInvoiceDTO.getBillId())
                .orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        hoaDon.setPhiVanChuyen(paymentInvoiceDTO.getShipMoney());
        hoaDon.setTongTien(paymentInvoiceDTO.getTotalMoney());
        hoaDon.setThanhTien(paymentInvoiceDTO.getTotalAmount());
        hoaDon.setTrangThai(InvoiceStatus.DA_XAC_NHAN.getLabel());
        hoaDonService.update(hoaDon);
        return true;
    }

    @Override
    public List<PhieuGiamGia> findAllVoucherSales(String search) {
        return phieuGiamGiaService.findAllVoucherSales(CouponStatus.DANG_DIEN_RA.getLabel(), search);
    }
}

package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.diaChi.DiaChiDTO;
import com.example.banson5s.dto.admin.khachHang.KhachHangDTO;
import com.example.banson5s.dto.admin.sales.CustomerInvoicesDTO;
import com.example.banson5s.dto.admin.sales.PaymentInvoiceDTO;
import com.example.banson5s.dto.admin.sales.ProductInvoicesDTO;
import com.example.banson5s.dto.admin.sales.VoucherInvoicesDTO;
import com.example.banson5s.dto.admin.voucher.VoucherDTO;
import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.entity.admin.IInvoiceItem;
import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.entity.admin.LichSuHoaDon;
import com.example.banson5s.entity.admin.LichSuThanhToan;
import com.example.banson5s.entity.admin.PhieuGiamGia;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.enums.BillType;
import com.example.banson5s.enums.CouponStatus;
import com.example.banson5s.enums.InvoiceStatus;
import com.example.banson5s.enums.PaymentMethod;
import com.example.banson5s.exception.AppException;
import com.example.banson5s.exception.ErrorCode;
import com.example.banson5s.service.admin.IDiaChiService;
import com.example.banson5s.service.admin.IHoaDonChiTietService;
import com.example.banson5s.service.admin.IHoaDonService;
import com.example.banson5s.service.admin.IKhachHangService;
import com.example.banson5s.service.admin.ILichSuHoaDonService;
import com.example.banson5s.service.admin.ILichSuThanhToanService;
import com.example.banson5s.service.admin.IPhieuGiamGiaService;
import com.example.banson5s.service.admin.ISalesService;
import com.example.banson5s.service.admin.ISanPhamChiTietService;
import com.example.banson5s.ultiltes.InvoiceGenerator;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;

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

    @Autowired
    ILichSuHoaDonService lichSuHoaDonService;

    @Autowired
    ILichSuThanhToanService lichSuThanhToanService;

    @Autowired
    private IDiaChiService diaChiService;

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
        hoaDon = hoaDonService.createNew(hoaDon);
        LichSuHoaDon lichSuHoaDon = LichSuHoaDon.builder()
                .loai(InvoiceStatus.TAO_DON_HANG.toString()).hoaDon(hoaDon).build();
        lichSuHoaDonService.createNew(lichSuHoaDon);
        return hoaDon;
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
        Optional<HoaDonChiTiet> hoaDonChiTietOpt = hoaDonChiTietService.findHoaDonChiTietByHdAndSanPham(req.getBillId(), req.getProductId());
        if (hoaDonChiTietOpt.isPresent()){
            HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietOpt.get();
            hoaDonChiTiet.setSoLuong(hoaDonChiTiet.getSoLuong() + req.getQuantity());
            hoaDonChiTiet.setGiaBan(sanPhamChiTiet.getGiaBan());
            hoaDonChiTietService.update(hoaDonChiTiet);
        }else {
            HoaDonChiTiet hoaDonChiTiet = HoaDonChiTiet.builder()
                    .sanPhamChiTiet(sanPhamChiTiet)
                    .giaBan(sanPhamChiTiet.getGiaBan()).soLuong(req.getQuantity()).hoaDon(hoaDon).build();
            hoaDonChiTietService.createNew(hoaDonChiTiet);
        }
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
    @Transactional
    public Boolean deleteHoaDon(Long hoaDonId) {
        HoaDon hoaDon = hoaDonService.findById(hoaDonId)
                .orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        deleteAllProduct(hoaDon.getId());
        lichSuHoaDonService.deleteLichSuHoaDonByHoaDon(hoaDonId);
        hoaDonService.physicalDelete(hoaDon.getId());
        return true;
    }

    @Override
    public List<KhachHangDTO> findAllCustomer(String value) {
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
    public Boolean voucherInvoices(VoucherInvoicesDTO voucherInvoicesDTO) {
        HoaDon hoaDon = hoaDonService.findById(voucherInvoicesDTO.getBillId())
                .orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        PhieuGiamGia phieuGiamGia = null;
        if (voucherInvoicesDTO.getVoucherId() != null) {
            phieuGiamGia = phieuGiamGiaService.findById(voucherInvoicesDTO.getVoucherId())
                    .orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        }
        hoaDon.setPhieuGiamGia(phieuGiamGia);
        hoaDonService.update(hoaDon);
        return true;
    }

    @Override
    public HoaDon paymentInvoice(PaymentInvoiceDTO dto) {
        HoaDon hoaDon = hoaDonService.findById(dto.getBillId())
                .orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        modelMapper.map(dto, hoaDon);
        hoaDon.setLoaiHoaDon(BillType.OFFLINE.toString());
        hoaDon.setNgayDat(LocalDateTime.now());
        LichSuHoaDon lichSuHoaDon = LichSuHoaDon.builder().hoaDon(hoaDon).build();
        if (dto.getIsGiaoHang()){
            hoaDon.setTrangThai(InvoiceStatus.DA_XAC_NHAN.getLabel());
            hoaDon.setHinhThucHoaDon(BillType.DELIVERY.toString());
            lichSuHoaDon.setLoai(InvoiceStatus.DA_XAC_NHAN.getLabel());
        }else {
            hoaDon.setTrangThai(InvoiceStatus.HOAN_THANH.getLabel());
            hoaDon.setHinhThucHoaDon(BillType.OFFLINE.toString());
            lichSuHoaDon.setLoai(InvoiceStatus.HOAN_THANH.getLabel());
            LichSuThanhToan lichSuThanhToan = LichSuThanhToan.builder().soTienThanhToan(dto.getTongTien()).loaiThanhToan(
                    PaymentMethod.TIEN_MAT.getLabel()).hoaDon(hoaDon).build();
            lichSuThanhToanService.createNew(lichSuThanhToan);
        }
        if (hoaDon.getPhieuGiamGia() != null){
            PhieuGiamGia phieuGiamGia = hoaDon.getPhieuGiamGia();
            if (phieuGiamGia.getSoLuong() <= 0){
                hoaDon.setPhieuGiamGia(null);
                hoaDonService.update(hoaDon);
                throw new AppException(ErrorCode.INVALID_REQUEST);
            }
            phieuGiamGia.setSoLuong(phieuGiamGia.getSoLuong() - 1);
            phieuGiamGiaService.update(phieuGiamGia);
        }
        lichSuHoaDonService.createNew(lichSuHoaDon);
        hoaDonService.update(hoaDon);
        return hoaDon;
    }

    @Override
    public List<VoucherDTO> findAllVoucherSales(String search) {
        return phieuGiamGiaService.findAllVoucherSales(CouponStatus.DANG_DIEN_RA.getLabel(), search);
    }

    @Override
    public List<DiaChiDTO> findAddressByCustomer(Long customerId) {
        return diaChiService.getLstAddressByCustomer(customerId);
    }
}

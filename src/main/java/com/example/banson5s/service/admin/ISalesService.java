package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.diaChi.DiaChiDTO;
import com.example.banson5s.dto.admin.khachHang.KhachHangDTO;
import com.example.banson5s.dto.admin.sales.CustomerInvoicesDTO;
import com.example.banson5s.dto.admin.sales.PaymentInvoiceDTO;
import com.example.banson5s.dto.admin.sales.ProductInvoicesDTO;
import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.entity.admin.IInvoiceItem;
import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.entity.admin.PhieuGiamGia;
import com.example.banson5s.entity.admin.SanPhamChiTiet;

import java.util.List;

public interface ISalesService {

    List<SanPhamChiTiet> lstSanPhamChiTiet(String search);

    List<HoaDon> lstHoaDon();

    List<IInvoiceItem> lstHoaDonChiTiet(Long idHoaDon);

    HoaDon createHoaDon();

    Boolean addSanPhamToHoaDon(ProductInvoicesDTO req);

    Boolean deleteProduct(Long hdctId);

    Boolean deleteAllProduct(Long hoaDonId);

    Boolean deleteHoaDon(Long hoaDonId);

    List<KhachHangDTO> findAllCustomer(String value);

    Boolean cstomerInvoices(CustomerInvoicesDTO customerInvoicesDTO);

    Boolean paymentInvoice(PaymentInvoiceDTO paymentInvoiceDTO);

    List<PhieuGiamGia> findAllVoucherSales(String search);

    List<DiaChiDTO> findAddressByCustomer(Long customerId);

}

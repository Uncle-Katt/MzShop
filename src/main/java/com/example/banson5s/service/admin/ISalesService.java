package com.example.banson5s.service.admin;

import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.entity.admin.IInvoiceItem;
import com.example.banson5s.entity.admin.SanPhamChiTiet;

import java.util.List;

public interface ISalesService {

    List<SanPhamChiTiet> lstSanPhamChiTiet();

    List<HoaDon> lstHoaDon();

    List<IInvoiceItem> lstHoaDonChiTiet(Long idHoaDon);

    HoaDon createHoaDon();

    Boolean addSanPhamToHoaDon(Long idHoaDon, Long idSanPhamChiTiet, Integer soLuong);



}

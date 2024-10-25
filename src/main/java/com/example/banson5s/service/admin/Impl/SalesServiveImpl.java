package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.entity.admin.IInvoiceItem;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.service.admin.IHoaDonChiTietService;
import com.example.banson5s.service.admin.IHoaDonService;
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

    @Override
    public List<SanPhamChiTiet> lstSanPhamChiTiet() {
        List<SanPhamChiTiet> lst = sanPhamChiTietService.findAllLst();
        return lst;
    }

    @Override
    public List<HoaDon> lstHoaDon() {
        List<HoaDon> lst = hoaDonService.findAllLst();
        return lst;
    }


    @Override
    public List<IInvoiceItem> lstHoaDonChiTiet(Long idHoaDon) {
        List<IInvoiceItem> lst = hoaDonChiTietService.getLstIInvoiceItems(idHoaDon);
        return lst;
    }

    @Override
    public HoaDon createHoaDon() {
        HoaDon hoaDon = HoaDon.builder().maHoaDon(invoiceGenerator.generateInvoiceNumber()).build();
        return hoaDonService.createNew(hoaDon);
    }

    @Override
    public Boolean addSanPhamToHoaDon(Long idHoaDon, Long idSanPhamChiTiet,Integer soluong) {
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietService.findById(Long.valueOf(idSanPhamChiTiet)).get();
        HoaDon hoaDon = hoaDonService.findById(Long.valueOf(idHoaDon)).get();
        HoaDonChiTiet hoaDonChiTiet = HoaDonChiTiet.builder()
                .sanPhamChiTiet(sanPhamChiTiet)
                .giaBan(BigDecimal.valueOf(sanPhamChiTiet.getGiaBan())).soLuong(soluong).hoaDon(hoaDon).build();
        hoaDonChiTietService.createNew(hoaDonChiTiet);
        return true;
    }
}

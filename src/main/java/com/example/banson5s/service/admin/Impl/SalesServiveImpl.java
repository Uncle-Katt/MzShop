package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.sales.ProductInvoicesDTO;
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
    public Boolean addSanPhamToHoaDon(ProductInvoicesDTO req) {
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietService.findById(req.getProductId()).orElseThrow();
        HoaDon hoaDon = hoaDonService.findById(req.getBillId()).orElseThrow();
        HoaDonChiTiet hoaDonChiTiet = HoaDonChiTiet.builder()
                .sanPhamChiTiet(sanPhamChiTiet)
                .giaBan(BigDecimal.valueOf(sanPhamChiTiet.getGiaBan())).soLuong(req.getQuantity()).hoaDon(hoaDon).build();
        hoaDonChiTietService.createNew(hoaDonChiTiet);
        sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() - req.getQuantity());
        sanPhamChiTietService.update(sanPhamChiTiet);
        return true;
    }

    @Override
    public Boolean deleteProduct(Long hdctId) {
        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietService.findById(hdctId).orElseThrow();
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
        HoaDon hoaDon = hoaDonService.findById(hoaDonId).orElseThrow();
        deleteAllProduct(hoaDon.getId());
        hoaDonService.delete(hoaDon);
        return true;
    }
}

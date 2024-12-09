package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.entity.admin.IInvoiceItem;
import com.example.banson5s.repository.admin.IHoaDonChiTietRepository;
import com.example.banson5s.service.admin.IHoaDonChiTietService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class HoaDonChiTietServiceImpl extends BaseServiceImpl<HoaDonChiTiet, Long, IHoaDonChiTietRepository>
        implements IHoaDonChiTietService {
    @Override
    public List<IInvoiceItem> getLstIInvoiceItems(Long idHoaDon) {
        List<IInvoiceItem> lst = repository.getLstIInvoiceItems(idHoaDon);
        return lst;
    }

    @Override
    public List<HoaDonChiTiet> findLstHdctByHd(Long idHoaDon) {
        List<HoaDonChiTiet> lst = repository.findLstHdctByHd(idHoaDon);
        return lst;
    }

    @Override
    public Optional<HoaDonChiTiet> findHoaDonChiTietByHdAndSanPham(Long idHoaDon, Long idSanPham) {
        return repository.findHoaDonChiTietByHoaDonAndSanPham(idHoaDon, idSanPham);
    }
}

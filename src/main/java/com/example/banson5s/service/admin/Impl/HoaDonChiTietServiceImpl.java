package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.entity.admin.IInvoiceItem;
import com.example.banson5s.repository.admin.IHoaDonChiTietRepository;
import com.example.banson5s.service.admin.IHoaDonChiTietService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoaDonChiTietServiceImpl extends BaseServiceImpl<HoaDonChiTiet, Long, IHoaDonChiTietRepository>
        implements IHoaDonChiTietService {
    @Override
    public List<IInvoiceItem> getLstIInvoiceItems(Long idHoaDon) {
        List<IInvoiceItem> lst = repository.getLstIInvoiceItems(idHoaDon);
        return lst;
    }
}

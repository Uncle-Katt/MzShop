package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.PhieuGiamGia;
import com.example.banson5s.repository.admin.IPhieuGiamGiaRepository;
import com.example.banson5s.service.admin.IPhieuGiamGiaService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhieuGiamGiaServiceImpl extends BaseServiceImpl<PhieuGiamGia, Long, IPhieuGiamGiaRepository>
        implements IPhieuGiamGiaService {
    @Override
    public List<PhieuGiamGia> findAllVoucherSales(String sts,String search) {
        return repository.findAllVoucherSales(sts,search);
    }
}

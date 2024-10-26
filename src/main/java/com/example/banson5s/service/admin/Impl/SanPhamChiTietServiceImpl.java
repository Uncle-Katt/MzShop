package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.repository.admin.ISanPhamChiTietRepository;
import com.example.banson5s.service.admin.ISanPhamChiTietService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SanPhamChiTietServiceImpl extends BaseServiceImpl<SanPhamChiTiet, Long, ISanPhamChiTietRepository>
        implements ISanPhamChiTietService {
    @Override
    public List<SanPhamChiTiet> findLstSanPhamChiTiet(String search) {
        List<SanPhamChiTiet> lst = repository.findLstSanPhamChiTiet(search,true);
        return lst;
    }
}

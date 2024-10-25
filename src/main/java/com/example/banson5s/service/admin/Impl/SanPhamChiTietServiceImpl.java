package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.repository.admin.ISanPhamChiTietRepository;
import com.example.banson5s.service.admin.ISanPhamChiTietService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class SanPhamChiTietServiceImpl extends BaseServiceImpl<SanPhamChiTiet, Long, ISanPhamChiTietRepository>
        implements ISanPhamChiTietService {
}

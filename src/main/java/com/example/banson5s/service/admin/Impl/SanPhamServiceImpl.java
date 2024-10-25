package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.SanPham;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.repository.admin.ISanPhamChiTietRepository;
import com.example.banson5s.repository.admin.ISanPhamRepository;
import com.example.banson5s.service.admin.ISanPhamChiTietService;
import com.example.banson5s.service.admin.ISanPhamService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class SanPhamServiceImpl extends BaseServiceImpl<SanPham, Long, ISanPhamRepository>
        implements ISanPhamService {
}

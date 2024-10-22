package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.NhanVien;
import com.example.banson5s.repository.admin.INhanVienRepository;
import com.example.banson5s.service.admin.INhanVienService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class NhanVienServiceImpl  extends BaseServiceImpl<NhanVien, Long, INhanVienRepository>
        implements INhanVienService {
}

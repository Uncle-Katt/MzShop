package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.repository.admin.INhanVienRepository;
import com.example.banson5s.service.admin.ICustomerService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl extends BaseServiceImpl<KhachHang, Long, INhanVienRepository>
        implements ICustomerService {
}

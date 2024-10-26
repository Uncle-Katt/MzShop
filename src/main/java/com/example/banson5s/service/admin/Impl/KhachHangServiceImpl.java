package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.repository.admin.IKhachHangRepository;
import com.example.banson5s.service.admin.IKhachHangService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KhachHangServiceImpl extends BaseServiceImpl<KhachHang, Long, IKhachHangRepository>
        implements IKhachHangService {
    @Override
    public List<KhachHang> findAllCustomer(String value) {
        return repository.findAllCustomer(value);
    }
}

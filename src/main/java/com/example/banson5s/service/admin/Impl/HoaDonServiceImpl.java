package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.repository.admin.IHoaDonRepository;
import com.example.banson5s.service.admin.IHoaDonService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class HoaDonServiceImpl extends BaseServiceImpl<HoaDon, Long, IHoaDonRepository>
        implements IHoaDonService {
}

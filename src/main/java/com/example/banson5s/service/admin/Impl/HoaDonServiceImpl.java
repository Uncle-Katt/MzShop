package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.repository.admin.IHoaDonRepository;
import com.example.banson5s.service.admin.IHoaDonService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoaDonServiceImpl extends BaseServiceImpl<HoaDon, Long, IHoaDonRepository>
        implements IHoaDonService {
    @Override
    public List<HoaDon> findAllLstHoaDonSts(String sts) {
        return repository.findAllLstHoaDonSts(sts);
    }
}

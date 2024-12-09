package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.LichSuHoaDon;
import com.example.banson5s.repository.admin.ILichSuHoaDonRepository;
import com.example.banson5s.service.admin.ILichSuHoaDonService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class LichSuHoaDonServiceImpl extends BaseServiceImpl<LichSuHoaDon, Long, ILichSuHoaDonRepository>
        implements ILichSuHoaDonService {

    @Override
    public boolean deleteLichSuHoaDonByHoaDon(Long idHoaDon) {
        return repository.deleteLichSuHoaDonByHoaDonId(idHoaDon) > 0;
    }
}

package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.enums.InvoiceStatus;
import com.example.banson5s.exception.AppException;
import com.example.banson5s.exception.ErrorCode;
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

    @Override
    public HoaDon findHoaDonByCode(String code) {
        HoaDon hoaDon = repository.findHoaDonByMaHoaDon(code).orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        return hoaDon;
    }

    @Override
    public List<HoaDon> findAllLstHoaDonByCodeAndStsAndType(String value, String type, String sts) {
        return repository.findAllLstHoaDonByCodeAndStsAndType(value, type, sts, InvoiceStatus.NEW.toString());
    }
}

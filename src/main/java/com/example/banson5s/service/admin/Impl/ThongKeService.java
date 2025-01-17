package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.thongKe.DoanhThuDTO;
import com.example.banson5s.entity.admin.IDoanhThuTheoThang;
import com.example.banson5s.repository.admin.IThongKeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class ThongKeService {
    @Autowired
    private IThongKeRepository thongKeRepository;
    public DoanhThuDTO getDoanhThu() {
        Integer day = thongKeRepository.getDoanhThuToDay();
        Integer month = thongKeRepository.getDoanhThuByMonth();
        Integer year = thongKeRepository.getDoanhThuByYear();
        Integer soLuongTon = thongKeRepository.getSoLuongTonKho();
        DoanhThuDTO data = DoanhThuDTO.builder().day(day).month(month).year(year).soLuongTon(soLuongTon).build();
        return data;
    }

    public Integer getDoanhThuTheoKhoangNgay(String startDate, String endDate) {
        Integer doanhThu = thongKeRepository.getDoanhThuByDateRange(startDate,endDate);
        return doanhThu;
    }

    public List<IDoanhThuTheoThang> getDoanhThuTable() {
        List<IDoanhThuTheoThang> data = thongKeRepository.getDoanhTheoThangTable();
        return data;
    }
}

package com.example.banson5s.ChucNang.Service;

import com.example.banson5s.ChucNang.Entity.PhieuGiamGia;
import org.springframework.stereotype.Service;

import java.util.List;
public interface PhieuGiamGiaService {
    List<PhieuGiamGia> layTatCa();
    PhieuGiamGia layTheoId(Integer id);
    PhieuGiamGia luu(PhieuGiamGia phieuGiamGia);
    PhieuGiamGia capNhat(PhieuGiamGia phieuGiamGia);
    void xoaTheoId(Integer id);
}

package com.example.banson5s.ChucNang.Service;

import com.example.banson5s.ChucNang.Entity.PhieuGiamGia;
import java.util.List;

public interface PhieuGiamGiaService {
    List<PhieuGiamGia> layTatCa();
    PhieuGiamGia layTheoId(Long id);
    PhieuGiamGia luu(PhieuGiamGia phieuGiamGia);
    void xoaTheoId(Long id);
}

package com.example.banson5s.BanHang.Service;

import com.example.banson5s.BanHang.Entity.PhuongThucThanhToan;
import java.util.List;

public interface PhuongThucThanhToanService {
    List<PhuongThucThanhToan> findAll();
    PhuongThucThanhToan findById(Long id);
    PhuongThucThanhToan save(PhuongThucThanhToan phuongThucThanhToan);
    void deleteById(Long id);
}

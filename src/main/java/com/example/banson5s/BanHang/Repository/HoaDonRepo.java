package com.example.banson5s.BanHang.Repository;

import com.example.banson5s.BanHang.Entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HoaDonRepo extends JpaRepository<HoaDon, Long> {
    List<HoaDon> findByTrangThai(Integer trangThai);
}

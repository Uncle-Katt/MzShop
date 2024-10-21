package com.example.banson5s.BanHang.Repository;

import com.example.banson5s.ChucNang.Entity.PhieuGiamGia;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VoucherRepo extends JpaRepository<PhieuGiamGia, Long> {
}

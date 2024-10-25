package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ISanPhamChiTietRepository extends IBaseRepository<SanPhamChiTiet,Long> {
}

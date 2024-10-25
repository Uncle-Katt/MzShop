package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.SanPham;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ISanPhamRepository extends IBaseRepository<SanPham,Long> {
}

package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.NhanVien;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface INhanVienRepository extends IBaseRepository<NhanVien,Long> {
}

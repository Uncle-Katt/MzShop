package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IKhachHangRepository extends IBaseRepository<KhachHang,Long> {
}

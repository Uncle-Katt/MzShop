package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.KhoiLuong;
import com.example.banson5s.entity.admin.XuatXu;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IKhoiLuongRepo extends IBaseRepository<KhoiLuong,Long> {
    @Query(value = "SELECT kl FROM KhoiLuong kl WHERE kl.tenKhoiLuong LIKE %:value% and kl.xoaMem = false order by kl.ngayTao desc ")
    List<KhoiLuong> findAllStaff(@Param("value") String value);
}

package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.ThuongHieu;
import com.example.banson5s.entity.admin.XuatXu;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IXuatXuRepo extends IBaseRepository<XuatXu,Long> {
    @Query(value = "SELECT xx FROM XuatXu xx WHERE xx.tenXuatXu LIKE %:value% and xx.xoaMem = false order by xx.ngayTao desc ")
    List<XuatXu> findAllStaff(@Param("value") String value);
}

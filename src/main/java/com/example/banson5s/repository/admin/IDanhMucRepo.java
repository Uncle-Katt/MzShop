package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.DanhMuc;
import com.example.banson5s.entity.admin.KhoiLuong;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IDanhMucRepo extends IBaseRepository<DanhMuc,Long> {
    @Query(value = "SELECT dm FROM DanhMuc dm WHERE dm.tenDanhMuc LIKE %:value% and dm.xoaMem = false order by dm.ngayTao desc ")
    List<DanhMuc> findAllStaff(@Param("value") String value);
}

package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.NhanVien;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface INhanVienRepository extends IBaseRepository<NhanVien,Long> {
    @Query(value = "SELECT nv FROM NhanVien nv WHERE (nv.tenNhanVien LIKE %:value% OR nv.sdt LIKE %:value%) and UPPER(nv.chucVu.tenChucVu) != 'ADMIN' and nv.xoaMem = false order by nv.ngayTao desc ")
    List<NhanVien> findAllStaff(@Param("value") String value);
}

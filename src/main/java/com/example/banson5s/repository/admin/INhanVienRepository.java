package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.NhanVien;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface INhanVienRepository extends IBaseRepository<NhanVien,Long> {
    @Query("SELECT nv FROM NhanVien nv WHERE (nv.tenNhanVien LIKE %:value% OR nv.sdt LIKE %:value%) AND NOT UPPER(nv.chucVu.tenChucVu) = 'ADMIN' AND nv.xoaMem = false ORDER BY nv.ngayTao DESC")
    List<NhanVien> findAllStaff(@Param("value") String value);

    Optional<NhanVien> findNhanVienByEmail(String email);

}

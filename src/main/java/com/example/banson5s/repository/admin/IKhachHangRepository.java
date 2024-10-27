package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IKhachHangRepository extends IBaseRepository<KhachHang,Long> {

    @Query(value = "SELECT kh FROM KhachHang kh WHERE (kh.hoVaTen LIKE %:value% OR kh.soDienThoai LIKE %:value%) order by kh.ngayTao desc ")
    List<KhachHang> findAllCustomer(@Param("value") String value);
}

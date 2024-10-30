package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.DiaChi;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IDiaChiRepository extends IBaseRepository<DiaChi,Long> {
    @Query("""
    SELECT dc FROM DiaChi dc where dc.xoaMem = false and dc.khachHang.id = :idCustomer order by dc.ngayTao desc
    """)
    List<DiaChi> findDiaChiByCustomer(@Param("idCustomer") Long idCustomer);
}

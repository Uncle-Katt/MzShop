package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.MauSac;
import com.example.banson5s.entity.admin.XuatXu;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IMauSacRepo extends IBaseRepository<MauSac,Long> {
    @Query(value = "SELECT ms FROM MauSac ms WHERE ms.tenMauSac LIKE %:value% and ms.xoaMem = false order by ms.ngayTao desc ")
    List<MauSac> findAllStaff(@Param("value") String value);
}

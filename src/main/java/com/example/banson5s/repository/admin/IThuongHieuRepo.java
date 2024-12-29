package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.ThuongHieu;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IThuongHieuRepo extends IBaseRepository<ThuongHieu,Long> {

    @Query(value = "SELECT th FROM ThuongHieu th WHERE th.tenThuongHieu LIKE %:value% and th.xoaMem = false order by th.ngayTao desc ")
    List<ThuongHieu> findAllThuongHieu(@Param("value") String value);
}

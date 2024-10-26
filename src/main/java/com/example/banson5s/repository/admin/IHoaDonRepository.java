package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IHoaDonRepository extends IBaseRepository<HoaDon,Long> {
    @Query("select hd from HoaDon hd where hd.trangThai = :sts")
    List<HoaDon> findAllLstHoaDonSts(@Param("sts") String sts);
}

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

    HoaDon findHoaDonByMaHoaDon(String maHoaDon);

    @Query("select hd from HoaDon hd where hd.maHoaDon like %:value% and hd.loaiHoaDon like %:type% and hd.trangThai like %:sts% and hd.trangThai <> :notSts order by hd.ngayDat desc ")
    List<HoaDon> findAllLstHoaDonByCodeAndStsAndType(@Param("value") String value,@Param("type") String type,@Param("sts") String sts,@Param("notSts") String notSts);
}

package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.LichSuHoaDon;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ILichSuHoaDonRepository extends IBaseRepository<LichSuHoaDon,Long> {
    @Modifying
    @Query("""
    delete from LichSuHoaDon l where l.hoaDon.id = :hoaDonId
""")
    int deleteLichSuHoaDonByHoaDonId(@Param("hoaDonId") Long hoaDonId);

}

package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ISanPhamChiTietRepository extends IBaseRepository<SanPhamChiTiet,Long> {
    @Query("""
    select spct from SanPhamChiTiet spct
    where spct.xoaMem = false 
    and spct.soLuong > 0 
    and spct.trangThai LIKE %:sts%
    and (spct.sanPham.tenSanPham LIKE %:search% OR spct.maVach LIKE %:search%)
    """)
    List<SanPhamChiTiet> findLstSanPhamChiTiet(@Param("search") String value,@Param("sts") String sts);
}

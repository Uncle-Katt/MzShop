package com.example.banson5s.repository.admin;

import com.example.banson5s.dto.admin.sanPham.request.SanPhamChiTietDTO;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ISanPhamChiTietRepository extends IBaseRepository<SanPhamChiTiet, Long> {
    @Query("""
            select spct from SanPhamChiTiet spct
            where spct.xoaMem = false
            and spct.sanPham.xoaMem = false
            and spct.soLuong > 0 
            and spct.sanPham.trangThai LIKE :sts%
            and (spct.sanPham.tenSanPham LIKE %:search% OR spct.maVach LIKE %:search%)
            """)
    List<SanPhamChiTiet> findLstSanPhamChiTiet(@Param("search") String value, @Param("sts") String sts);

    @Query("""
            select spct from SanPhamChiTiet spct 
            where spct.sanPham.id = :#{#dto.sanPhamId}
            and spct.khoiLuong.id = :#{#dto.khoiLuongId}
            and spct.mauSac.id = :#{#dto.mauSacId}
            and spct.xoaMem = false
            and spct.sanPham.xoaMem = false
            """)
    Optional<SanPhamChiTiet> findSanPhamChiTietBySanPham(@Param("dto") SanPhamChiTietDTO dto);


}

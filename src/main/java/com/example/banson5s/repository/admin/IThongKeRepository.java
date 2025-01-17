package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.entity.admin.IDoanhThuTheoThang;
import com.example.banson5s.repository.common.IBaseRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface IThongKeRepository extends IBaseRepository<HoaDon,Long> {
    @Query(value = """
    SELECT COALESCE(SUM(tong_tien), 0) AS doanh_thu
    FROM hoa_don
    WHERE CAST(ngay_tao AS DATE) = CAST(GETDATE() AS DATE)
    and trang_thai = 'HOAN_THANH'
    """, nativeQuery = true)
    Integer getDoanhThuToDay();

    @Query(value = """
    SELECT COALESCE(SUM(tong_tien), 0) AS doanh_thu
    FROM hoa_don
    WHERE YEAR(ngay_tao) = YEAR(GETDATE()) 
    AND MONTH(ngay_tao) = MONTH(GETDATE())
    and trang_thai = 'HOAN_THANH'
    """, nativeQuery = true)
    Integer getDoanhThuByMonth();

    @Query(value = """
    SELECT COALESCE(SUM(tong_tien), 0) AS doanh_thu
    FROM hoa_don
    WHERE YEAR(ngay_tao) = YEAR(GETDATE())
    and trang_thai = 'HOAN_THANH'
    """, nativeQuery = true)
    Integer getDoanhThuByYear();

    @Query(value = """
    SELECT COALESCE(SUM(tong_tien), 0) AS doanh_thu
    FROM hoa_don
    WHERE CAST(ngay_tao AS DATE) >= CAST(:startDate AS DATE)
    AND CAST(ngay_tao AS DATE) <= CAST(:endDate AS DATE)
    and trang_thai = 'HOAN_THANH'
""", nativeQuery = true)
    Integer getDoanhThuByDateRange(@Param("startDate") String startDate, @Param("endDate") String endDate);

    @Query(value = """
    SELECT COALESCE(SUM(spct.so_luong), 0) AS so_luong
    FROM san_pham_chi_tiet spct
    join san_pham sp on sp.id = spct.id_san_pham
    WHERE sp.trang_thai = 'HOAT_DONG'
""", nativeQuery = true)
    Integer getSoLuongTonKho();


    @Query(value = """
SELECT COALESCE(SUM(hd.tong_tien), 0) AS doanh_thu,
       COALESCE(SUM(hdct.so_luong), 0) AS so_luong_ban,
       YEAR(hd.ngay_tao) AS year,
       MONTH(hd.ngay_tao) AS month
FROM hoa_don hd
         JOIN hoa_don_chi_tiet hdct ON hd.id = hdct.id_hoa_don
WHERE YEAR(hd.ngay_tao) = YEAR(CURRENT_TIMESTAMP) and hd.trang_thai = 'HOAN_THANH'
GROUP BY YEAR(hd.ngay_tao), MONTH(hd.ngay_tao)
ORDER BY year DESC, month DESC
""",nativeQuery = true)
    List<IDoanhThuTheoThang> getDoanhTheoThangTable();
}

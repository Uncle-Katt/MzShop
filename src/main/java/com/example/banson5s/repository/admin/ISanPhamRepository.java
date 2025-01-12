package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.IProductItem;
import com.example.banson5s.entity.admin.SanPham;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ISanPhamRepository extends IBaseRepository<SanPham, Long> {

    @Query(value = """
            select sp.id,
                   sp.ten_san_pham as sanPham,
                   th.ten_thuong_hieu as thuongHieu,
                   xx.ten_xuat_xu as xuatXu,
                   dm.ten_danh_muc as danhMuc,
                   COALESCE(SUM(spct.so_luong), 0) as soLuong,
                   sp.ngay_tao,
                   sp.trang_thai as trangThai
            from san_pham sp
                LEFT JOIN san_pham_chi_tiet spct on sp.id = spct.id_san_pham and spct.xoa_mem = 'false'
                LEFT JOIN thuong_hieu th on sp.id_thuong_hieu = th.id
                LEFT JOIN xuat_xu xx on sp.id_xuat_xu = xx.id
                LEFT JOIN danh_muc dm on sp.id_danh_muc = dm.id
            WHERE sp.xoa_mem = 'false'
            and sp.ten_san_pham like %:search%
            and sp.trang_thai like :status%
            GROUP BY sp.id, sp.ten_san_pham, th.ten_thuong_hieu, xx.ten_xuat_xu, dm.ten_danh_muc, sp.ngay_tao, sp.trang_thai
            ORDER BY sp.ngay_tao DESC
            """, nativeQuery = true)
    List<IProductItem> getLstProductGroup(@Param("search") String search,@Param("status") String status);




}

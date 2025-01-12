package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.entity.admin.IInvoiceItem;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface IHoaDonChiTietRepository extends IBaseRepository<HoaDonChiTiet, Long> {

    @Query(value = """
                SELECT
                    hdct.id,
                    sp.ten_san_pham,
                    sp.url_anh,
                    kl.ten_khoi_luong,
                    ms.ten_mau_sac,
                    spct.gia_ban,
                    hdct.so_luong,
                    spct.gia_ban * hdct.so_luong AS tong_tien
                FROM dbo.hoa_don_chi_tiet hdct
                    JOIN dbo.san_pham_chi_tiet spct ON spct.id = hdct.id_san_pham_chi_tiet
                    JOIN dbo.san_pham sp ON sp.id = spct.id_san_pham
                    JOIN dbo.mau_sac ms on ms.id = spct.id_mau_sac
                    JOIN dbo.khoi_luong kl on spct.id_khoi_luong = kl.id 
                WHERE hdct.id_hoa_don = :idHoaDon
            """, nativeQuery = true)
    List<IInvoiceItem> getLstIInvoiceItems(@Param("idHoaDon") Long idHoaDon);


    @Query("select hdct from HoaDonChiTiet hdct where hdct.hoaDon.id = :hoaDonId")
    List<HoaDonChiTiet> findLstHdctByHd(@Param("hoaDonId") Long hoaDonId);

    @Query("""
            select hdct from HoaDonChiTiet hdct 
            where hdct.hoaDon.id = :idHoaDon 
            and hdct.sanPhamChiTiet.id = :idSanPham
            """)
    Optional<HoaDonChiTiet> findHoaDonChiTietByHoaDonAndSanPham(Long idHoaDon, Long idSanPham);

}

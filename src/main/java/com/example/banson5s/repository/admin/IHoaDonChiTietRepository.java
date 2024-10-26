package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.HoaDonChiTiet;
import com.example.banson5s.entity.admin.IInvoiceItem;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IHoaDonChiTietRepository extends IBaseRepository<HoaDonChiTiet,Long> {

    @Query(value = """
    SELECT 
        hdct.id,
        sp.ten_san_pham, 
        spct.gia_ban,
        hdct.so_luong, 
        spct.gia_ban * hdct.so_luong AS tong_tien 
    FROM dbo.hoa_don_chi_tiet hdct 
    JOIN dbo.san_pham_chi_tiet spct ON spct.id = hdct.id_san_pham_chi_tiet
    JOIN dbo.san_pham sp ON sp.id = spct.id_san_pham 
    WHERE hdct.id_hoa_don = :idHoaDon
""", nativeQuery = true)
    List<IInvoiceItem> getLstIInvoiceItems(@Param("idHoaDon") Long idHoaDon);


    @Query("select hdct from HoaDonChiTiet hdct where hdct.hoaDon.id = :hoaDonId")
    List<HoaDonChiTiet> findLstHdctByHd(@Param("hoaDonId") Long hoaDonId);

}

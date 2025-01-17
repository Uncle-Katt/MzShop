package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.PhieuGiamGia;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

public interface IPhieuGiamGiaRepository  extends IBaseRepository<PhieuGiamGia,Long> {

    @Query("""
    select 
    pgg 
    from PhieuGiamGia pgg 
    where 
    pgg.xoaMem = false
    and pgg.soLuong > 0 
    and pgg.trangThai = :sts
    and (pgg.tenPhieuGiamGia like %:search% or pgg.maPhieuGiamGia like %:search%)
    order by pgg.ngayTao desc 
""")
    List<PhieuGiamGia> findAllVoucherSales(@Param("sts") String sts,@Param("search") String search);

    @Query("""
    select 
    pgg 
    from PhieuGiamGia pgg 
    where 
    pgg.xoaMem = false
    and (pgg.tenPhieuGiamGia like %:search% or pgg.maPhieuGiamGia like %:search%)
    order by pgg.ngayTao desc 
""")
    List<PhieuGiamGia> findAllVoucher(@Param("search") String search);
    @Transactional
    @Modifying
    @Query("UPDATE PhieuGiamGia p SET p.trangThai = 'DANG_DIEN_RA' WHERE p.ngayBatDau <= :currentDateTime AND p.trangThai = 'SAP_DIEN_RA'")
    void updateStatusToActive(LocalDateTime currentDateTime);

    @Transactional
    @Modifying
    @Query("UPDATE PhieuGiamGia v SET v.trangThai = 'DA_KET_THUC' WHERE v.ngayKetThuc < :currentDateTime AND v.trangThai = 'DANG_DIEN_RA'")
    void updateStatusToExpired(LocalDateTime currentDateTime);

}

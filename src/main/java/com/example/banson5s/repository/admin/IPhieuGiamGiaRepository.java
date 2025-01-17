package com.example.banson5s.repository.admin;

import com.example.banson5s.entity.admin.PhieuGiamGia;
import com.example.banson5s.repository.common.IBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

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
}

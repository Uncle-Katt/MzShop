package com.example.banson5s.service.admin;

import com.example.banson5s.entity.admin.PhieuGiamGia;
import com.example.banson5s.service.common.IBaseService;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IPhieuGiamGiaService extends IBaseService<PhieuGiamGia,Long> {

    List<PhieuGiamGia> findAllVoucherSales(String sts, String search);
}

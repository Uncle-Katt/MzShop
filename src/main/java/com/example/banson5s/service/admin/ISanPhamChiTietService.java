package com.example.banson5s.service.admin;

import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.service.common.IBaseService;

import java.util.List;

public interface ISanPhamChiTietService extends IBaseService<SanPhamChiTiet,Long> {
    List<SanPhamChiTiet> findLstSanPhamChiTiet(String search);

}

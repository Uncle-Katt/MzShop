package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.sanPham.SanPhamDTO;
import com.example.banson5s.entity.admin.IProductItem;
import com.example.banson5s.entity.admin.SanPham;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.service.common.IBaseService;

import java.util.List;

public interface ISanPhamService extends IBaseService<SanPham,Long> {
    List<IProductItem> getLstProductGroup(String search);

    SanPhamDTO createSanPham(SanPhamDTO sanPhamDTO);

    SanPhamDTO updateSanpham(SanPhamDTO sanPhamDTO);
}

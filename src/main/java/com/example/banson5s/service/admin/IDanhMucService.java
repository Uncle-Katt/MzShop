package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.sanPham.DanhMucDTO;
import com.example.banson5s.dto.admin.sanPham.KhoiLuongDTO;
import com.example.banson5s.entity.admin.DanhMuc;
import com.example.banson5s.service.common.IBaseService;

import java.util.List;

public interface IDanhMucService extends IBaseService<DanhMuc, Long> {
    List<DanhMucDTO> findAllDanhMuc(String value);
    DanhMucDTO createDanhMuc(DanhMucDTO dto);
    DanhMucDTO updateDanhMuc(DanhMucDTO dto);
    DanhMucDTO detailDanhMuc(Long id);
}

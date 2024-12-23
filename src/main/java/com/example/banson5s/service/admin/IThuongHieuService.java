package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.sanPham.ThuongHieuDTO;
import com.example.banson5s.entity.admin.ThuongHieu;
import com.example.banson5s.service.common.IBaseService;

import java.util.List;

public interface IThuongHieuService extends IBaseService<ThuongHieu,Long> {
    List<ThuongHieuDTO> findAllThuongHieu(String value);
    ThuongHieuDTO createThuongHieu(ThuongHieuDTO dto);
    ThuongHieuDTO updateThuongHieu(ThuongHieuDTO dto);
    ThuongHieuDTO detailThuongHieu(Long id);
}

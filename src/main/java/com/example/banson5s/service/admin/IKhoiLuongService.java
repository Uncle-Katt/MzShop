package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.sanPham.KhoiLuongDTO;
import com.example.banson5s.entity.admin.KhoiLuong;
import com.example.banson5s.service.common.IBaseService;

import java.util.List;

public interface IKhoiLuongService extends IBaseService<KhoiLuong, Long> {
    List<KhoiLuongDTO> findAllKhoiLuong(String value);
    KhoiLuongDTO createKhoiLuong(KhoiLuongDTO dto);
    KhoiLuongDTO updateKhoiLuong(KhoiLuongDTO dto);
    KhoiLuongDTO detailKhoiLuong(Long id);
}

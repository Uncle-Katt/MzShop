package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.sanPham.MauSacDTO;
import com.example.banson5s.entity.admin.MauSac;
import com.example.banson5s.service.common.IBaseService;

import java.util.List;

public interface IMauSacService extends IBaseService<MauSac,Long> {
    List<MauSacDTO> findAllMauSac(String value);
    MauSacDTO createMauSac(MauSacDTO dto);
    MauSacDTO updateMauSac(MauSacDTO dto);
    MauSacDTO detailMauSac(Long id);
}

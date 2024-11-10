package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.nhanVien.NhanVienDTO;
import com.example.banson5s.entity.admin.NhanVien;
import com.example.banson5s.service.common.IBaseService;

import java.util.List;

public interface INhanVienService extends IBaseService<NhanVien,Long> {

    List<NhanVienDTO> findAllNhanVien(String value);

    NhanVienDTO createNhanVien(NhanVienDTO dto);

    NhanVienDTO updateNhanVien(NhanVienDTO dto);

    NhanVienDTO detailNhanVien(Long id);

}


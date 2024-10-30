package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.diaChi.DiaChiDTO;
import com.example.banson5s.entity.admin.DiaChi;
import com.example.banson5s.service.common.IBaseService;

import java.util.List;

public interface IDiaChiService extends IBaseService<DiaChi,Long> {
    List<DiaChiDTO> getLstAddressByCustomer(Long idCustomer);
}


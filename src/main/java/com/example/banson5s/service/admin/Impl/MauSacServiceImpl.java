package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.sanPham.KhoiLuongDTO;
import com.example.banson5s.dto.admin.sanPham.MauSacDTO;
import com.example.banson5s.dto.admin.sanPham.XuatXuDTO;
import com.example.banson5s.entity.admin.KhoiLuong;
import com.example.banson5s.entity.admin.MauSac;
import com.example.banson5s.entity.admin.XuatXu;
import com.example.banson5s.exception.AppException;
import com.example.banson5s.exception.ErrorCode;
import com.example.banson5s.repository.admin.IMauSacRepo;
import com.example.banson5s.repository.admin.IXuatXuRepo;
import com.example.banson5s.service.admin.IMauSacService;
import com.example.banson5s.service.admin.IXuatXuService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MauSacServiceImpl extends BaseServiceImpl<MauSac, Long, IMauSacRepo> implements IMauSacService {
    @Autowired
    ModelMapper modelMapper;
    @Override
    public List<MauSacDTO> findAllMauSac(String value) {
        List<MauSacDTO> list = repository.findAllStaff(value).stream()
                .map(item -> modelMapper.map(item, MauSacDTO.class))
                .toList();
        return list;
    }

    @Override
    public MauSacDTO createMauSac(MauSacDTO dto) {
        MauSac entity = modelMapper.map(dto, MauSac.class);
        MauSac mauSac = createNew(entity);
        return modelMapper.map(mauSac, MauSacDTO.class);
    }

    @Override
    public MauSacDTO updateMauSac(MauSacDTO dto) {
        MauSac entity = findById(dto.getId()).
                orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        modelMapper.map(dto, entity);
        update(entity);
        return dto;
    }

    @Override
    public MauSacDTO detailMauSac(Long id) {
        Optional<MauSac> entity = findById(id);
        if (entity.isEmpty()){
            return null;
        }
        MauSacDTO data = modelMapper.map(entity.get(), MauSacDTO.class);
        return data;
    }
}

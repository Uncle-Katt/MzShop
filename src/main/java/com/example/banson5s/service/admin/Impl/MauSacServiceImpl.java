package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.sanPham.MauSacDTO;
import com.example.banson5s.dto.admin.sanPham.XuatXuDTO;
import com.example.banson5s.entity.admin.MauSac;
import com.example.banson5s.entity.admin.XuatXu;
import com.example.banson5s.repository.admin.IMauSacRepo;
import com.example.banson5s.repository.admin.IXuatXuRepo;
import com.example.banson5s.service.admin.IMauSacService;
import com.example.banson5s.service.admin.IXuatXuService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
        return null;
    }

    @Override
    public MauSacDTO updateMauSac(MauSacDTO dto) {
        return null;
    }

    @Override
    public MauSacDTO detailMauSac(Long id) {
        return null;
    }
}

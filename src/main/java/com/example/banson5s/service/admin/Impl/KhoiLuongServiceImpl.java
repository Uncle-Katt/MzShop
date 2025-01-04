package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.sanPham.KhoiLuongDTO;
import com.example.banson5s.dto.admin.sanPham.XuatXuDTO;
import com.example.banson5s.entity.admin.KhoiLuong;
import com.example.banson5s.entity.admin.XuatXu;
import com.example.banson5s.repository.admin.IKhoiLuongRepo;
import com.example.banson5s.service.admin.IKhoiLuongService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KhoiLuongServiceImpl extends BaseServiceImpl<KhoiLuong, Long, IKhoiLuongRepo> implements IKhoiLuongService {
    @Autowired
    ModelMapper modelMapper;
    @Override
    public List<KhoiLuongDTO> findAllKhoiLuong(String value) {
        List<KhoiLuongDTO> list = repository.findAllStaff(value).stream()
                .map(item -> modelMapper.map(item, KhoiLuongDTO.class))
                .toList();
        return list;
    }

    @Override
    public KhoiLuongDTO createKhoiLuong(KhoiLuongDTO dto) {
        KhoiLuong entity = modelMapper.map(dto, KhoiLuong.class);
        KhoiLuong khoiLuong = createNew(entity);
        return modelMapper.map(khoiLuong, KhoiLuongDTO.class);
    }

    @Override
    public KhoiLuongDTO updateKhoiLuong(KhoiLuongDTO dto) {
        return null;
    }

    @Override
    public KhoiLuongDTO detailKhoiLuong(Long id) {
        return null;
    }
}

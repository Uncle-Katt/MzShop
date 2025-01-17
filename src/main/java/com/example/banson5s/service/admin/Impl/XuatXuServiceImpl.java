package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.sanPham.MauSacDTO;
import com.example.banson5s.dto.admin.sanPham.ThuongHieuDTO;
import com.example.banson5s.dto.admin.sanPham.XuatXuDTO;
import com.example.banson5s.entity.admin.MauSac;
import com.example.banson5s.entity.admin.ThuongHieu;
import com.example.banson5s.entity.admin.XuatXu;
import com.example.banson5s.exception.AppException;
import com.example.banson5s.exception.ErrorCode;
import com.example.banson5s.repository.admin.IThuongHieuRepo;
import com.example.banson5s.repository.admin.IXuatXuRepo;
import com.example.banson5s.service.admin.IThuongHieuService;
import com.example.banson5s.service.admin.IXuatXuService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class XuatXuServiceImpl extends BaseServiceImpl<XuatXu, Long, IXuatXuRepo> implements IXuatXuService {
    @Autowired
    ModelMapper modelMapper;
    @Override
    public List<XuatXuDTO> findAllXuatXu(String value) {
        List<XuatXuDTO> list = repository.findAllStaff(value).stream()
                .map(item -> modelMapper.map(item, XuatXuDTO.class))
                .toList();
        return list;
    }

    @Override
    public XuatXuDTO createXuatXu(XuatXuDTO dto) {
        XuatXu entity = modelMapper.map(dto, XuatXu.class);
        XuatXu xuatXu = createNew(entity);
        return modelMapper.map(xuatXu, XuatXuDTO.class);
    }

    @Override
    public XuatXuDTO updateXuatXu(XuatXuDTO dto) {
        XuatXu entity = findById(dto.getId()).
                orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        modelMapper.map(dto, entity);
        update(entity);
        return dto;
    }

    @Override
    public XuatXuDTO detailXuatXu(Long id) {
        Optional<XuatXu> entity = findById(id);
        if (entity.isEmpty()){
            return null;
        }
        XuatXuDTO data = modelMapper.map(entity.get(), XuatXuDTO.class);
        return data;
    }
}

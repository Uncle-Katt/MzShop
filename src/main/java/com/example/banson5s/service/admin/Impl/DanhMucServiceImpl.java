package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.sanPham.DanhMucDTO;
import com.example.banson5s.entity.admin.DanhMuc;
import com.example.banson5s.exception.AppException;
import com.example.banson5s.exception.ErrorCode;
import com.example.banson5s.repository.admin.IDanhMucRepository;
import com.example.banson5s.service.admin.IDanhMucService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DanhMucServiceImpl extends BaseServiceImpl<DanhMuc, Long, IDanhMucRepository>
        implements IDanhMucService {
    @Autowired
    ModelMapper modelMapper;

    @Override
    public List<DanhMucDTO> findAllDanhMuc(String value) {
        List<DanhMucDTO> lst = repository.findAll(value).stream()
                .map(item -> modelMapper.map(item, DanhMucDTO.class)).toList();
        return lst;
    }

    @Override
    public DanhMucDTO createDanhMuc(DanhMucDTO dto) {
        DanhMuc entity = modelMapper.map(dto, DanhMuc.class);
        createNew(entity);
        return dto;
    }

    @Override
    public DanhMucDTO updateDanhMuc(DanhMucDTO dto) {
        DanhMuc entity = findById(dto.getId()).
                orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        modelMapper.map(dto, entity);
        update(entity);
        return dto;
    }

    @Override
    public DanhMucDTO detailDanhMuc(Long id) {
        DanhMuc entity = findById(id).
                orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        DanhMucDTO data = modelMapper.map(entity, DanhMucDTO.class);
        return data;
    }
}

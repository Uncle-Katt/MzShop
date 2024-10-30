package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.diaChi.DiaChiDTO;
import com.example.banson5s.entity.admin.DiaChi;
import com.example.banson5s.entity.admin.SanPham;
import com.example.banson5s.repository.admin.IDiaChiRepository;
import com.example.banson5s.repository.admin.ISanPhamRepository;
import com.example.banson5s.service.admin.IDiaChiService;
import com.example.banson5s.service.admin.ISanPhamService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiaChiServiceImpl extends BaseServiceImpl<DiaChi, Long, IDiaChiRepository>
        implements IDiaChiService {
    @Autowired
    ModelMapper modelMapper;
    @Override
    public List<DiaChiDTO> getLstAddressByCustomer(Long idCustomer) {
        List<DiaChiDTO> lstDiaChi = repository.findDiaChiByCustomer(idCustomer)
                .stream().map(diaChi -> modelMapper.map(diaChi,DiaChiDTO.class)).toList();
        return lstDiaChi;
    }
}

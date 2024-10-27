package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.khachHang.KhachHangDTO;
import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.repository.admin.IKhachHangRepository;
import com.example.banson5s.service.admin.IKhachHangService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import com.example.banson5s.ultiltes.RandomStringGenerator;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KhachHangServiceImpl extends BaseServiceImpl<KhachHang, Long, IKhachHangRepository>
        implements IKhachHangService {

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    RandomStringGenerator randomStringGenerator;

    @Override
    public List<KhachHangDTO> findAllCustomer(String value) {
        List<KhachHangDTO> lst = repository.findAllCustomer(value).stream()
                .map(item -> modelMapper.map(item, KhachHangDTO.class)).toList();
        return lst;
    }

    @Override
    public KhachHangDTO createCustomer(KhachHangDTO khachHangDTO) {
            String password = randomStringGenerator.generateRandomString(8);
            KhachHang entity = modelMapper.map(khachHangDTO, KhachHang.class);
            entity.setMatKhau(passwordEncoder.encode(password));
            createNew(entity);
            return khachHangDTO;
    }

    @Override
    public KhachHangDTO updateCustomer(KhachHangDTO khachHangDTO) {
        KhachHang entity = findById(khachHangDTO.getId()).orElseThrow();
        modelMapper.map(khachHangDTO, entity);
        update(entity);
        return khachHangDTO;
    }
}

package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.khachHang.KhachHangDTO;
import com.example.banson5s.dto.admin.khachHang.KhachHangDiaChiDTO;
import com.example.banson5s.entity.admin.DiaChi;
import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.exception.AppException;
import com.example.banson5s.exception.ErrorCode;
import com.example.banson5s.repository.admin.IKhachHangRepository;
import com.example.banson5s.service.admin.IDiaChiService;
import com.example.banson5s.service.admin.IKhachHangService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import com.example.banson5s.ultiltes.RandomStringGenerator;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Autowired
    IDiaChiService diaChiService;

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
        KhachHang entity = findById(khachHangDTO.getId()).
                orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        modelMapper.map(khachHangDTO, entity);
        update(entity);
        return khachHangDTO;
    }

    @Override
    public KhachHangDTO detailCustomer(Long customerId) {
        KhachHang entity = findById(customerId).
                orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        return modelMapper.map(entity, KhachHangDTO.class);
    }

    @Override
    @Transactional
    public KhachHangDiaChiDTO addressCustomer(KhachHangDiaChiDTO req) {
        KhachHang entity = findById(req.getCustomerId()).
                orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        List<DiaChi> lstDiaChi = entity.getLstDiaChi().stream().toList();
        if (req.getId() == null){
            DiaChi diaChi = modelMapper.map(req, DiaChi.class);
            diaChi.setKhachHang(entity);
            if (diaChi.getDiaChiMacDinh()){
                lstDiaChi.stream().forEach(item -> item.setDiaChiMacDinh(false));
            }
            diaChiService.createNew(diaChi);
        }else {
            DiaChi diaChi = diaChiService.findById(req.getId()).orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
            modelMapper.map(req, diaChi);
            if (diaChi.getDiaChiMacDinh()){
                lstDiaChi.stream().forEach(item -> item.setDiaChiMacDinh(false));
            }
            diaChiService.update(diaChi);
        }
        return null;
    }
}

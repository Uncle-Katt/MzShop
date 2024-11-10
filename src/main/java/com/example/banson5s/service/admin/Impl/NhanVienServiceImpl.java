package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.diaChi.DiaChiDTO;
import com.example.banson5s.dto.admin.khachHang.KhachHangDTO;
import com.example.banson5s.dto.admin.mail.MailInputDTO;
import com.example.banson5s.dto.admin.nhanVien.NhanVienDTO;
import com.example.banson5s.entity.admin.ChucVu;
import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.entity.admin.NhanVien;
import com.example.banson5s.exception.AppException;
import com.example.banson5s.exception.ErrorCode;
import com.example.banson5s.repository.admin.INhanVienRepository;
import com.example.banson5s.service.admin.IKhachHangService;
import com.example.banson5s.service.admin.INhanVienService;
import com.example.banson5s.service.common.IMailService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import com.example.banson5s.ultiltes.RandomStringGenerator;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.concurrent.CompletableFuture;

@Service
public class NhanVienServiceImpl extends BaseServiceImpl<NhanVien, Long, INhanVienRepository>
        implements INhanVienService {

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    RandomStringGenerator randomStringGenerator;

    @Autowired
    private IMailService mailService;

    @Override
    public List<NhanVienDTO> findAllNhanVien(String value) {
        List<NhanVienDTO> lst = repository.findAllStaff(value).stream()
                .map(item -> modelMapper.map(item, NhanVienDTO.class)).toList();
        return lst;
    }

    @Override
    @Transactional
    public NhanVienDTO createNhanVien(NhanVienDTO dto) {
        String password = randomStringGenerator.generateRandomString(8);
        CompletableFuture<NhanVienDTO> saveTask = CompletableFuture.supplyAsync(() -> {
            NhanVien entity = modelMapper.map(dto, NhanVien.class);
            entity.setChucVu(ChucVu.builder().id(Long.valueOf(2)).build());
            entity.setMatKhau(passwordEncoder.encode(password));
            createNew(entity);
            return dto;
        });
        saveTask.thenRunAsync(() -> {
            if (dto.getEmail() != null) {
                MailInputDTO mailInput = new MailInputDTO();
                mailInput.setEmail(dto.getEmail());
                mailInput.setPassword(password);
                mailInput.setName(dto.getTenNhanVien());
                mailService.create(mailInput);
            }
        });
        return saveTask.join();
    }

    @Override
    public NhanVienDTO updateNhanVien(NhanVienDTO dto) {
        NhanVien entity = findById(dto.getId()).
                orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        modelMapper.map(dto, entity);
        update(entity);
        return dto;
    }

    @Override
    public NhanVienDTO detailNhanVien(Long id) {
        NhanVien entity = findById(id).
                orElseThrow(() -> new AppException(ErrorCode.INVALID_REQUEST));
        NhanVienDTO data = modelMapper.map(entity, NhanVienDTO.class);
        return data;
    }
}

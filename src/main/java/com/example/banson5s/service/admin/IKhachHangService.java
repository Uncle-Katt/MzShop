package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.khachHang.KhachHangDTO;
import com.example.banson5s.dto.admin.khachHang.KhachHangDiaChiDTO;
import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.service.common.IBaseService;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IKhachHangService extends IBaseService<KhachHang,Long> {

    List<KhachHangDTO> findAllCustomer(String value);

    KhachHangDTO createCustomer(KhachHangDTO khachHangDTO);

    KhachHangDTO updateCustomer(KhachHangDTO khachHangDTO);

    KhachHangDTO detailCustomer(Long customerId);

    KhachHangDiaChiDTO addressCustomer(KhachHangDiaChiDTO req);

}


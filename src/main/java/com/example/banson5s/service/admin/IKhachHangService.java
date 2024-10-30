package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.diaChi.DiaChiDTO;
import com.example.banson5s.dto.admin.khachHang.KhachHangDTO;
import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.service.common.IBaseService;

import java.util.List;

public interface IKhachHangService extends IBaseService<KhachHang,Long> {

    List<KhachHangDTO> findAllCustomer(String value);

    KhachHangDTO createCustomer(KhachHangDTO khachHangDTO);

    KhachHangDTO updateCustomer(KhachHangDTO khachHangDTO);

    KhachHangDTO detailCustomer(Long customerId);

    DiaChiDTO addressCustomer(DiaChiDTO req);


}


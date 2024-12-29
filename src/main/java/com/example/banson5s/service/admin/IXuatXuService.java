package com.example.banson5s.service.admin;

import com.example.banson5s.dto.admin.sanPham.ThuongHieuDTO;
import com.example.banson5s.dto.admin.sanPham.XuatXuDTO;
import com.example.banson5s.entity.admin.XuatXu;
import com.example.banson5s.service.common.IBaseService;

import java.util.List;

public interface IXuatXuService extends IBaseService<XuatXu,Long> {
    List<XuatXuDTO> findAllXuatXu(String value);
    XuatXuDTO createXuatXu(XuatXuDTO dto);
    XuatXuDTO updateXuatXu(XuatXuDTO dto);
    XuatXuDTO detailXuatXu(Long id);
}

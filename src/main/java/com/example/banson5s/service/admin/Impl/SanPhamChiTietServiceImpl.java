package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.enums.Status;
import com.example.banson5s.repository.admin.ISanPhamChiTietRepository;
import com.example.banson5s.service.admin.IKhoiLuongService;
import com.example.banson5s.service.admin.IMauSacService;
import com.example.banson5s.service.admin.ISanPhamChiTietService;
import com.example.banson5s.service.admin.ISanPhamService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SanPhamChiTietServiceImpl extends BaseServiceImpl<SanPhamChiTiet, Long, ISanPhamChiTietRepository>
        implements ISanPhamChiTietService {

    @Autowired
    ISanPhamService sanPhamService;

    @Autowired
    IMauSacService mauSacService;

    @Autowired
    IKhoiLuongService khoiLuongService;

    @Override
    public List<SanPhamChiTiet> findLstSanPhamChiTiet(String search) {
        List<SanPhamChiTiet> lst = repository.findLstSanPhamChiTiet(search, Status.HOAT_DONG.toString());
        return lst;
    }


}

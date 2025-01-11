package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.sanPham.SanPhamDTO;
import com.example.banson5s.entity.admin.DanhMuc;
import com.example.banson5s.entity.admin.IProductItem;
import com.example.banson5s.entity.admin.SanPham;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.entity.admin.ThuongHieu;
import com.example.banson5s.entity.admin.XuatXu;
import com.example.banson5s.repository.admin.ISanPhamChiTietRepository;
import com.example.banson5s.repository.admin.ISanPhamRepository;
import com.example.banson5s.service.admin.IDanhMucService;
import com.example.banson5s.service.admin.ISanPhamChiTietService;
import com.example.banson5s.service.admin.ISanPhamService;
import com.example.banson5s.service.admin.IThuongHieuService;
import com.example.banson5s.service.admin.IXuatXuService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SanPhamServiceImpl extends BaseServiceImpl<SanPham, Long, ISanPhamRepository>
        implements ISanPhamService {
    @Autowired
    IDanhMucService danhMucService;
    @Autowired
    IXuatXuService xuatXuService;
    @Autowired
    IThuongHieuService thuongHieuService;
    @Autowired
    ModelMapper modelMapper;

    @Override
    public List<IProductItem> getLstProductGroup(String search) {
        return repository.getLstProductGroup(search);
    }

    @Override
    public SanPhamDTO createSanPham(SanPhamDTO dto) {
        ThuongHieu thuongHieu = thuongHieuService.findById(dto.getThuongHieu()).orElseThrow();

        DanhMuc danhMuc = danhMucService.findById(dto.getDanhMuc()).orElseThrow();

        XuatXu xuatXu = xuatXuService.findById(dto.getXuatXu()).orElseThrow();

        SanPham sanPham = SanPham.builder().tenSanPham(dto.getTenSanPham()).danhMuc(danhMuc)
                .xuatXu(xuatXu).thuongHieu(thuongHieu)
                .trangThai(dto.getTrangThai())
                .build();

        createNew(sanPham);

        return dto;
    }

    @Override
    public SanPhamDTO updateSanpham(SanPhamDTO dto) {
        SanPham sanPham = findById(dto.getId()).orElseThrow();

        ThuongHieu thuongHieu = thuongHieuService.findById(dto.getThuongHieu()).orElseThrow();

        DanhMuc danhMuc = danhMucService.findById(dto.getDanhMuc()).orElseThrow();

        XuatXu xuatXu = xuatXuService.findById(dto.getXuatXu()).orElseThrow();

        sanPham.setTenSanPham(dto.getTenSanPham());
        sanPham.setDanhMuc(danhMuc);
        sanPham.setXuatXu(xuatXu);
        sanPham.setThuongHieu(thuongHieu);
        sanPham.setTrangThai(dto.getTrangThai());

        update(sanPham);
        return dto;
    }
}

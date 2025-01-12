package com.example.banson5s.service.admin.Impl;

import com.example.banson5s.dto.admin.sanPham.reponse.SanPhamDTO;
import com.example.banson5s.dto.admin.sanPham.reponse.SanPhamDetailDTO;
import com.example.banson5s.entity.admin.DanhMuc;
import com.example.banson5s.entity.admin.IProductItem;
import com.example.banson5s.entity.admin.KhoiLuong;
import com.example.banson5s.entity.admin.MauSac;
import com.example.banson5s.entity.admin.SanPham;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import com.example.banson5s.entity.admin.ThuongHieu;
import com.example.banson5s.entity.admin.XuatXu;
import com.example.banson5s.repository.admin.ISanPhamChiTietRepository;
import com.example.banson5s.repository.admin.ISanPhamRepository;
import com.example.banson5s.service.admin.IDanhMucService;
import com.example.banson5s.service.admin.IKhoiLuongService;
import com.example.banson5s.service.admin.IMauSacService;
import com.example.banson5s.service.admin.ISanPhamChiTietService;
import com.example.banson5s.service.admin.ISanPhamService;
import com.example.banson5s.service.admin.IThuongHieuService;
import com.example.banson5s.service.admin.IXuatXuService;
import com.example.banson5s.service.common.impl.BaseServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

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
    IMauSacService mauSacService;

    @Autowired
    IKhoiLuongService khoiLuongService;
    @Autowired
    ISanPhamChiTietRepository sanPhamChiTietRepository;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public List<IProductItem> getLstProductGroup(String search, String status) {
        return repository.getLstProductGroup(search, status);
    }

    @Override
    public SanPhamDTO createSanPham(SanPhamDTO dto) {
        ThuongHieu thuongHieu = thuongHieuService.findById(dto.getThuongHieu()).orElseThrow();
        DanhMuc danhMuc = danhMucService.findById(dto.getDanhMuc()).orElseThrow();
        XuatXu xuatXu = xuatXuService.findById(dto.getXuatXu()).orElseThrow();
        SanPham sanPham = SanPham.builder().tenSanPham(dto.getTenSanPham()).danhMuc(danhMuc)
                .xuatXu(xuatXu).thuongHieu(thuongHieu)
                .trangThai(dto.getTrangThai())
                .urlAnh(dto.getUrlAnh())
                .build();
        SanPham sanPhamEntity = createNew(sanPham);
        List<SanPhamChiTiet> listSanPhamChiTiet = dto.getLstChiTietSanPham().stream().map(item -> {
            MauSac mauSac = mauSacService.findById(item.getMauSacId()).orElseThrow();
            KhoiLuong khoiLuong = khoiLuongService.findById(item.getKhoiLuongId()).orElseThrow();
            SanPhamChiTiet entity = SanPhamChiTiet.builder()
                    .khoiLuong(khoiLuong)
                    .mauSac(mauSac)
                    .sanPham(sanPhamEntity)
                    .soLuong(Integer.valueOf(item.getSoLuong()))
                    .giaBan(BigDecimal.valueOf(Double.valueOf(item.getGiaBan())))
                    .build();
            return entity;
        }).toList();
        sanPhamChiTietRepository.saveAll(listSanPhamChiTiet);
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
        sanPham.setUrlAnh(dto.getUrlAnh());

        List<SanPhamChiTiet> lstFlagSanPhamChiTiet = sanPham.getLstChiTietSanPham().stream().toList();


        // Lọc các phần tử trong lstFlagSanPhamChiTiet không có trong listSanPhamChiTiet để xóa
        List<SanPhamChiTiet> itemsNotInList = lstFlagSanPhamChiTiet.stream()
                .filter(item -> dto.getLstChiTietSanPham().stream()
                        .noneMatch(existingItem ->
                                existingItem.getKhoiLuongId().equals(item.getKhoiLuong().getId())
                                && existingItem.getMauSacId().equals(item.getMauSac().getId())
                                && dto.getId().equals(item.getSanPham().getId())
                        )) // Lọc những item không có trong listSanPhamChiTiet
                .peek(item -> item.setXoaMem(true)).toList();
        sanPhamChiTietRepository.saveAll(itemsNotInList);


        List<SanPhamChiTiet> listSanPhamChiTiet = dto.getLstChiTietSanPham().stream().map(item -> {
            item.setSanPhamId(dto.getId());
            Optional<SanPhamChiTiet> otp = sanPhamChiTietRepository.findSanPhamChiTietBySanPham(item);
            if (otp.isPresent()) {
                SanPhamChiTiet entity = otp.get();
                entity.setSoLuong(Integer.valueOf(item.getSoLuong()));
                entity.setGiaBan(BigDecimal.valueOf(Double.valueOf(item.getGiaBan())));
                return entity;
            }else {
                MauSac mauSac = mauSacService.findById(item.getMauSacId()).orElseThrow();
                KhoiLuong khoiLuong = khoiLuongService.findById(item.getKhoiLuongId()).orElseThrow();
                SanPhamChiTiet entity = SanPhamChiTiet.builder()
                        .khoiLuong(khoiLuong)
                        .mauSac(mauSac)
                        .sanPham(sanPham)
                        .soLuong(Integer.valueOf(item.getSoLuong()))
                        .giaBan(BigDecimal.valueOf(Double.valueOf(item.getGiaBan())))
                        .build();
                return entity;
            }
        }).toList();
        sanPhamChiTietRepository.saveAll(listSanPhamChiTiet);
        update(sanPham);
        return dto;
    }

    @Override
    public SanPhamDetailDTO detailSanpham(Long sanPhamId) {
        SanPham sanPham = findById(sanPhamId).orElseThrow();
        Set<SanPhamChiTiet> lstSanPhamChiTiet = sanPham.getLstChiTietSanPham().stream().filter(item -> !item.isXoaMem()).collect(Collectors.toSet());
        sanPham.setLstChiTietSanPham(lstSanPhamChiTiet);
        SanPhamDetailDTO data = modelMapper.map(sanPham, SanPhamDetailDTO.class);
        return data;
    }

}

package com.example.banson5s.dto.admin.sanPham.reponse;

import com.example.banson5s.dto.admin.sanPham.request.SanPhamChiTietDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class SanPhamDTO {

    private Long id;

    private String tenSanPham;

    private Long danhMuc;

    private Long thuongHieu;

    private Long xuatXu;

    private String trangThai;

    private String urlAnh;

    private List<SanPhamChiTietDTO> lstChiTietSanPham;

}

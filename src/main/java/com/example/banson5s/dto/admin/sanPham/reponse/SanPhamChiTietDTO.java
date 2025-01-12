package com.example.banson5s.dto.admin.sanPham.reponse;

import com.example.banson5s.dto.admin.sanPham.KhoiLuongDTO;
import com.example.banson5s.dto.admin.sanPham.MauSacDTO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SanPhamChiTietDTO {

    private Long id;

    private KhoiLuongDTO khoiLuong;

    private MauSacDTO mauSac;

    private Integer soLuong;

    private Integer giaBan;
}

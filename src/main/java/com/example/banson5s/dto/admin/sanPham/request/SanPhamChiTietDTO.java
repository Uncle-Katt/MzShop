package com.example.banson5s.dto.admin.sanPham.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SanPhamChiTietDTO {
    private Long sanPhamId;
    private Long khoiLuongId;
    private Long mauSacId;
    private String soLuong;
    private String giaBan;
}

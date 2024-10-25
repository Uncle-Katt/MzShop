package com.example.banson5s.dto.admin.sales;

import com.example.banson5s.entity.admin.KhoiLuong;
import com.example.banson5s.entity.admin.MauSac;
import com.example.banson5s.entity.admin.SanPham;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SanPhamSalesDTO {
    private int id;
    private MauSac mauSac;
    private KhoiLuong khoiLuong;
    private SanPham sanPham;
    private String urlAnh;
    private Integer soLuong;
    private String maVach;
    private Double giaBan;
    private Boolean trangThai;
}

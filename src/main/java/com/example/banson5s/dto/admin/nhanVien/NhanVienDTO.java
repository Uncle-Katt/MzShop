package com.example.banson5s.dto.admin.nhanVien;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NhanVienDTO {
    private Long id;
    private String tenNhanVien;
    private String sdt;
    private String diaChi;
    private String email;
    private String ngaySinh;
    private String gioiTinh;
}

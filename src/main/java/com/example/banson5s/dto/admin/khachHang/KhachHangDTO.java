package com.example.banson5s.dto.admin.khachHang;

import com.example.banson5s.dto.admin.diaChi.DiaChiDTO;
import com.example.banson5s.entity.admin.DiaChi;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;
import java.util.Set;

@Getter
@Setter
public class KhachHangDTO {
    private Long id;
    private String hoVaTen;
    private String ngaySinh;
    private String gioiTinh;
    private String email;
    private String soDienThoai;
    private List<DiaChiDTO> lstDiaChi;
}

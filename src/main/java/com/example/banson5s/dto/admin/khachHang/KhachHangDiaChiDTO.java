package com.example.banson5s.dto.admin.khachHang;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class KhachHangDiaChiDTO {
    private Long customerId;
    private Long id;
    private String tenNguoiNhan;
    private String dienThoaiNguoiNhan;
    private String diaChiChiTiet;
    private String xa;
    private String huyen;
    private String tinh;
    private Boolean diaChiMacDinh;
}

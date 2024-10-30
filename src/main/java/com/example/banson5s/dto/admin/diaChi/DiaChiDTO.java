package com.example.banson5s.dto.admin.diaChi;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DiaChiDTO {
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

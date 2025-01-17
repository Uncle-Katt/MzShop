package com.example.banson5s.dto.admin.voucher;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;


@Getter
@Setter
public class VoucherDTO {
    private Long id;

    private String maPhieuGiamGia;

    private String tenPhieuGiamGia;

    private String giaTriGiam;

    private String dieuKienApDung;

    private String ngayBatDau;

    private String ngayKetThuc;

    private String soLuong;

    private String moTa;

    private String trangThai;
}

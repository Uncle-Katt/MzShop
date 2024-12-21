package com.example.banson5s.dto.admin.order;

import com.example.banson5s.entity.admin.SanPhamChiTiet;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class OrderBillDetailDTO {
    private Long id;

    private SanPhamChiTiet sanPhamChiTiet;

    private BigDecimal giaBan;

    private BigDecimal giaGoc;

    private BigDecimal giaGiam;

    private Integer soLuong;

    private String moTa;
}

package com.example.banson5s.dto.admin.order;

import com.example.banson5s.entity.admin.HoaDon;
import com.example.banson5s.entity.admin.SanPhamChiTiet;
import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class OrderHistoryBillDetailDTO {
    private Long id;
    private String loai;
    private String moTa;
}

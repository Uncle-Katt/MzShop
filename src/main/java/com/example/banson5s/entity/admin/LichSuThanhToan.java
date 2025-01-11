package com.example.banson5s.entity.admin;

import com.example.banson5s.entity.common.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;

import java.math.BigDecimal;


@Entity
@Table(name = "lich_su_thanh_toan")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@DynamicUpdate
@Getter
@Setter
public class LichSuThanhToan extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_hoa_don")
    private HoaDon hoaDon;

    @Column(name = "ma_giao_dich")
    private String maGiaoDich;

    @Column(name = "loai_thanh_toan")
    private String loaiThanhToan;

    @Column(name = "so_tien_thanh_toan")
    private BigDecimal soTienThanhToan;

    @Column(name = "mo_ta")
    private String moTa;
}

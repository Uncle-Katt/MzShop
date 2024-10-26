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
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "PhieuGiamGia")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PhieuGiamGia extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ma_phieu_giam_gia")
    private String maPhieuGiamGia;

    @Column(name = "ten_phieu_giam_gia")
    private String tenPhieuGiamGia;

    @Column(name = "loai_phieu_giam_gia")
    private String loaiPhieuGiamGia;

    @Column(name = "gia_tri_giam")
    private BigDecimal giaTriGiam;

    @Column(name = "dieu_kien_ap_dung")
    private String dieuKienApDung;

    @Column(name = "ngay_bat_dau")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayBatDau;

    @Column(name = "ngay_ket_thuc")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayKetThuc;

    @ManyToOne
    @JoinColumn(name = "id_hoa_don")
    private HoaDon hoaDon;

    @Column(name = "so_luong")
    private Integer soLuong;

    @Column(name = "mo_ta")
    private String moTa;

    @Column(name = "trang_thai")
    private String trangThai;
}

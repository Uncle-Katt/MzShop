package com.example.banson5s.SanPham.Entity;

import com.example.banson5s.ChucNang.Entity.KhachHang;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "danh_gia")
public class DanhGia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_san_pham_chi_tiet")
    private SanPhamChiTiet sanPhamChiTiet;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang")
    private KhachHang khachHang;

    @Column(name = "so_sao")
    private Integer soSao;

    @Column(name = "nhan_xet")
    private String nhanXet;

    @Column(name = "ngay_danh_gia")
    private Date ngayDanhGia;

    // Getters và Setters
}


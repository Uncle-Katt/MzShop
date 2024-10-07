package com.example.banson5s.BanHang.Entity;

import com.example.banson5s.ChucNang.Entity.KhachHang;
import com.example.banson5s.SanPham.Entity.SanPhamChiTiet;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "gio_hang")
public class GioHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_san_pham_chi_tiet")
    private SanPhamChiTiet sanPhamChiTiet;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang")
    private KhachHang khachHang;

    @Column(name = "so_luong")
    private int soLuong;

    @Column(name = "tong_tien")
    private double tongTien;

    @Column(name = "trang_thai")
    private Integer trangThai;

    // Getters và Setters
}


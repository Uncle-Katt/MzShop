package com.example.banson5s.entity.admin;

import com.example.banson5s.entity.common.BaseEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "DiaChi")
public class DiaChi  extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang", referencedColumnName = "id")
    private KhachHang khachHang;

    @Column(name = "ten_nguoi_nhan", length = 255)
    private String tenNguoiNhan;

    @Column(name = "dien_thoai_nguoi_nhan", length = 15)
    private String dienThoaiNguoiNhan;

    @Column(name = "dia_chi_chi_tiet", length = 255)
    private String diaChiChiTiet;

    @Column(name = "xa", length = 255)
    private String xa;

    @Column(name = "huyen", length = 255)
    private String huyen;

    @Column(name = "tinh", length = 255)
    private String tinh;

    @Column(name = "dia_chi_mac_dinh")
    private boolean diaChiMacDinh;
}

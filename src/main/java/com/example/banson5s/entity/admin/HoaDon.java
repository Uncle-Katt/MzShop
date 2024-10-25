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
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity
@Table(name = "HoaDon")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HoaDon extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang", referencedColumnName = "id")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "id_nhan_vien", referencedColumnName = "id")
    private NhanVien nhanVien;

    @ManyToOne
    @JoinColumn(name = "id_phuong_thuc_thanh_toan", referencedColumnName = "id")
    private PhuongThucThanhToan phuongThucThanhToan;

    @Column(name = "ma_hoa_don", length = 255)
    private String maHoaDon;

    @Column(name = "loai_hoa_don", length = 255)
    private String loaiHoaDon;

    @Column(name = "dinh_dang_hoa_don", length = 255)
    private String dinhDangHoaDon;

    @Column(name = "tong_tien", precision = 18, scale = 2)
    private double tongTien;

    @Column(name = "phi_van_chuyen", precision = 18, scale = 2)
    private double phiVanChuyen;

    @Column(name = "thanh_tien", precision = 18, scale = 2)
    private double thanhTien;

    @Column(name = "ngay_dat")
    private Date ngayDat;

    @Column(name = "trang_thai")
    private byte trangThai;

    @Column(name = "mo_ta", length = 255)
    private String moTa;

    @Column(name = "dia_chi_nguoi_nhan", length = 255)
    private String diaChiNguoiNhan;
}

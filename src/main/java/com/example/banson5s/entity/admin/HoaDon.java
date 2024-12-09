package com.example.banson5s.entity.admin;

import com.example.banson5s.entity.common.BaseEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "hoa_don")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@DynamicUpdate
public class HoaDon extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ma_hoa_don")
    private String maHoaDon;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "id_nhan_vien")
    private NhanVien nhanVien;

    @ManyToOne
    @JoinColumn(name = "id_phieu_giam_gia")
    private PhieuGiamGia phieuGiamGia;

    @Column(name = "phuong_thuc_thanh_toan")
    private String phuongThucThanhToan;

    @Column(name = "loai_hoa_don")
    private String loaiHoaDon;

    @Column(name = "hinh_thuc_hoa_don")
    private String hinhThucHoaDon;

    @Column(name = "tong_tien")
    private BigDecimal tongTien;

    @Column(name = "tien_giam")
    private BigDecimal tienGiam;

    @Column(name = "phi_van_chuyen")
    private BigDecimal phiVanChuyen;

    @Column(name = "thanh_tien")
    private BigDecimal thanhTien;

    @Column(name = "ngay_dat")
    @Temporal(TemporalType.DATE)
    private Date ngayDat;

    @Column(name = "ngay_giao")
    @Temporal(TemporalType.DATE)
    private Date ngayGiao;

    @Column(name = "ngay_hoan_thanh")
    @Temporal(TemporalType.DATE)
    private Date ngayHoanThanh;

    @Column(name = "ten_nguoi_nhan")
    private String tenNguoiNhan;

    @Column(name = "so_dien_thoai_nguoi_nhan")
    private String soDienThoaiNguoiNhan;

    @Column(name = "dia_chi_nguoi_nhan")
    private String diaChiNguoiNhan;

    @Column(name = "trang_thai")
    private String trangThai;

    @Column(name = "mo_ta")
    private String moTa;

    @OneToMany(mappedBy = "hoaDon")
    @JsonIgnore
    private Set<HoaDonChiTiet> lstHoaDonChiTiet;

}

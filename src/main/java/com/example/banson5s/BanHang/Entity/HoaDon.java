package com.example.banson5s.BanHang.Entity;

import com.example.banson5s.ChucNang.Entity.KhachHang;
import com.example.banson5s.ChucNang.Entity.NhanVien;
import com.example.banson5s.ChucNang.Entity.PhieuGiamGia;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@Getter
@Setter

@AllArgsConstructor

@Entity
@Table(name = "hoa_don")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "id_nhan_vien")
    private NhanVien nhanVien;

    @ManyToOne
    @JoinColumn(name = "id_phuong_thuc_thanh_toan")
    private PhuongThucThanhToan phuongThucThanhToan;


    @Column(name = "ma")
    private String maHD;

    @Column(name = "tong_tien")
    private double tongTien;

    @Column(name = "thanh_tien")
    private double thanhTien;




    @Column(name = "ngay_tao")
    @Temporal(TemporalType.DATE) // Thêm annotation này
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date ngayTao;

    @Column(name = "ngay_sua")
    @Temporal(TemporalType.DATE) // Thêm annotation này
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date ngaySua;

    @Column(name = "ngay_thanh_toan")
    @Temporal(TemporalType.DATE) // Thêm annotation này
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date ngayThanhToan;

    @Column(name = "loai_trang_thai")
    private Integer trangThai;
    public HoaDon() {
        this.ngayTao = new Date(); // Ngày tạo mặc định là ngày hiện tại
        this.tongTien = 0.0; // Giá trị mặc định
        this.thanhTien = 0.0; // Giá trị mặc định
        this.trangThai = 0; // Trạng thái mặc định, ví dụ: chưa thanh toán
    }

    // Getters và Setters
}


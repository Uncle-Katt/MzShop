package com.example.banson5s.dto.admin.order;

import com.example.banson5s.entity.admin.KhachHang;
import com.example.banson5s.entity.admin.NhanVien;
import com.example.banson5s.entity.admin.PhieuGiamGia;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

@Getter
@Setter
public class OrderBillListDTO {
    private Long id;

    private String maHoaDon;

    private String phuongThucThanhToan;

    private String loaiHoaDon;

    private String hinhThucHoaDon;

    private BigDecimal tongTien;

    private BigDecimal tienGiam;

    private BigDecimal phiVanChuyen;

    private BigDecimal thanhTien;

    private Date ngayDat;

    private Date ngayGiao;

    private Date ngayHoanThanh;

    private String tenNguoiNhan;

    private String soDienThoaiNguoiNhan;

    private String diaChiNguoiNhan;

    private String trangThai;

    private String moTa;

}

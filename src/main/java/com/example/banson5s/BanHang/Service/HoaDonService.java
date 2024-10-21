package com.example.banson5s.BanHang.Service;

import com.example.banson5s.BanHang.Entity.HoaDon;
import com.example.banson5s.BanHang.Entity.PhuongThucThanhToan;
import com.example.banson5s.BanHang.Repository.HoaDonRepo;
import com.example.banson5s.BanHang.Repository.KhachHangRepo;
import com.example.banson5s.BanHang.Repository.NhanVienRepo;
import com.example.banson5s.BanHang.Repository.PhuongThucThanhToanRepo;
import com.example.banson5s.ChucNang.Entity.KhachHang;
import com.example.banson5s.ChucNang.Entity.NhanVien;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class HoaDonService {

    @Autowired
    HoaDonRepo hoaDonRepo1;
    @Autowired
    private KhachHangRepo khachHangRepo;

    @Autowired
    private NhanVienRepo nhanVienRepo;

    @Autowired
    private PhuongThucThanhToanRepo phuongThucThanhToanRepo;
    public HoaDon createEmptyHoaDon(Long khachHangId, Long nhanVienId, Long phuongThucThanhToanId) {
        HoaDon hoaDon = new HoaDon();
        // Thiết lập giá trị mặc định
        hoaDon.setKhachHang(new KhachHang(khachHangId)); // Lưu ý: cần phải tạo constructor phù hợp cho KhachHang
        hoaDon.setNhanVien(new NhanVien(nhanVienId)); // Lưu ý: cần phải tạo constructor phù hợp cho NhanVien
        hoaDon.setPhuongThucThanhToan(new PhuongThucThanhToan(phuongThucThanhToanId)); // Lưu ý: cần phải tạo constructor phù hợp cho PhuongThucThanhToan
        hoaDon.setMaHD("HD-" + System.currentTimeMillis()); // Tạo mã hóa đơn ngẫu nhiên
        hoaDon.setTongTien(0.0); // Tổng tiền mặc định
        hoaDon.setThanhTien(0.0); // Thành tiền mặc định
        hoaDon.setNgayTao(new Date()); // Ngày tạo
        hoaDon.setTrangThai(0); // Trạng thái mặc định (0: chưa thanh toán)
        return hoaDonRepo1.save(hoaDon); // Lưu hóa đơn
    }
}

-- KhachHang
INSERT INTO KhachHang (Ma_khach_hang, ho_va_ten, ngay_sinh, gioi_tinh, email, So_dien_thoai, mat_khau, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('KH001', 'Nguyen Van A', '1990-05-01', 'Nam', 'vana@example.com', '0123456789', 'password123', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    ('KH002', 'Tran Thi B', '1995-08-15', 'Nu', 'tranb@example.com', '0987654321', 'password456', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0);

-- DiaChi
INSERT INTO DiaChi (id_khach_hang, ten_nguoi_nhan, dien_thoai_nguoi_nhan, dia_chi_chi_tiet, xa, huyen, tinh, dia_chi_mac_dinh, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    (1, 'Nguyen Van A', '0123456789', '123 Nguyen Van Cu', 'Phuong 1', 'Quan 1', 'TPHCM', 1, 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    (2, 'Tran Thi B', '0987654321', '456 Le Duan', 'Phuong 2', 'Quan 2', 'Hanoi', 0, 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0);

-- XuatXu
INSERT INTO XuatXu (ten_xuat_xu, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('Vietnam', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    ('China', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0);

-- DanhMuc
INSERT INTO DanhMuc (ten_danh_muc, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('Son Môi', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    ('Phấn Mắt', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0);

-- ThuongHieu
INSERT INTO ThuongHieu (ten_thuong_hieu, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('Maybelline', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    ('LOreal', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0);

-- SanPham
INSERT INTO SanPham (id_xuat_xu, id_danh_muc, id_thuong_hieu, ten_san_pham, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem, so_luong_da_ban)
VALUES
    (1, 1, 1, 'Son Môi Hồng Nhạt', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0, 100),
    (1, 1, 1, 'Son Môi Đỏ Gạch', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0, 150),
    (2, 1, 2, 'Son Môi Cam Đào', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0, 200);

-- MauSac
INSERT INTO MauSac (ten_mau_sac, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('Hồng Nhạt', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    ('Đỏ Gạch', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    ('Cam Đào', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0);

-- KhoiLuong
INSERT INTO KhoiLuong (ten_khoi_luong, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('3g', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    ('4g', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    ('5g', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0);

-- SanPhamChiTiet
INSERT INTO SanPhamChiTiet (id_mau_sac, id_khoi_luong, id_san_pham, url_anh, so_luong, ma_vach, ngay_tao, ngay_sua, trang_thai, nguoi_tao, nguoi_sua, xoa_mem, gia_ban)
VALUES
    (1, 1, 1, 'url_hong_nhat.jpg', 100, '1234567890123', '2024-01-01', '2024-01-01', 1, 'Admin', 'Admin', 0, 150.00),
    (2, 2, 2, 'url_do_gach.jpg', 150, '1234567890124', '2024-01-01', '2024-01-01', 1, 'Admin', 'Admin', 0, 200.00),
    (3, 3, 3, 'url_cam_dao.jpg', 200, '1234567890125', '2024-01-01', '2024-01-01', 1, 'Admin', 'Admin', 0, 180.00);

-- GioHang
INSERT INTO GioHang (id_khach_hang)
VALUES
    (1),
    (2);

-- GioHangChiTiet
INSERT INTO GioHangChiTiet (id_san_pham_chi_tiet, id_gio_hang, so_luong, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    (1, 1, 2, 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    (2, 1, 1, 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    (3, 2, 3, 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0);

-- ChucVu
INSERT INTO ChucVu (ten_chuc_vu)
VALUES
    ('Quản lý'),
    ('Nhân viên bán hàng');

-- NhanVien
INSERT INTO NhanVien (id_chuc_vu, ten_nhan_vien, sdt, dia_chi, email, ngay_sinh, gioi_tinh, mat_khau, ngay_tao, ngay_sua, nguoi_tao, nguoi_sua, xoa_mem)
VALUES
    (1, 'Nguyen Van C', '0123456789', '789 Hoang Hoa Tham', 'vanc@example.com', '1992-03-10', 'Nam', 'password789', '2024-01-01', '2024-01-01', 'Admin', 'Admin', 0),
    (2, 'Tran Thi D', '0987654321', '321 Nguyen Thi Minh Khai', 'trand@example.com', '1994-07-20', 'Nu', 'password101', '2024-01-01', '2024-01-01', 'Admin', 'Admin', 0);

-- PhuongThucThanhToan
INSERT INTO PhuongThucThanhToan (ma, ten, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('PT001', 'Tiền mặt', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    ('PT002', 'Chuyển khoản', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0);

-- HoaDon
INSERT INTO HoaDon (id_khach_hang, id_nhan_vien, id_phuong_thuc_thanh_toan, ma_hoa_don, loai_hoa_don, dinh_dang_hoa_don, tong_tien, phi_van_chuyen, thanh_tien, ngay_dat, trang_thai, mo_ta, nguoi_tao, ngay_tao, nguoi_sua, ngay_sua, dia_chi_nguoi_nhan, xoa_mem)
VALUES
    (1, 1, 1, 'HD001', 'Bán lẻ', 'PDF', 300.00, 30.00, 270.00, '2024-01-01', 1, 'Mua sản phẩm A', 'Admin', '2024-01-01', 'Admin', '2024-01-01', '123 Nguyen Van Cu', 0),
    (2, 2, 2, 'HD002', 'Bán sỉ', 'PDF', 600.00, 60.00, 540.00, '2024-01-01', 1, 'Mua sản phẩm B', 'Admin', '2024-01-01', 'Admin', '2024-01-01', '456 Le Duan', 0);

-- HoaDonChiTiet
INSERT INTO HoaDonChiTiet (id_hoa_don, id_san_pham_chi_tiet, ma_hoa_don_chi_tiet, gia_ban, so_luong, mo_ta, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    (1, 1, 'HDCT001', 150.00, 2, 'Son Môi Hồng Nhạt', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    (1, 2, 'HDCT002', 200.00, 1, 'Son Môi Đỏ Gạch', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    (2, 3, 'HDCT003', 180.00, 3, 'Son Môi Cam Đào', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0);

-- PhieuGiamGia
INSERT INTO PhieuGiamGia (ma_phieu_giam_gia, ten_phieu_giam_gia, loai_phieu_giam_gia, gia_tri_giam, dieu_kien_ap_dung, ngay_bat_dau, ngay_ket_thuc, id_hoa_don, so_luong, mo_ta, trang_thai, ngay_tao, ngay_sua, nguoi_tao, nguoi_sua, xoa_mem)
VALUES
    ('GG001', 'Giảm 10%', 'Phần trăm', 10, 'Đơn hàng trên 200k', '2024-01-01', '2024-12-31', 1, 100, 'Giảm giá cho đơn hàng đầu tiên', 1, '2024-01-01', '2024-01-01', 'Admin', 'Admin', 0),
    ('GG002', 'Giảm 50k', 'Cố định', 50000, 'Đơn hàng trên 500k', '2024-01-01', '2024-12-31', 2, 50, 'Giảm giá cho khách hàng cũ', 1, '2024-01-01', '2024-01-01', 'Admin', 'Admin', 0);

-- LichSuThanhToan
INSERT INTO LichSuThanhToan (id_hoa_don, loai_than_toan, so_tien_thanh_toan, mo_ta, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    (1, 'Tiền mặt', 270.00, 'Thanh toán đơn hàng HD001', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0),
    (2, 'Chuyển khoản', 540.00, 'Thanh toán đơn hàng HD002', 'Admin', 'Admin', '2024-01-01', '2024-01-01', 0);

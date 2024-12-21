-- Fake data for khach_hang
INSERT INTO khach_hang (ho_va_ten, ngay_sinh, gioi_tinh, email, so_dien_thoai, mat_khau, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('Nguyen Van A', '1990-01-01', 'Nam', 'nguyenvana@gmail.com', '0912345678', 'password1', 'Admin', 'Admin', GETDATE(), GETDATE(), 0),
    ('Tran Thi B', '1995-05-15', 'Nu', 'tranthib@gmail.com', '0987654321', 'password2', 'Admin', 'Admin', GETDATE(), GETDATE(), 0);

-- Fake data for dia_chi
INSERT INTO dia_chi (id_khach_hang, ten_nguoi_nhan, dien_thoai_nguoi_nhan, dia_chi_chi_tiet, xa, huyen, tinh, dia_chi_mac_dinh, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    (1, 'Nguyen Van A', '0912345678', '123 Le Loi', 'Phuong 1', 'Quan 1', 'TPHCM', 1, 'Admin', 'Admin', GETDATE(), GETDATE(), 0),
    (2, 'Tran Thi B', '0987654321', '456 Tran Hung Dao', 'Phuong 2', 'Quan 2', 'TPHCM', 0, 'Admin', 'Admin', GETDATE(), GETDATE(), 0);

-- Fake data for xuat_xu
INSERT INTO xuat_xu (ten_xuat_xu, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('Vietnam', 'Admin', 'Admin', GETDATE(), GETDATE(), 0),
    ('USA', 'Admin', 'Admin', GETDATE(), GETDATE(), 0);

-- Fake data for doanh_muc
INSERT INTO doanh_muc (ten_danh_muc, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('Thoi trang', 'Admin', 'Admin', GETDATE(), GETDATE(), 0),
    ('Dien tu', 'Admin', 'Admin', GETDATE(), GETDATE(), 0);

-- Fake data for thuong_hieu
INSERT INTO thuong_hieu (ten_thuong_hieu, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('Apple', 'Admin', 'Admin', GETDATE(), GETDATE(), 0),
    ('Samsung', 'Admin', 'Admin', GETDATE(), GETDATE(), 0);

-- Fake data for san_pham
INSERT INTO san_pham (id_xuat_xu, id_danh_muc, id_thuong_hieu, ten_san_pham, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    (1, 2, 1, 'iPhone 14', 'Admin', 'Admin', GETDATE(), GETDATE(), 0),
    (2, 2, 2, 'Galaxy S22', 'Admin', 'Admin', GETDATE(), GETDATE(), 0);

-- Fake data for mau_sac
INSERT INTO mau_sac (ten_mau_sac, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('Đỏ', 'Admin', 'Admin', GETDATE(), GETDATE(), 0),
    ('Xanh', 'Admin', 'Admin', GETDATE(), GETDATE(), 0);

-- Fake data for khoi_luong
INSERT INTO khoi_luong (ten_khoi_luong, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
    ('500g', 'Admin', 'Admin', GETDATE(), GETDATE(), 0),
    ('1kg', 'Admin', 'Admin', GETDATE(), GETDATE(), 0);

-- Fake data for san_pham_chi_tiet
INSERT INTO san_pham_chi_tiet (id_mau_sac, id_khoi_luong, id_san_pham, url_anh, so_luong, ma_vach, gia_ban, trang_thai, ngay_tao, ngay_sua, nguoi_tao, nguoi_sua, xoa_mem)
VALUES
    (1, 1, 1, 'image1.jpg', 100, '123456789012', 1500000.00, 'Available', GETDATE(), GETDATE(), 'Admin', 'Admin', 0),
    (2, 2, 2, 'image2.jpg', 50, '987654321098', 2000000.00, 'Available', GETDATE(), GETDATE(), 'Admin', 'Admin', 0);

-- Add similar inserts for other tables if necessary.
INSERT INTO phieu_giam_gia
(ma_phieu_giam_gia, ten_phieu_giam_gia,  gia_tri_giam, dieu_kien_ap_dung, ngay_bat_dau, ngay_ket_thuc, so_luong, mo_ta, trang_thai, ngay_tao, ngay_sua, nguoi_tao, nguoi_sua, xoa_mem)
VALUES
    ('GG001', N'Giảm giá khai trương', 10.00, N'Áp dụng cho hóa đơn từ 500,000 VND', '2024-12-01 00:00:00', '2024-12-31 23:59:59', 100, N'Khuyến mãi khai trương', N'DANG_DIEN_RA', '2024-12-01 09:00:00', NULL, N'Admin', NULL, 0),
    ('GG002', N'Giảm giá cuối năm', 50000.00, N'Áp dụng cho hóa đơn từ 1,000,000 VND', '2024-12-15 00:00:00', '2024-12-31 23:59:59', 50, N'Khuyến mãi cuối năm', N'DANG_DIEN_RA', '2024-12-10 10:00:00', NULL, N'Admin', NULL, 0),
    ('GG003', N'Giảm giá Black Friday', 20.00, N'Áp dụng cho tất cả sản phẩm', '2024-11-29 00:00:00', '2024-11-29 23:59:59', 200, N'Khuyến mãi Black Friday', N'DANG_DIEN_RA', '2024-11-01 08:00:00', '2024-11-30 12:00:00', N'Admin', N'Marketing', 1),
    ('GG004', N'Giảm giá Tết 2024',100000.00, N'Áp dụng cho hóa đơn từ 2,000,000 VND', '2024-01-01 00:00:00', '2024-02-15 23:59:59', 300, N'Khuyến mãi dịp Tết', N'DANG_DIEN_RA', '2024-12-01 09:00:00', NULL, N'Admin', NULL, 0),
    ('GG005', N'Giảm giá thành viên', 15.00, N'Áp dụng cho thành viên VIP', '2024-01-01 00:00:00', '2024-06-30 23:59:59', 500, N'Ưu đãi cho thành viên', N'DANG_DIEN_RA', '2024-12-05 14:00:00', NULL, N'Admin', NULL, 0);

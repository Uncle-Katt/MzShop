create database DATN_5SShop
use DATN_5SShop

-- Table: khach_hang
CREATE TABLE khach_hang (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ho_va_ten NVARCHAR(255),
    ngay_sinh DATE,
    gioi_tinh NVARCHAR(10),
    email NVARCHAR(255),
    so_dien_thoai NVARCHAR(50),
    mat_khau NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: dia_chi
CREATE TABLE dia_chi (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_khach_hang INT FOREIGN KEY REFERENCES khach_hang(id),
    ten_nguoi_nhan NVARCHAR(255),
    dien_thoai_nguoi_nhan NVARCHAR(50),
    dia_chi_chi_tiet NVARCHAR(255),
    xa NVARCHAR(100),
    huyen NVARCHAR(100),
    tinh NVARCHAR(100),
    dia_chi_mac_dinh BIT,
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: xuat_xu
CREATE TABLE xuat_xu (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_xuat_xu NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: danh_muc
CREATE TABLE danh_muc (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_danh_muc NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: thuong_hieu
CREATE TABLE thuong_hieu (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_thuong_hieu NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: san_pham
CREATE TABLE san_pham (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_xuat_xu INT FOREIGN KEY REFERENCES xuat_xu(id),
    id_danh_muc INT FOREIGN KEY REFERENCES danh_muc(id),
    id_thuong_hieu INT FOREIGN KEY REFERENCES thuong_hieu(id),
    ten_san_pham NVARCHAR(255),
    url_anh NVARCHAR(255),
	trang_thai NVARCHAR(50),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: mau_sac
CREATE TABLE mau_sac (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_mau_sac NVARCHAR(50),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: khoi_luong
CREATE TABLE khoi_luong (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_khoi_luong NVARCHAR(50),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: san_pham_chi_tiet
CREATE TABLE san_pham_chi_tiet (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_mau_sac INT FOREIGN KEY REFERENCES mau_sac(id),
    id_khoi_luong INT FOREIGN KEY REFERENCES khoi_luong(id),
    id_san_pham INT FOREIGN KEY REFERENCES san_pham(id),
    url_anh NVARCHAR(255),
    so_luong INT,
    ma_vach NVARCHAR(50),
    gia_ban DECIMAL(18, 2),
    trang_thai NVARCHAR(50),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    xoa_mem BIT,
);

-- Table: gio_hang
CREATE TABLE gio_hang (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_khach_hang INT FOREIGN KEY REFERENCES khach_hang(id)
);

-- Table: gio_hang_chi_tiet
CREATE TABLE gio_hang_chi_tiet (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_san_pham_chi_tiet INT FOREIGN KEY REFERENCES san_pham_chi_tiet(id),
    id_gio_hang INT FOREIGN KEY REFERENCES gio_hang(id),
    so_luong INT,
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: chuc_vu
CREATE TABLE chuc_vu (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_chuc_vu NVARCHAR(50)
);

-- Table: nhan_vien
CREATE TABLE nhan_vien (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_chuc_vu INT FOREIGN KEY REFERENCES chuc_vu(id),
    ten_nhan_vien NVARCHAR(255),
    sdt NVARCHAR(50),
    dia_chi NVARCHAR(255),
    email NVARCHAR(255),
    ngay_sinh DATE,
    gioi_tinh NVARCHAR(10),
    mat_khau NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    xoa_mem BIT
);

-- Table: phieu_giam_gia
CREATE TABLE phieu_giam_gia (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ma_phieu_giam_gia NVARCHAR(50),
    ten_phieu_giam_gia NVARCHAR(255),
    gia_tri_giam DECIMAL(18, 2),
    dieu_kien_ap_dung DECIMAL(18, 2),
    ngay_bat_dau DATETIME,
    ngay_ket_thuc DATETIME,
    so_luong INT,
    mo_ta NVARCHAR(255),
    trang_thai NVARCHAR(50),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    xoa_mem BIT
);

-- Table: hoa_don
CREATE TABLE hoa_don (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_khach_hang INT FOREIGN KEY REFERENCES khach_hang(id),
    id_nhan_vien INT FOREIGN KEY REFERENCES nhan_vien(id),
    id_phieu_giam_gia INT FOREIGN KEY REFERENCES phieu_giam_gia(id),
	ma_hoa_don NVARCHAR(50),
    phuong_thuc_thanh_toan NVARCHAR(255),
    loai_hoa_don NVARCHAR(50),
    hinh_thuc_hoa_don NVARCHAR(50),
    tong_tien DECIMAL(18, 2),
	tien_giam DECIMAL(18, 2),
	phi_van_chuyen DECIMAL(18, 2),
	thanh_tien DECIMAL(18, 2),
	dia_chi_nguoi_nhan NVARCHAR(255),
    ngay_dat DATETIME,
    ngay_giao DATETIME,
    ngay_hoan_thanh DATETIME,
	ten_nguoi_nhan NVARCHAR(255),
    so_dien_thoai_nguoi_nhan NVARCHAR(20),
	trang_thai NVARCHAR(50),   
	mo_ta NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: hoa_don_chi_tiet
CREATE TABLE hoa_don_chi_tiet (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_hoa_don INT FOREIGN KEY REFERENCES hoa_don(id),
    id_san_pham_chi_tiet INT FOREIGN KEY REFERENCES san_pham_chi_tiet(id),
    gia_ban DECIMAL(18, 2),
    gia_goc DECIMAL(18, 2),
    gia_giam DECIMAL(18, 2),
    so_luong INT,
    mo_ta NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: lich_su_thanh_toan
CREATE TABLE lich_su_thanh_toan (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_hoa_don INT FOREIGN KEY REFERENCES hoa_don(id),
    ma_giao_dich NVARCHAR(50),
    loai_thanh_toan NVARCHAR(50),
    so_tien_thanh_toan DECIMAL(18, 2),
    mo_ta NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);
-- Table: lich_su_thanh_toan
CREATE TABLE lich_su_hoa_don (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_hoa_don INT FOREIGN KEY REFERENCES hoa_don(id),
    loai NVARCHAR(50),
    mo_ta NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

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

-- Fake data for danh_muc
INSERT INTO danh_muc (ten_danh_muc, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
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



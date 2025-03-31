create database DATN1_5SShop
use DATN1_5SShop

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

-- Table: doanh_muc
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

-- Bảng khach_hang
INSERT INTO khach_hang (ho_va_ten, ngay_sinh, gioi_tinh, email, so_dien_thoai, mat_khau, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(N'Nguyễn Thị A', '1995-03-15', N'Nữ', N'nguyentha@gmail.com', '0987654321', N'123456', N'Admin', N'Admin', GETDATE(), GETDATE(), 0),
(N'Lê Hoàng B', '1992-07-20', N'Nữ', N'lehoangb@gmail.com', '0987654322', N'abcdef', N'Admin', N'Admin', GETDATE(), GETDATE(), 0);

-- Bảng dia_chi
INSERT INTO dia_chi (id_khach_hang, ten_nguoi_nhan, dien_thoai_nguoi_nhan, dia_chi_chi_tiet, xa, huyen, tinh, dia_chi_mac_dinh, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES
(1, N'Nguyễn Thị A', '0987654321', N'Số 12, Đường X', N'Phường A', N'Quận B', N'TP Hà Nội', 1, N'Admin', N'Admin', GETDATE(), GETDATE(), 0),
(2, N'Lê Hoàng B', '0987654322', N'Số 45, Đường Y', N'Phường C', N'Quận D', N'TP HCM', 1, N'Admin', N'Admin', GETDATE(), GETDATE(), 0);

-- Bảng xuat_xu
INSERT INTO xuat_xu (ten_xuat_xu, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(N'Pháp', N'Admin', N'Admin', GETDATE(), GETDATE(), 0),
(N'Hàn Quốc', N'Admin', N'Admin', GETDATE(), GETDATE(), 0);

select * from xuat_xu
-- Bảng danh_muc
INSERT INTO danh_muc (ten_danh_muc, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(N'Son lì', N'Admin', N'Admin', GETDATE(), GETDATE(), 0),
(N'Son bóng', N'Admin', N'Admin', GETDATE(), GETDATE(), 0);

-- Bảng thuong_hieu
INSERT INTO thuong_hieu (ten_thuong_hieu, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(N'Dior', N'Admin', N'Admin', GETDATE(), GETDATE(), 0),
(N'YSL', N'Admin', N'Admin', GETDATE(), GETDATE(), 0);

-- Bảng san_pham
INSERT INTO san_pham (id_xuat_xu, id_danh_muc, id_thuong_hieu, ten_san_pham, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(1, 1, 1, N'Son Dior Rouge', N'Admin', N'Admin', GETDATE(), GETDATE(), 0),
(2, 2, 2, N'Son YSL Volupté', N'Admin', N'Admin', GETDATE(), GETDATE(), 0);

-- Bảng mau_sac
INSERT INTO mau_sac (ten_mau_sac, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(N'Đỏ', N'Admin', N'Admin', GETDATE(), GETDATE(), 0),
(N'Hồng', N'Admin', N'Admin', GETDATE(), GETDATE(), 0);

-- Bảng khoi_luong
INSERT INTO khoi_luong (ten_khoi_luong, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(N'3.5g', N'Admin', N'Admin', GETDATE(), GETDATE(), 0),
(N'4g', N'Admin', N'Admin', GETDATE(), GETDATE(), 0);

-- Bảng san_pham_chi_tiet
INSERT INTO san_pham_chi_tiet (id_mau_sac, id_khoi_luong, id_san_pham, url_anh, so_luong, ma_vach, gia_ban, trang_thai, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(1, 1, 1, N'url_anh_dior_rouge.png', 200, N'1234567890123', 950000, N'Còn hàng', N'Admin', N'Admin', GETDATE(), GETDATE(), 0),
(2, 2, 2, N'url_anh_ysl_volupte.png', 150, N'9876543210987', 850000, N'Còn hàng', N'Admin', N'Admin', GETDATE(), GETDATE(), 0);

INSERT INTO phieu_giam_gia 
(ma_phieu_giam_gia, ten_phieu_giam_gia, gia_tri_giam, dieu_kien_ap_dung, ngay_bat_dau, ngay_ket_thuc, so_luong, mo_ta, trang_thai, ngay_tao, ngay_sua, nguoi_tao, nguoi_sua, xoa_mem)
VALUES
('GG001', N'Giảm giá khai trương', 10.00, 500000.00, '2024-12-01 00:00:00', '2024-12-31 23:59:59', 100, N'Khuyến mãi khai trương dành cho son', N'DANG_DIEN_RA', '2024-12-01 09:00:00', NULL, N'Admin', NULL, 0),
('GG002', N'Giảm giá cuối năm', 50000.00, 1000000.00, '2024-12-15 00:00:00', '2024-12-31 23:59:59', 50, N'Khuyến mãi cuối năm dành cho đơn hàng son lớn', N'DANG_DIEN_RA', '2024-12-10 10:00:00', NULL, N'Admin', NULL, 0),
('GG003', N'Giảm giá Black Friday', 20.00, 0.00, '2024-11-29 00:00:00', '2024-11-29 23:59:59', 200, N'Khuyến mãi Black Friday áp dụng toàn bộ sản phẩm son', N'KET_THUC', '2024-11-01 08:00:00', '2024-11-30 12:00:00', N'Admin', N'Marketing', 1),
('GG004', N'Giảm giá Tết 2024', 100000.00, 2000000.00, '2024-01-01 00:00:00', '2024-02-15 23:59:59', 300, N'Khuyến mãi dịp Tết áp dụng cho hóa đơn lớn', N'DANG_DIEN_RA', '2024-12-01 09:00:00', NULL, N'Admin', NULL, 0),
('GG005', N'Giảm giá thành viên', 15.00, 0.00, '2024-01-01 00:00:00', '2024-06-30 23:59:59', 500, N'Ưu đãi đặc biệt cho thành viên VIP mua son', N'DANG_DIEN_RA', '2024-12-05 14:00:00', NULL, N'Admin', NULL, 0);
INSERT INTO chuc_vu (ten_chuc_vu)
VALUES 
(N'Admin');

INSERT INTO nhan_vien 
(id_chuc_vu, ten_nhan_vien, sdt, dia_chi, email, ngay_sinh, gioi_tinh, mat_khau, ngay_tao, ngay_sua, nguoi_tao, nguoi_sua, xoa_mem)
VALUES 
( 1,N'Trần Thị Thanh Thảo', N'0987654321', N'Hà Nội', N'thao@gmail.com', '1990-01-01', N'Nữ', N'abc', GETDATE(), GETDATE(), N'Admin', N'Admin', 0);


select * from mau_sac
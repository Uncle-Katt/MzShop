<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Quản lý Hóa Đơn</title>

</head>
<body>
<style>
    body {
        background-color: #f8f9fa;
    }
    .container {
        margin-top: 20px;
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
        margin-bottom: 20px;
        text-align: center;
    }
    /* Hiệu ứng cho nút */
    .btn-primary {
        transition: background-color 0.3s, transform 0.2s;
    }
    .btn-primary:hover {
        background-color: #0056b3; /* Màu nền khi hover */
        transform: scale(1.05); /* Tăng kích thước một chút */
    }

    /* Hiệu ứng cho ô chọn */
    .form-select:hover {
        border-color: #80bdff; /* Thay đổi màu viền khi hover */
        box-shadow: 0 0 5px rgba(0, 123, 255, .25); /* Thêm bóng đổ nhẹ */
    }

    /* Hiệu ứng cho hàng bảng */
    .table tbody tr:hover {
        background-color: #f1f1f1; /* Màu nền khi hover trên hàng bảng */
        transition: background-color 0.3s; /* Hiệu ứng chuyển màu */
    }
</style>
<div class="container">
    <h1>Thêm Hóa Đơn Chi Tiết</h1>
    <form action="/hien-thi/hoa-don-ct/add" method="post">
        <div class="mb-3">
            <label for="hoaDon" class="form-label">Hóa Đơn:</label>
            <select class="form-select" name="hoaDon" id="hoaDon" required>
                <c:forEach items="${dshd}" var="l">
                    <option value="${l.id}">${l.khachHang.hoTen}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="sanPhamChiTiet" class="form-label">SPCT:</label>
            <select class="form-select" name="sanPhamChiTiet" id="sanPhamChiTiet" required>
                <c:forEach items="${dsspct}" var="l">
                    <option value="${l.id}">${l.sanPham.tenSanPham}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="maHD" class="form-label">Mã:</label>
            <input type="text" class="form-control" name="maHD1" id="maHD" required>
        </div>

        <div class="mb-3">
            <label for="soLuong" class="form-label">Số Lượng:</label>
            <input type="number" class="form-control" name="soLuong" id="soLuong" required>
        </div>

        <div class="mb-3">
            <label for="giaBan" class="form-label">Giá Bán:</label>
            <input type="number" class="form-control" name="giaBan" id="giaBan" required>
        </div>

        <fieldset class="mb-3">
            <legend class="col-form-label pt-0">Trạng Thái:</legend>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="trangThai" id="trangThai1" value="1">
                <label class="form-check-label" for="trangThai1">Đã Thanh Toán</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="trangThai" id="trangThai2" value="0" checked>
                <label class="form-check-label" for="trangThai2">Chưa Thanh Toán</label>
            </div>
        </fieldset>

        <button type="submit" class="btn btn-primary">Gửi</button>
    </form>
</div>

<div class="container mt-5">
    <h1>Danh Sách Hóa Đơn Chi Tiết</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Hóa Đơn</th>
            <th scope="col">SPCT</th>
            <th scope="col">maHD</th>
            <th scope="col">Số Lượng</th>
            <th scope="col">Giá Bán</th>
            <th scope="col">Trạng Thái</th>
            <th scope="col">Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${dshdct}" var="hd" varStatus="i">
            <tr>
                <th scope="row">${i.index + 1}</th>
                <td>${hd.hoaDon.id}</td>
                <td>${hd.sanPhamChiTiet.sanPham.tenSanPham}</td>
                <td>${hd.maHD1}</td>
                <td>${hd.soLuong}</td>
                <td>${hd.giaBan}</td>
                <td>
                    <c:if test="${hd.trangThai == 1}">Đã Thanh Toán</c:if>
                    <c:if test="${hd.trangThai == 0}">Chưa Thanh Toán</c:if>
                </td>
                <td>
                    <a class="btn btn-info" href="/hien-thi/hoa-don-ct/detail/${hd.id}">Chi Tiết</a>
                    <a class="btn btn-danger" href="/hien-thi/hoa-don-ct/remove/${hd.id}">Xoa </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-7mNSRPxGqqDO6mP1Bhv12R9en4eTB3twK26PV2ddmkwElzRVXg2jAVTAu7WwG3Ff"
        crossorigin="anonymous"></script>
</body>
</html>

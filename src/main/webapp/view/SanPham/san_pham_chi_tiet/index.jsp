<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SanPhamChiTiet</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
<h1>Sản Phẩm Chi tiết</h1>
<div class="display: flex; justify-content:center; width: 100%">
    <form method="GET" action="/SPCT/index">
        <input name="key">
        <button>Tìm kiếm</button>
    </form>
</div>
<div>
    <button type="button" style="margin-right: 10px; padding: 5px;">Làm mới</button>
</div>
<div>
    <a href="">Tạo sản phẩm </a>
</div>
<select name="mauSac" style="margin-right: 10px; padding: 5px;">
    <option value="">Màu Sắc</option>
    <c:forEach items="" var="dm">
        <option value=""></option>
    </c:forEach>
</select>

<!-- Combobox Xuất xứ -->
<select name="khoiLuong" style="margin-right: 10px; padding: 5px;">
    <option value="">Xuất xứ</option>
    <c:forEach items="" var="xx">
        <option value=""></option>
    </c:forEach>
</select>

<!-- Combobox Thương hiệu -->
<select name="thuongHieu" style="margin-right: 10px; padding: 5px;">
    <option value="">Thương hiệu</option>
    <c:forEach items="" var="th">
        <option value=""></option>
    </c:forEach>
</select>

<table class="table" border="1">
    <tr>
        <th>STT</th>
        <th>Tên sản phẩm</th>
        <th>Màu sắc</th>
        <th>Khối lượng</th>
        <th>Mùi hương</th>
        <th>Giá bán</th>
        <th>Số lượng</th>
        <th>Trạng Thái</th>
        <th>Thao tác</th>
    </tr>
    <c:forEach items="${dsspct}" var="spct" varStatus="i">
        <tr>
            <td scope="row">${i.index + 1}</td>
            <td>${spct.sanPham.tenSanPham}</td>
            <td>${spct.mauSac.tenMauSac}</td>
            <td>${spct.khoiLuong.tenKhoiLuong}</td>
            <td>${spct.muiHuong.tenMuiHuong}</td>
            <td>${spct.giaBan}</td>
            <td>${spct.soLuong}</td>

            <td>${sp.trangThai == 1 ? "Đang hoạt động" : "Ngừng hoạt động"}</td> <!-- Thay sv thành sp -->
            <td>
                <a href="" title="Chi tiết">
                    <i class="fas fa-eye"></i>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>

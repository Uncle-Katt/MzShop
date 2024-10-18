<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page import="java.util.Date" %>
<%@ page import="com.example.banson5s.ChucNang.Entity.PhieuGiamGia" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Mã Giảm Giá</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../../../includes/header.jsp"/>

<div class="container">
    <h2 class="mt-4">Quản lý Mã Giảm Giá</h2>

    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>
    <!-- Nút thêm mới mã giảm giá -->
    <div class="d-flex justify-content-between align-items-center mt-4">
        <button id="btnThemMoi" type="button" class="btn btn-primary" data-toggle="modal" data-target="#maGiamGiaModal"
                onclick="resetModal()">
            Thêm Mã Giảm Giá
        </button>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="maGiamGiaModal" tabindex="-1" role="dialog" aria-labelledby="maGiamGiaLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="maGiamGiaLabel">Thêm/Sửa Mã Giảm Giá</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="${phieuGiamGia.id != null ? '/phieu-giam-gia/update' : '/phieu-giam-gia/save'}"
                          method="post">
                        <input type="hidden" name="id" id="id" value="${phieuGiamGia != null ? phieuGiamGia.id : ''}">
                        <!-- Các trường thông tin -->
                        <div class="form-group">
                            <label for="maPhieuGiamGia">Mã Phiếu Giảm Giá:</label>
                            <input type="text" class="form-control" id="maPhieuGiamGia" name="maPhieuGiamGia"
                                   value="${phieuGiamGia != null ? phieuGiamGia.maPhieuGiamGia : ''}" required>
                        </div>
                        <div class="form-group">
                            <label for="tenPhieuGiamGia">Tên Phiếu Giảm Giá:</label>
                            <input type="text" class="form-control" id="tenPhieuGiamGia" name="tenPhieuGiamGia"
                                   value="${phieuGiamGia != null ? phieuGiamGia.tenPhieuGiamGia : ''}" required>
                        </div>
                        <div class="form-group">
                            <label for="loaiGiam">Loại Giảm Giá:</label>
                            <select class="form-control" id="loaiGiam" name="loaiGiam"
                                    required>
                                <option value="1" ${phieuGiamGia != null && phieuGiamGia.loaiGiam ==  1 ? 'selected' : ''}>
                                    %
                                </option>
                                <option value="0" ${phieuGiamGia != null && phieuGiamGia.loaiGiam == 0 ? 'selected' : ''}>
                                    $
                                </option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="phanTramGiam">Giá trị giảm:</label>
                            <input type="number" step="1" class="form-control" id="phanTramGiam" name="phanTramGiam"
                                   value="${phieuGiamGia != null ? phieuGiamGia.phanTramGiam : ''}"
                                    required>
                        </div>
                        <div class="form-group">
                            <label for="dieuKienToiThieu">Điều Kiện Tối Thiểu (VNĐ):</label>
                            <input type="number" step="10000" class="form-control" id="dieuKienToiThieu"
                                   name="dieuKienToiThieu"
                                   value="${phieuGiamGia != null ? phieuGiamGia.dieuKienToiThieu : ''}" required>
                        </div>
                        <%
                            PhieuGiamGia phieuGiamGia = (PhieuGiamGia) request.getAttribute("phieuGiamGia");

                            String ngayBatDau = phieuGiamGia != null ? new SimpleDateFormat("yyyy-MM-dd").format(phieuGiamGia.getNgayBatDau()) : "";
                            String ngayKetThuc = phieuGiamGia != null ? new SimpleDateFormat("yyyy-MM-dd").format(phieuGiamGia.getNgayKetThuc()) : "";
                        %>

                        <div class="form-group">
                            <label for="ngayBatDau">Ngày Bắt Đầu:</label>
                            <input type="date" class="form-control" id="ngayBatDau" name="ngayBatDau"
                                   value="<%= ngayBatDau %>" required>
                        </div>
                        <div class="form-group">
                            <label for="ngayKetThuc">Ngày Kết Thúc:</label>
                            <input type="date" class="form-control" id="ngayKetThuc" name="ngayKetThuc"
                                   value="<%= ngayKetThuc %>" required>
                        </div>

                        <div class="form-group">
                            <label for="soLuong">Số Lượng:</label>
                            <input type="number"  step="1" class="form-control" id="soLuong" name="soLuong"
                                   value="${phieuGiamGia != null ? phieuGiamGia.soLuong : ''}" required>
                        </div>
                        <div class="form-group">
                            <label for="moTa">Mô Tả:</label>
                            <textarea class="form-control" id="moTa"
                                      name="moTa">${phieuGiamGia != null ? phieuGiamGia.moTa : ''}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="trangThai">Trạng Thái:</label>
                            <select class="form-control" id="trangThai" name="trangThai">
                                <option value="1" ${phieuGiamGia != null && phieuGiamGia.trangThai == 1 ? 'selected' : ''}>
                                    Hoạt Động
                                </option>
                                <option value="0" ${phieuGiamGia != null && phieuGiamGia.trangThai == 0 ? 'selected' : ''}>
                                    Không Hoạt Động
                                </option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
    <div class="mt-4">
        <table class="table table-bordered mt-4">
            <thead>
            <tr>
                <th>ID</th>
                <th>Mã Phiếu</th>
                <th>Tên Phiếu</th>
                <th>Loại Giảm</th>

                <th>Giá Trị Giảm</th>
                <th>Điều Kiện Tối Thiểu</th>
                <th>Ngày Bắt Đầu</th>
                <th>Ngày Kết Thúc</th>
                <th>Thao Tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${listPhieuGiamGia}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.maPhieuGiamGia}</td>
                    <td>${item.tenPhieuGiamGia}</td>
                    <td>${item.loaiGiam}</td>
                    <td>${item.phanTramGiam}</td>
                    <td>${item.dieuKienToiThieu}</td>
                    <td><fmt:formatDate value="${item.ngayBatDau}" pattern="dd-MM-yyyy"/></td>
                    <td><fmt:formatDate value="${item.ngayKetThuc}" pattern="dd-MM-yyyy"/></td>
                    <td>
                        <button class="btn btn-warning" onclick="edit(${item.id})">Sửa</button>
                        <button class="btn btn-danger" onclick="deleteById(${item.id})">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/view/ChucNang/PhieuGiamGia/pgg.js"></script>

</body>
</html>

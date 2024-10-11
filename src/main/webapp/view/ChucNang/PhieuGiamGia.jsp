<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Mã Giảm Giá</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery và Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../../includes/header.jsp" />

<div class="container">
    <h2 class="mt-4">Quản lý Mã Giảm Giá</h2>

    <!-- Hiển thị thông báo nếu có -->
    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>

    <!-- Nút để mở modal thêm Mã Giảm Giá -->
    <button type="button" class="btn btn-primary mt-3" data-toggle="modal" data-target="#maGiamGiaModal">
        Thêm Mã Giảm Giá
    </button>

    <!-- Modal Thêm/Sửa Mã Giảm Giá -->
    <div class="modal fade" id="maGiamGiaModal" tabindex="-1" role="dialog" aria-labelledby="maGiamGiaLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="maGiamGiaLabel">Thêm/Sửa Mã Giảm Giá</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="${phieuGiamGia != null ? '/phieu-giam-gia/update' : '/phieu-giam-gia/save'}" method="post">
                        <input type="hidden" name="id" id="id" value="${phieuGiamGia != null ? phieuGiamGia.id : ''}">
                        <div class="form-group">
                            <label for="maPhieuGiamGia">Mã Phiếu Giảm Giá:</label>
                            <input type="text" class="form-control" id="maPhieuGiamGia" name="maPhieuGiamGia" value="${phieuGiamGia != null ? phieuGiamGia.maPhieuGiamGia : ''}" required>
                        </div>
                        <div class="form-group">
                            <label for="tenPhieuGiamGia">Tên Phiếu Giảm Giá:</label>
                            <input type="text" class="form-control" id="tenPhieuGiamGia" name="tenPhieuGiamGia" value="${phieuGiamGia != null ? phieuGiamGia.tenPhieuGiamGia : ''}" required>
                        </div>
                        <div class="form-group">
                            <label for="phanTramGiam">Phần Trăm Giảm:</label>
                            <input type="number" step="0.01" class="form-control" id="phanTramGiam" name="phanTramGiam" value="${phieuGiamGia != null ? phieuGiamGia.phanTramGiam : ''}" required>
                        </div>
                        <div class="form-group">
                            <label for="ngayBatDau">Ngày Bắt Đầu:</label>
                            <input type="date" class="form-control" id="ngayBatDau" name="ngayBatDau" value="${phieuGiamGia != null ? phieuGiamGia.ngayBatDau : ''}">
                        </div>
                        <div class="form-group">
                            <label for="ngayKetThuc">Ngày Kết Thúc:</label>
                            <input type="date" class="form-control" id="ngayKetThuc" name="ngayKetThuc" value="${phieuGiamGia != null ? phieuGiamGia.ngayKetThuc : ''}">
                        </div>
                        <div class="form-group">
                            <label for="soLuong">Số Lượng:</label>
                            <input type="number" class="form-control" id="soLuong" name="soLuong" value="${phieuGiamGia != null ? phieuGiamGia.soLuong : ''}" required>
                        </div>
                        <div class="form-group">
                            <label for="moTa">Mô Tả:</label>
                            <textarea class="form-control" id="moTa" name="moTa">${phieuGiamGia != null ? phieuGiamGia.moTa : ''}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="trangThai">Trạng Thái:</label>
                            <select class="form-control" id="trangThai" name="trangThai">
                                <option value="1" ${phieuGiamGia != null && phieuGiamGia.trangThai == 1 ? 'selected' : ''}>Hoạt Động</option>
                                <option value="0" ${phieuGiamGia != null && phieuGiamGia.trangThai == 0 ? 'selected' : ''}>Không Hoạt Động</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Danh sách mã giảm giá -->
    <table class="table table-bordered mt-4">
        <thead>
        <tr>
            <th>ID</th>
            <th>Mã Phiếu</th>
            <th>Tên Phiếu</th>
            <th>Phần Trăm Giảm</th>
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
                <td>${item.phanTramGiam}</td>
                <td>${item.ngayBatDau}</td>
                <td>${item.ngayKetThuc}</td>
                <td>
                    <button class="btn btn-warning" onclick="edit(${item.id})">Sửa</button>
                    <button class="btn btn-danger" onclick="deleteById(${item.id})">Xóa</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    function edit(item) {
        $('#id').val(item.id);
        $('#maPhieuGiamGia').val(item.maPhieuGiamGia);
        $('#tenPhieuGiamGia').val(item.tenPhieuGiamGia);
        $('#phanTramGiam').val(item.phanTramGiam);
        $('#ngayBatDau').val(item.ngayBatDau);
        $('#ngayKetThuc').val(item.ngayKetThuc);
        $('#soLuong').val(item.soLuong);
        $('#moTa').val(item.moTa);
        $('#trangThai').val(item.trangThai);
        $('#maGiamGiaModal').modal('show');
    }

    function deleteById(id) {
        if (confirm('Bạn có chắc chắn muốn xóa?')) {
            window.location.href = '${pageContext.request.contextPath}/phieu-giam-gia/delete/' + id;
        }
    }
</script>
<jsp:include page="../../includes/footer.jsp" />

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Quản Lý Phương Thức Thanh Toán</title>
</head>
<body>
<div class="container mt-5">
    <h2>Quản Lý Phương Thức Thanh Toán</h2>
    <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#phuongThucModal">Thêm Phương Thức Thanh Toán</button>

    <!-- Modal -->
    <div class="modal fade" id="phuongThucModal" tabindex="-1" role="dialog" aria-labelledby="phuongThucModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="phuongThucModalLabel">Thêm/Sửa Phương Thức Thanh Toán</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/phuong-thuc-thanh-toan" method="post">
                        <input type="hidden" name="id" id="id">
                        <div class="form-group">
                            <label for="ten">Tên:</label>
                            <input type="text" class="form-control" id="ten" name="ten" required>
                        </div>
                        <div class="form-group">
                            <label for="ngayTao">Ngày Tạo:</label>
                            <input type="datetime-local" class="form-control" id="ngayTao" name="ngayTao" required>
                        </div>
                        <div class="form-group">
                            <label for="ngaySua">Ngày Sửa:</label>
                            <input type="datetime-local" class="form-control" id="ngaySua" name="ngaySua" required>
                        </div>
                        <div class="form-group">
                            <label for="trangThai">Trạng Thái:</label>
                            <select class="form-control" id="trangThai" name="trangThai">
                                <option value="1">Hoạt Động</option>
                                <option value="0">Không Hoạt Động</option>
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

    <!-- Danh sách phương thức thanh toán -->
    <table class="table table-bordered mt-4">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Ngày Tạo</th>
            <th>Ngày Sửa</th>
            <th>Trạng Thái</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${listPhuongThuc}">
            <tr>
                <td>${item.id}</td>
                <td>${item.ten}</td>
                <td>${item.ngayTao}</td>
                <td>${item.ngaySua}</td>
                <td>${item.trangThai == 1 ? 'Hoạt Động' : 'Không Hoạt Động'}</td>
                <td>
                    <button class="btn btn-warning" onclick="edit(${item})">Sửa</button>
                    <button class="btn btn-danger" onclick="deleteById(${item.id})">Xóa</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function edit(item) {
        $('#id').val(item.id);
        $('#ten').val(item.ten);
        $('#ngayTao').val(item.ngayTao);
        $('#ngaySua').val(item.ngaySua);
        $('#trangThai').val(item.trangThai);
        $('#phuongThucModal').modal('show');
    }

    function deleteById(id) {
        if (confirm('Bạn có chắc chắn muốn xóa?')) {
            window.location.href = '${pageContext.request.contextPath}/phuong-thuc-thanh-toan/delete/' + id;
        }
    }
</script>
</body>
</html>

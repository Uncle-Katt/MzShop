<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Sản Phẩm</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- jQuery và Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .container {
            padding: 1px; /* Thêm padding để tạo khoảng cách với viền */
            margin-left: auto; /* Đặt khoảng cách bên trái tự động để căn giữa */
            margin-right: auto; /* Đặt khoảng cách bên phải tự động để căn giữa */
            width: 100%; /* Giới hạn chiều rộng tối đa của container là 90% */
        }

        .btn-custom {
            margin-right: 10px; /* Khoảng cách giữa các nút */
        }

        .table {
            border-collapse: separate; /* Viền tách biệt */
            width: 100%; /* Chiếm toàn bộ chiều rộng */
            border: 1px solid #b85555; /* Đặt viền bảng với màu #b85555 */
        }

        .table th, .table td {
            border: 1px solid white; /* Viền cho th và td */
        }

        .table tr {
            border: 1px solid #b85555 !important; /* Đặt viền cho các dòng với màu #b85555 */
        }

        h3 {
            color: #b85555;
            display: inline; /* Để tiêu đề không chiếm toàn bộ chiều rộng */
        }

        hr {
            background-color: #b85555;
            border: none; /* Xóa viền mặc định */
            height: 2px; /* Đặt chiều cao cho đường kẻ */
            flex-grow: 1; /* Để đường kẻ mở rộng đầy đủ */
            margin: 0 10px; /* Đặt khoảng cách giữa tiêu đề và đường kẻ */
        }

        .header-container {
            display: flex; /* Sử dụng flexbox */
            align-items: center; /* Căn giữa theo chiều dọc */
        }
        .btn-custom {
            background-color: #b85555 !important; /* Màu nền nút */
            color: white !important; /* Màu chữ */
        }


        .btn-custom:hover {
            background-color: #a84343; /* Màu nền khi di chuột */
            color: white; /* Màu chữ khi di chuột */
        }
        .btn-red {
            background-color: #b85555 !important; /* Màu nền nút đỏ */
            color: white !important; /* Màu chữ trắng */
        }
        .modal-backdrop {
            opacity: 0.5 !important; /* Điều chỉnh độ mờ của lớp phủ (0.5 là 50%) */
            background-color: rgba(0, 0, 0, 0.5) !important; /* Màu nền và độ mờ */
        }
        .form-group{
            color: black;
        }


    </style>
</head>
<body>
<jsp:include page="/includes/header.jsp" />

<div class="container">
    <div class="header-container">
        <h3>Quản lý sản phẩm</h3>
        <hr>
    </div>

    <div class="border rounded p-3 mb-4" style="background-color: white; border: 1px solid #b85555 !important; ">
        <!-- Form tìm kiếm -->
        <div class="row justify-content-center mb-3">
            <div class="col-md-6">
                <form class="form-inline" method="GET" action="/san-pham/index">
                    <input class="form-control mr-2 w-75" name="key" placeholder="Tìm kiếm .....">
                    <button class="btn btn-red" type="submit">
                        <i class="fas fa-search"></i> Tìm kiếm
                    </button>
                </form>
            </div>
        </div>

        <!-- Nút làm mới -->
        <div class="text-center mb-3"> <!-- Căn giữa nút -->
            <button class="btn btn-primary btn-custom" type="button">Làm mới</button>
        </div>

        <!-- Combobox Danh mục, Xuất xứ, Thương hiệu -->
        <div class="form-row mb-4">
            <div class="col">
                <select class="form-control" name="danhMuc">
                    <option value="">Danh mục</option>
                    <c:forEach items="${dsDanhMuc}" var="dm">
                        <option value="${dm.id}">${dm.tenDanhMuc}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="col">
                <select class="form-control" name="xuatXu">
                    <option value="">Xuất xứ</option>
                    <c:forEach items="${dsXuatXu}" var="xx">
                        <option value="${xx.id}">${xx.tenXuatXu}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="col">
                <select class="form-control" name="thuongHieu">
                    <option value="">Thương hiệu</option>
                    <c:forEach items="${dsThuongHieu}" var="th">
                        <option value="${th.id}">${th.tenThuongHieu}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
    </div>

    <div class="border rounded p-3 mb-4" style="background-color: white; border: 1px solid #b85555 !important;">
        <!-- Nút làm mới và tạo sản phẩm -->
        <div class="mb-3 d-flex justify-content-end"> <!-- Căn nút sang phải -->
            <a href="#" class="btn btn-warning btn-custom ml-2" data-toggle="modal" data-target="#createProductModal">
                <i class="fas fa-plus"></i> Tạo sản phẩm
            </a>
        </div>

        <!-- Modal Tạo sản phẩm -->
        <div class="modal fade" id="createProductModal" tabindex="-1" aria-labelledby="createProductModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createProductModalLabel">Tạo sản phẩm mới</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="/san-pham/create" id="createProductForm">
                            <!-- Ô input cho tên sản phẩm -->
                            <div class="form-group">
                                <label for="tenSanPham">Tên sản phẩm</label>
                                <input type="text" class="form-control" id="tenSanPham" name="tenSanPham" value="${sanPham.tenSanPham}" placeholder="Nhập tên sản phẩm" required>
                            </div>

                            <!-- Ô input cho số lượng đã bán -->
                            <div class="form-group">
                                <label for="soLuongDaBan">Số lượng đã bán</label>
                                <input type="number" class="form-control" id="soLuongDaBan" name="soLuongDaBan" placeholder="Nhập số lượng đã bán" required>
                            </div>

                            <div class="form-group">
                                <label for="danhMuc">Danh mục</label>
                                <select class="form-control" id="danhMuc" name="danhMuc" required>
                                    <option value="">Chọn danh mục</option>
                                    <c:if test="${not empty dsDanhMuc}">
                                        <c:forEach items="${dsDanhMuc}" var="dm">
                                            <option value="${dm.id}">${dm.tenDanhMuc}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>


                            <!-- Combobox cho xuất xứ -->
                            <div class="form-group">
                                <label for="xuatXu">Xuất xứ</label>
                                <select class="form-control" id="xuatXu" name="xuatXu" required>
                                    <option value="">Chọn xuất xứ</option>
                                    <c:if test="${not empty dsXuatXu}">
                                        <c:forEach items="${dsXuatXu}" var="xx">
                                            <option value="${xx.id}">${xx.tenXuatXu}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>

                            <!-- Combobox cho thương hiệu -->
                            <div class="form-group">
                                <label for="brand">Thương hiệu</label>
                                <select class="form-control" id="brand" name="thuongHieu" required>
                                    <option value="">Chọn thương hiệu</option>
                                    <c:if test="${not empty dsThuongHieu}">
                                        <c:forEach items="${dsThuongHieu}" var="th">
                                            <option value="${th.id}">${th.tenThuongHieu}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>


                            <!-- Trạng thái -->
                            <div class="form-group">
                                <label>Trạng thái</label><br>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="trangThai" id="active" value="1" checked>
                                    <label class="form-check-label" for="active">Hoạt động</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="trangThai" id="inactive" value="0">
                                    <label class="form-check-label" for="inactive">Ngừng hoạt động</label>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary" form="createProductForm">Lưu sản phẩm</button>
                    </div>
                </div>
            </div>
        </div>



        <!-- Bảng sản phẩm -->
        <table class="table">
            <thead>
            <tr>
                <th>STT</th>
                <th>Tên sản phẩm</th>
                <th>Số lượng đã bán</th>
                <th>Xuất xứ</th>
                <th>Danh mục</th>
                <th>Thương hiệu</th>
                <th>Trạng Thái</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${dssp}" var="sp" varStatus="i">
                <tr>
                    <td scope="row">${i.index + 1}</td>
                    <td>${sp.tenSanPham}</td>
                    <td>${sp.soLuongDaBan}</td>
                    <td>${sp.xuatXu.tenXuatXu}</td>
                    <td>${sp.danhMuc.tenDanhMuc}</td>
                    <td>${sp.thuongHieu.tenThuongHieu}</td>
                    <td>${sp.trangThai == 1 ? "Đang hoạt động" : "Ngừng hoạt động"}</td>
                    <td>
                        <a href="" title="Chi tiết">
                            <i class="fas fa-eye" style="color: #b85555;"></i>
                        </a>
                        <a href="" title="Sửa" style="margin-left: 10px;">
                            <i class="fas fa-edit" style="color: #b85555;"></i>
                        </a>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    // Bạn có thể thêm các hàm JavaScript cần thiết ở đây
</script>

<jsp:include page="/includes/footer.jsp" />
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<div class="container mt-4">
    <!-- Tiêu đề Quản lý Sản Phẩm -->
    <h2 class="mb-4">Quản Lý Sản Phẩm</h2>

    <!-- Bộ lọc tìm kiếm -->
    <div class="card mb-4" style="border: 1px solid #b85555; background-color: white;">
        <div class="card-body">
            <h5 class="mb-3">
                <i class="fas fa-filter"></i> Bộ Lọc
            </h5>

            <div class="row justify-content-center mb-3">
                <div class="col-md-6">
                    <form class="form-inline" method="GET" action="">
                        <div class="input-group w-100">
                            <input class="form-control" name="key" placeholder="Tìm kiếm sản phẩm ..." />
                            <button class="btn btn-red ml-2" type="submit" style="background-color: #b85555; color: white;">
                                <i class="fas fa-search"></i> Tìm kiếm
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="form-row mb-4">
                <div class="col">
                    <label for="danhMuc">Danh mục</label>
                    <select class="form-control" id="danhMuc" name="danhMuc">
                        <option value="">Chọn danh mục</option>
                        <c:forEach items="${dsDanhMuc}" var="dm">
                            <option value="${dm.id}">${dm.tenDanhMuc}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col">
                    <label for="xuatXu">Xuất xứ</label>
                    <select class="form-control" id="xuatXu" name="xuatXu">
                        <option value="">Chọn xuất xứ</option>
                        <c:forEach items="${dsXuatXu}" var="xx">
                            <option value="${xx.id}">${xx.tenXuatXu}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col">
                    <label for="thuongHieu">Thương hiệu</label>
                    <select class="form-control" id="thuongHieu" name="thuongHieu">
                        <option value="">Chọn thương hiệu</option>
                        <c:forEach items="${dsThuongHieu}" var="th">
                            <option value="${th.id}">${th.tenThuongHieu}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
    </div>

    <!-- Danh sách sản phẩm -->
    <div class="card">
        <div class="card-body" style="border: 1px solid #b85555; background-color: white;">
            <h5 class="mb-4">Danh Sách Sản Phẩm</h5>

            <div class="d-flex justify-content-end mb-3">
                <a href="/sanpham/create" class="btn btn-pink" style="background-color: #b85555; color: white;">
                    + Thêm Sản Phẩm
                </a>
            </div>

            <div class="table-responsive">
                <table class="table">
                    <thead style="background-color: #b85555; color: white;">
                    <tr>
                        <th>#</th>
                        <th>Tên Sản Phẩm</th>
                        <th>Danh Mục</th>
                        <th>Thương Hiệu</th>
                        <th>Xuất Xứ</th>
                        <th>Giá Bán</th>
                        <th>Hành Động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${dsSanPham}" var="sp" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${sp.tenSanPham}</td>
                            <td>${sp.danhMuc.tenDanhMuc}</td>
                            <td>${sp.thuongHieu.tenThuongHieu}</td>
                            <td>${sp.xuatXu.tenXuatXu}</td>
                            <td>${sp.giaBan}</td>
                            <td>
                                <a href="/sanpham/detail/${sp.id}" class="btn btn-sm" style="background-color: #008080; color: white;">Chi Tiết</a>
                                <a href="/sanpham/update/${sp.id}" class="btn btn-sm" style="background-color: #FFA500; color: white;">Sửa</a>
                                <a href="/sanpham/delete/${sp.id}" class="btn btn-sm" style="background-color: #FF0000; color: white;">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${empty dsSanPham}">
                    <div style="text-align: center;">Không có dữ liệu</div>
                </c:if>
            </div>
        </div>
    </div>
</div>

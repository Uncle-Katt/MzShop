<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <div class="mt-5">
        <!-- Form thêm sản phẩm -->
        <div class="card custom-border">
            <div class="card-header">
                <h3>Thêm Sản Phẩm</h3>
                <a href="/admin/sanpham" class="btn mb-2"><i class="fa-solid fa-arrow-left"></i></a>
            </div>
            <div class="card-body">
                <form id="productForm" action="${action}" method="post" enctype="multipart/form-data">
                    <!-- ID sản phẩm (ẩn) -->
                    <input type="hidden" name="id" value="${product.id}">

                    <!-- Tên sản phẩm -->
                    <div class="form-group">
                        <label for="tenSanPham">Tên sản phẩm</label>
                        <input type="text" class="form-control" name="tenSanPham" id="tenSanPham"
                               value="${product.tenSanPham}" placeholder="Nhập tên sản phẩm" required>
                    </div>

                    <!-- Xuất xứ -->
                    <div class="form-group">
                        <label for="xuatXu">Xuất xứ</label>
                        <select class="form-control" name="xuatXu" id="xuatXu" required>
                            <option value="">Chọn xuất xứ</option>
                            <c:forEach items="${dsXuatXu}" var="xx">
                                <option value="${xx.id}" ${product.xuatXu == xx.id ? 'selected' : ''}>
                                        ${xx.tenXuatXu}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Danh mục -->
                    <div class="form-group">
                        <label for="danhMuc">Danh mục</label>
                        <select class="form-control" name="danhMuc" id="danhMuc" required>
                            <option value="">Chọn danh mục</option>
                            <c:forEach items="${dsDanhMuc}" var="dm">
                                <option value="${dm.id}" ${product.danhMuc == dm.id ? 'selected' : ''}>
                                        ${dm.tenDanhMuc}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Thuộc tính sản phẩm -->
                    <h5 class="mt-4 mb-3">Thuộc tính sản phẩm</h5>

                    <!-- Màu sắc -->
                    <div class="form-group">
                        <label for="mauSac">Màu sắc</label>
                        <input type="text" class="form-control" name="mauSac" id="mauSac"
                               value="${product.mauSac}" placeholder="Nhập màu sắc">
                    </div>

                    <!-- Khối lượng -->
                    <div class="form-group">
                        <label for="khoiLuong">Khối lượng (g)</label>
                        <input type="number" class="form-control" name="khoiLuong" id="khoiLuong"
                               value="${product.khoiLuong}" placeholder="Nhập khối lượng" required>
                    </div>

                    <!-- Mùi hương -->
                    <div class="form-group">
                        <label for="muiHuong">Mùi hương</label>
                        <input type="text" class="form-control" name="muiHuong" id="muiHuong"
                               value="${product.muiHuong}" placeholder="Nhập mùi hương">
                    </div>

                    <!-- Số lượng -->
                    <div class="form-group">
                        <label for="soLuong">Số lượng</label>
                        <input type="number" class="form-control" name="soLuong" id="soLuong"
                               value="${product.soLuong}" placeholder="Nhập số lượng" required>
                    </div>

                    <!-- Giá bán -->
                    <div class="form-group">
                        <label for="giaBan">Giá bán (VNĐ)</label>
                        <input type="number" class="form-control" name="giaBan" id="giaBan"
                               value="${product.giaBan}" placeholder="Nhập giá bán" required>
                    </div>

                    <!-- Ảnh sản phẩm -->
                    <div class="form-group">
                        <label for="anhSanPham">Ảnh sản phẩm</label>
                        <input type="file" class="form-control-file" name="anhSanPham" id="anhSanPham">
                    </div>

                    <!-- Nút hành động -->
                    <div class="d-flex justify-content-end mt-3">
                        <button type="submit" class="btn btn-success mr-2">${btnText}</button>
                        <button type="reset" class="btn btn-secondary">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Danh sách sản phẩm -->
    <div class="mt-4">
        <div class="card custom-border">
            <div class="card-header">
                <h4>Danh Sách Sản Phẩm</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead class="thead-light">
                        <tr>
                            <th>#</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Danh Mục</th>
                            <th>Màu Sắc</th>
                            <th>Số Lượng</th>
                            <th>Giá Bán</th>
                            <th>Thao Tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${dsSanPham}" var="sp" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${sp.tenSanPham}</td>
                                <td>${sp.tenDanhMuc}</td>
                                <td>${sp.mauSac}</td>
                                <td>${sp.soLuong}</td>
                                <td>${sp.giaBan}</td>
                                <td>
                                    <a href="/sanpham/edit?id=${sp.id}" class="btn btn-primary btn-sm">Sửa</a>
                                    <a href="/sanpham/delete?id=${sp.id}" class="btn btn-danger btn-sm">Xóa</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${empty dsSanPham}">
                        <p class="text-center">Không có dữ liệu</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

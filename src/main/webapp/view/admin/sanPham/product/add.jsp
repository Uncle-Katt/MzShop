<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div>
    <h3>Thêm Sản Phẩm</h3>
    <a href="/admin/product" class="btn mb-4"><i class="fa-solid fa-arrow-left"></i></a>
    <!-- Form thêm sản phẩm -->
    <div class="card" style="border: 2px solid #b85555; background-color: white;">
        <div class="card-body">
            <div class="mb-4">
                <label for="productSelect">Tên sản phẩm</label>
                <div style="display: flex">
                    <select class="form-control" id="productSelect" name="product">
                        <option value="">Chọn sản phẩm</option>
                    </select>
                    <button type="button" class="btn btn-primary ml-4" data-toggle="modal" data-target="#productModal">
                        Primary
                    </button>
                </div>


                <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" style="max-width: 60%">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="customerModalLabel">Thêm Sản Phẩm</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span>&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="tenSanPham" class="form-label">Tên Sản Phẩm</label>
                                    <input type="text" class="form-control" id="tenSanPham"
                                           placeholder="Nhập tên sản phẩm">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="danhMucSelect">Danh Mục</label>
                                    <select class="form-control" id="danhMucSelect" name="danhMuc">
                                        <option value="">Chọn danh mục</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="thuongHieuSelect">Thương Hiệu</label>
                                    <select class="form-control" id="thuongHieuSelect" name="thuongHieu">
                                        <option value="">Chọn thương hiệu</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="xuatXuSelect">Xuất Xứ</label>
                                    <select class="form-control" id="xuatXuSelect" name="xuatXu">
                                        <option value="">Chọn xuất xứ</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" >Trạng Thái</label>
                                    <div class="col d-flex">
                                        <div class="form-check">
                                            <input class="form-check-input" id="status_type_on" type="radio" name="status_product"  value="HOAT_DONG" checked>
                                            <label class="form-check-label" for="status_type_on">
                                                Đang bán
                                            </label>
                                        </div>
                                        <div class="form-check ml-2">
                                            <input class="form-check-input" id="status_type_off" type="radio" name="status_product" value="NGUNG_HOAT_DONG">
                                            <label class="form-check-label" for="status_type_off">
                                                Ngừng bán
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary btn-create-product">Xác Nhận
                                </button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-6">
                    <label for="productSelect">Màu Sắc</label>
                    <select class="form-control" id="mauSacSelect" name="mauSacSelect" multiple="multiple" data-placeholder="Chọn màu sắc">
                    </select>
                </div>
                <div class="col-6">
                    <label for="productSelect">Khối Lượng</label>
                    <select class="form-control" id="khoiLuongSelect" name="khoiLuongSelect" multiple="multiple" data-placeholder="Chọn khối lượng">
                    </select>
                </div>
            </div>

            <div class="form-row mb-4">


            </div>
        </div>
    </div>

    <!-- Danh sách sản phẩm -->
    <div class="mt-4">
        <div class="card">
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
<script>
    $(document).ready(function () {
        $('#mauSacSelect').select2();
        $('#khoiLuongSelect').select2();

        function getDataProduct() {
            $('#productSelect').empty();
            $('#productSelect').append('<option value="" selected disabled>Chọn sản phẩm</option>');
            $.ajax({
                url: '/admin/product/list',
                method: 'GET',
                dataType: 'json',
                data: {search: ''},
                success: function (response) {
                    response.data.forEach(function (item) {
                        $('#productSelect').append(
                            $('<option></option>').val(item.id).text(item.sanPham)
                        );
                    });
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseJSON); // In ra thông báo lỗi
                }
            });
        }
        getDataProduct()

        function getDataDanhMuc() {
            $('#danhMucSelect').empty();
            $('#danhMucSelect').append('<option value="" selected disabled>Chọn danh mục</option>');
            $.ajax({
                url: '/admin/danhmuc/list',
                method: 'GET',
                dataType: 'json',
                data: {search: ''},
                success: function (response) {
                    response.data.forEach(function (item) {
                        $('#danhMucSelect').append(
                            $('<option></option>').val(item.id).text(item.tenDanhMuc)
                        );
                    });
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseJSON); // In ra thông báo lỗi
                }
            });
        }
        getDataDanhMuc()

        function getDataThuongHieu() {
            $('#thuongHieuSelect').empty();
            $('#thuongHieuSelect').append('<option value="" selected disabled>Chọn thương hiệu</option>');
            $.ajax({
                url: '/admin/thuonghieu/list',
                method: 'GET',
                dataType: 'json',
                data: {search: ''},
                success: function (response) {
                    response.data.forEach(function (item) {
                        $('#thuongHieuSelect').append(
                            $('<option></option>').val(item.id).text(item.tenThuongHieu)
                        );
                    });
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseJSON); // In ra thông báo lỗi
                }
            });
        }
        getDataThuongHieu()

        function getDataXuatXu() {
            $('#xuatXuSelect').empty();
            $('#xuatXuSelect').append('<option value="" selected disabled>Chọn xuất xứ</option>');
            $.ajax({
                url: '/admin/xuatxu/list',
                method: 'GET',
                dataType: 'json',
                data: {search: ''},
                success: function (response) {
                    response.data.forEach(function (item) {
                        $('#xuatXuSelect').append(
                            $('<option></option>').val(item.id).text(item.tenXuatXu)
                        );
                    });
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseJSON); // In ra thông báo lỗi
                }
            });
        }
        getDataXuatXu()

        function getDataMauSac() {
            $('#mauSacSelect').empty();
            $.ajax({
                url: '/admin/mausac/list',
                method: 'GET',
                dataType: 'json',
                data: {search: ''},
                success: function (response) {
                    response.data.forEach(function (item) {
                        $('#mauSacSelect').append(
                            $('<option></option>').val(item.id).text(item.tenMauSac)
                        );
                    });
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseJSON); // In ra thông báo lỗi
                }
            });
        }
        getDataMauSac()

        function getDataKhoiLuong() {
            $('#khoiLuongSelect').empty();
            $.ajax({
                url: '/admin/khoiluong/list',
                method: 'GET',
                dataType: 'json',
                data: {search: ''},
                success: function (response) {
                    response.data.forEach(function (item) {
                        $('#khoiLuongSelect').append(
                            $('<option></option>').val(item.id).text(item.tenKhoiLuong)
                        );
                    });
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseJSON); // In ra thông báo lỗi
                }
            });
        }
        getDataKhoiLuong()

        function createProduct() {
            let xuatXu = $('#xuatXuSelect').val()
            let danhMuc = $('#danhMucSelect').val()
            let thuongHieu = $('#thuongHieuSelect').val()
            let tenSanPham = $('#tenSanPham').val()
            let trangThai = $("input[name='status_product']:checked").val();
            if (!tenSanPham) {
                toastr.error('Tên sản phẩm không được để trống');
                return;
            }
            if (!danhMuc) {
                toastr.error('Danh mục không được để trống');
                return;
            }
            if (!thuongHieu) {
                toastr.error('Thương hiệu không được để trống');
                return;
            }
            if (!xuatXu) {
                toastr.error('Xuất xứ không được để trống');
                return;
            }
            if (!trangThai) {
                toastr.error('Trạng thái sản phẩm không được để trống');
                return;
            }
            $.ajax({
                url: '/admin/product/create',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    tenSanPham: tenSanPham,
                    danhMuc: danhMuc,
                    thuongHieu: thuongHieu,
                    xuatXu: xuatXu,
                    trangThai: trangThai,
                }),
                success: function (response) {
                    getDataProduct()
                    $('#productModal').modal('hide');
                    toastr.success('Thêm sản phẩm thành công');
                },
                error: function (err) {
                }
            });
        }
        $(document).on('click', '.btn-create-product', function () {
            createProduct()
        });
    })

</script>
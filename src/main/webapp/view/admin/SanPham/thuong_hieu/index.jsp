<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container mt-4">
    <h2 class="mb-4">Quản Lý Thương Hiệu</h2>


    <div class="card mb-4" style="border: 1px solid #b85555; background-color: white;">
        <div class="card-body">
            <h5 class="mb-3">
                <i class="fas fa-filter"></i> Tìm kiếm
            </h5>

            <div class="row justify-content-center mb-3">
                <div class="col-md-6">
                    <form class="form-inline" method="GET" action="">
                        <div class="input-group w-100">
                            <input class="form-control" name="key" placeholder="Tìm kiếm tên thương hiệu ..." />
                            <button class="btn btn-red ml-2" type="submit" style="background-color: #b85555; color: white;">
                                <i class="fas fa-search"></i> Tìm kiếm
                            </button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

    <div class="card mt-4 custom-border"> <!-- Áp dụng custom-border cho card danh sách -->
        <div class="card-body">
            <div class="d-flex justify-content-between mb-3">
                <h5 class="card-title">Danh sách thương hiệu</h5>
                <a href="/admin/thuonghieu/create" class="btn btn-pink" style="background-color: #b85555; color: white;"><i class="fa-solid fa-plus" ></i> Thêm thương hiệu</a>
            </div>
            <table class="table" id="customerTable">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên thương hiệu</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Custom Styles -->
<style>
    .custom-border {
        border: 1px solid #b85555;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 8px;
    }

    .btn-teal {
        background-color: #008080;
        border-radius: 20px;
        width: 50px;
        height: 30px;
        font-size: 12px;
    }

    .btn-purple {
        background-color: #800080;
        border-radius: 20px;
        width: 50px;
        height: 30px;
        font-size: 12px;
    }

    .btn-orange {
        background-color: #FFA500;
        border-radius: 20px;
        width: 50px;
        height: 30px;
        font-size: 12px;
    }

    .table th, .table td {
        text-align: center;
        vertical-align: middle;
    }

    .table {
        margin-top: 20px;
        border-radius: 8px;
    }

    .card-title {
        font-size: 20px;
        font-weight: bold;
    }

    #inputCustomer {
        border-radius: 20px;
        padding: 10px;
    }

    #searchCustomer {
        border-radius: 20px;
        padding: 10px 20px;
    }
</style>
<script>
    $(document).ready(function () {
        let brandTable = $('#customerTable').DataTable({
            "paging": true,        // Bật phân trang
            "searching": false,    // Bật tìm kiếm
            "ordering": false,     // Bật sắp xếp
            "info": false,         // Bật thông tin tổng quan
            "lengthChange": false, // Cho phép thay đổi số lượng bản ghi hiển thị
            "pageLength": 5,       // Số lượng bản ghi trên mỗi trang
            "columnDefs": [
                {"className": "text-center", "targets": "_all"}
            ],
            "language": {
                "emptyTable": "Không có dữ liệu" // Thay đổi thông báo khi không có dữ liệu
            }
        });

        function loadTableBrand() {
            const search = $('#inputCustomer').val();
            $.ajax({
                url: '/admin/thuonghieu/list',  // Đổi URL để lấy dữ liệu thương hiệu
                method: 'GET',
                dataType: 'json',
                data: {search: search},
                success: function (data) {
                    brandTable.clear();
                    $.each(data.data, function (index, brand) {
                        brandTable.row.add([
                            index + 1,
                            brand.tenThuongHieu,
                            '<a href="/admin/thuonghieu/detail/' + brand.id + '" class="btn btn-warning btn-sm mr-2"><i class="fa-solid fa-info"></i></a>' +
                            '<a href="/admin/thuonghieu/update/' + brand.id + '" class="btn btn-success btn-sm mr-2"><i class="fa-solid fa-pen"></i></a>' +
                            '<button class="btn btn-danger btn-sm btn-delete-brand" data-brand-id="' + brand.id + '"><i class="fa-solid fa-trash"></i></button>'
                        ]);
                    });
                    brandTable.draw();
                },
                error: function (err) {
                    // toastr.error('Lỗi khi lấy dữ liệu thương hiệu', err);  // Thông báo lỗi lấy thương hiệu
                }
            });
        }

        $(document).on('click', '#searchCustomer', function () {
            loadTableBrand();  // Gọi hàm loadTableBrand
        });
        loadTableBrand();  // Gọi lần đầu để load thương hiệu

        $(document).on('click', '.btn-delete-brand', function () {
            let brandId = $(this).data('brand-id');
            Swal.fire({
                title: 'Bạn có chắc muốn xóa thương hiệu này?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Xác nhận',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#loading').show();
                    $.ajax({
                        url: '/admin/thuonghieu/delete',  // Đổi URL để xóa thương hiệu
                        method: 'PUT',
                        contentType: 'application/json',
                        data: JSON.stringify(brandId),
                        success: function (data) {
                            $('#loading').hide();
                            toastr.success('Xóa thương hiệu thành công');
                            loadTableBrand();  // Tải lại danh sách thương hiệu
                        },
                        error: function (err) {
                            $('#loading').hide();
                            toastr.error('Xóa thương hiệu lỗi', err);
                        }
                    });
                }
            });
        });
    });
</script>

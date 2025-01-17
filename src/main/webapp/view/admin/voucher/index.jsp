<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
    <h3>Quản lý giảm giá</h3>
    <div class="card">

        <div class="card-body">
            <h5 class="card-title">Tìm kiếm</h5>
            <div class="row">
                <div class="col-md-6">
                    <input type="text" id="inputSearch" class="form-control"
                           placeholder="Tìm kiếm mã hoặc tên phiếu giảm giá">
                </div>
                <div class="col-md-2">
                    <button class="btn btn-primary" id="btnSearch">Tìm kiếm</button>
                </div>
            </div>

        </div>
    </div>
    <div class="card mt-4">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-3">
                <h5 class="card-title">Danh sách</h5>
                <a href="/admin/voucher/create" class="btn btn-primary"><i class="fa-solid fa-plus"></i> Thêm Giảm Giá</a>
            </div>
            <div>
                <table class="table" id="voucherTable" >
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã</th>
                        <th>Tên</th>
                        <th>Đơn tối thiểu</th>
                        <th>Giá trị giảm</th>
                        <th>Số lượng</th>
                        <th>Ngày bắt đầu</th>
                        <th>Ngày kết thúc</th>
                        <th>Trạng Thái</th>
                        <th>Hành Động</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>

        </div>
    </div>

</div>


<script>
    $(document).ready(function () {
        let voucherTable = $('#voucherTable').DataTable({
            "paging": true,        // Bật phân trang
            "searching": false,     // Bật tìm kiếm
            "ordering": false,      // Bật sắp xếp
            "info": false,          // Bật thông tin tổng quan
            "lengthChange": false,  // Cho phép thay đổi số lượng bản ghi hiển thị
            "pageLength": 5,       // Số lượng bản ghi trên mỗi trang
            "columnDefs": [
                {"className": "width-table", "targets": "_all"}
            ],
        });

        function loadTableVoucher() {
            const search = $('#inputSearch').val();
            console.log(search)
            $.ajax({
                url: '/admin/voucher/list',
                method: 'GET',
                dataType: 'json',
                data: {search: search},
                success: function (data) {
                    voucherTable.clear();
                    $.each(data.data, function (index, voucher) {
                        voucherTable.row.add([
                            index + 1,
                            voucher.maPhieuGiamGia,
                            voucher.tenPhieuGiamGia,
                            formatCurrency(voucher.dieuKienApDung),
                            formatCurrency(voucher.giaTriGiam),
                            voucher.soLuong,
                            voucher.ngayBatDau,
                            voucher.ngayKetThuc,
                            convertStatusVoucher(voucher.trangThai),
                            '<a  href="/admin/voucher/detail/' + voucher.id + '"  class="btn btn-warning btn-sm mr-2"><i class="fa-solid fa-info"></i></a>' +
                            (voucher.trangThai !== 'DA_HUY' ? // Kiểm tra trạng thái và ẩn nút "Chỉnh sửa" nếu trạng thái là "HỦY"
                                '<a href="/admin/voucher/update/' + voucher.id + '" class="btn btn-success btn-sm mr-2"><i class="fa-solid fa-pen"></i></a>' : '') +
                            (voucher.trangThai !== 'DA_HUY' ? // Kiểm tra trạng thái và ẩn nút "Chỉnh sửa" nếu trạng thái là "HỦY"
                                '<button class="btn btn-danger btn-sm btn-delete-voucher" data-voucher-id="' + voucher.id + '"><i class="fa-solid fa-trash"></i></button>' : '')

                        ])
                    });
                    voucherTable.draw();
                },
                error: function (err) {
                    toastr.error('Lỗi khi lấy dữ liệu', err);
                }
            });
        }


        $(document).on('click', '#btnSearch', function () {
            console.log("3333")
            loadTableVoucher()
        });
        loadTableVoucher()

        $(document).on('click', '.btn-delete-voucher', function () {
            let voucherId = $(this).data('voucher-id');
            Swal.fire({
                title: 'Bạn có chắc muốn xóa?',
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
                        url: '/admin/voucher/delete',
                        method: 'PUT',
                        contentType: 'application/json',
                        data: JSON.stringify(voucherId),
                        success: function (data) {
                            $('#loading').hide();
                            toastr.success('Hủy phiếu giảm giá thành công');
                            loadTableVoucher()
                        },
                        error: function (err) {
                            $('#loading').hide();
                            toastr.error('Hủy phiếu giảm giá', err);
                        }
                    });
                }
            });
        });
    })

</script>
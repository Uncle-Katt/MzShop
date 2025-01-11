<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

    .order .tab-btn{
        cursor: pointer;
    }
    .order .nav-item .active{
        color: #a84343 !important;
    }
    .order .nav-link:hover{
        color: #a84343 !important;
        opacity: 1;
    }
    .order .nav-link{
        color: black;
        font-size: 16px;
        font-weight: 400;
    }
</style>
<div class="order">
    <h3 class="mb-4">Quản Lý Đơn Hàng</h3>
    <div class="card mt-4" style="border: 1px solid #b85555; background-color: white;">
        <div class="card-body">
            <h5 class="mb-3">
                <i class="fas fa-filter"></i> Bộ Lọc
            </h5>
            <div class="row" style="align-items: center">
            <div class="col-md-6">
                <div class="input-group mb-3">
                    <input type="text" id="input_search_order" class="form-control"  name="key" placeholder="Nhập mã đơn hàng...">
                    <button class="btn btn-outline-secondary" id="btn_search_order" type="button" style="background-color: #b85555; color: white;"><i class="fas fa-search"></i> Tìm kiếm</button>
                </div>
            </div>
            <div class="col-md-6 pl-4">
                <div class="col d-flex">
                    <label style="font-size: 18px">Loại:</label>
                    <div class="d-flex ml-4">
                        <div class="form-check">
                            <input class="form-check-input" id="order_type_all" type="radio" name="order_type"  value="" checked>
                            <label class="form-check-label" for="order_type_all">
                                Tất Cả
                            </label>
                        </div>
                        <div class="form-check ml-2">
                            <input class="form-check-input" id="order_type_online" type="radio" name="order_type" value="${ONLINE}">
                            <label class="form-check-label" for="order_type_online">
                                Online
                            </label>
                        </div>
                        <div class="form-check ml-2">
                            <input class="form-check-input" id="order_type_offline" type="radio" name="order_type" value="${OFFLINE}">
                            <label class="form-check-label" for="order_type_offline">
                                Offline
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            </div>

        </div>
    </div>
    <!-- Thêm phần Tabs vào thẻ div cuối -->
    <div class="card mt-4">
        <div class="card-body">
            <h5>Danh sách đơn hàng</h5>

            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link tab-btn" data-value="">Tất Cả</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link tab-btn" data-value="${CHO_XAC_NHAN}">Chờ Xác Nhận</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link tab-btn" data-value="${DA_XAC_NHAN}">Đã Xác Nhận</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link tab-btn" data-value="${CHO_GIA0}">Chờ Giao</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link tab-btn" data-value="${DANG_GIAO}">Đang Giao</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link tab-btn" data-value="${HOAN_THANH}">Hoàn Thành</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link tab-btn" data-value="${CHO_THANH_TOAN}">Chờ Thanh Toán</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link tab-btn" data-value="${HUY}">Hủy</a>
                </li>
            </ul>

            <div class="card-body">
                <table class="table" id="orderTable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Mã đơn hàng</th>
                        <th>Tên khách hàng</th>
                        <th>Loại</th>
                        <th>Ngày tạo</th>
                        <th>Tổng tiền</th>
                        <th>Thao tác</th>
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
        let orderTable = $('#orderTable').DataTable({
            "paging": true,        // Bật phân trang
            "searching": false,     // Bật tìm kiếm
            "ordering": false,      // Bật sắp xếp
            "info": false,          // Bật thông tin tổng quan
            "lengthChange": false,  // Cho phép thay đổi số lượng bản ghi hiển thị
            "pageLength": 5,       // Số lượng bản ghi trên mỗi trang
            "columnDefs": [
                {"className": "text-center", "targets": "_all"}
            ],
        });
        // Hàm gọi API theo giá trị của tab
        function loadTableOrder() {
            const typeValue = $('input[name="order_type"]:checked').val();
            const keyValue = $('#input_search_order').val();
            $.ajax({
                url: `/admin/order/list`,
                method: 'GET',
                dataType: 'json',
                data: {
                    value: keyValue,
                    type: typeValue,
                    sts: valueTab,
                },
                success: function (data) {
                    orderTable.clear();
                    $.each(data.data, function (index, order) {
                        orderTable.row.add([
                            index + 1,
                            order.maHoaDon,
                            order.khachHang ? order.khachHang.hoVaTen : "Khách Lẻ",
                            order.loaiHoaDon,
                            formatDate(order.ngayDat),
                            formatCurrency(order.thanhTien),
                            '<a  href="/admin/order/' + order.maHoaDon + '"  class="btn btn-warning btn-sm mr-2"><i class="fa-solid fa-info"></i></a>'
                        ]);
                    });
                    orderTable.draw();
                },
                error: function () {

                },
            });
        }
        $('input[name="order_type"]').change(function () {
            loadTableOrder();
        });
        // Tự động kích hoạt tab đầu tiên
        const defaultTab = $('.tab-btn').first();
        let valueTab = defaultTab.data('value');
        defaultTab.addClass('active'); // Đánh dấu tab đầu tiên là active
        loadTableOrder();
        // Lắng nghe sự kiện click trên các tab
        $('.tab-btn').on('click', function () {
            // Đánh dấu tab hiện tại là active và bỏ active các tab khác
            $('.tab-btn').removeClass('active');
            $(this).addClass('active');
            // Gọi API theo tab được chọn
            valueTab = $(this).data('value');
            loadTableOrder();
        })
        $('#btn_search_order').click(function () {
            loadTableOrder();
        });

    });


</script>
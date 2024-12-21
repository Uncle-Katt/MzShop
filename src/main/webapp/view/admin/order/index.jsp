<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    /* Chỉnh cho các tab */
    .nav-tabs {
        border-bottom: 2px solid #b85555; /* Viền dưới */
        margin-bottom: 0; /* Loại bỏ khoảng cách dưới */
        padding-left: 0; /* Loại bỏ khoảng cách trái */
        padding-right: 0; /* Loại bỏ khoảng cách phải */
        list-style-type: none; /* Bỏ dấu chấm ở đầu danh sách */
        display: flex; /* Đảm bảo các tab nằm ngang */
    }

    .nav-tabs li {
        margin-right: 10px; /* Khoảng cách giữa các tab */
        flex-grow: 1; /* Đảm bảo mỗi tab chiếm đều không gian */
    }

    .nav-tabs li a {
        color: #b85555;
        font-weight: bold;
        padding: 8px 10px;
        border-radius: 4px;
        background-color: transparent;  /* Bỏ màu nền */
        transition: color 0.3s ease, background-color 0.3s ease;
        text-decoration: none;
        display: block; /* Đảm bảo link chiếm hết không gian của tab */
        text-align: center; /* Canh giữa text trong tab */
    }

    .nav-tabs li a:hover {
        color: white;
        background-color: #b85555;  /* Chuyển màu nền thành đỏ khi hover */
    }

    .nav-tabs .active a {
        color: white;
        background-color: #b85555;  /* Chuyển màu nền thành đỏ khi tab được chọn */
    }

    /* Tab nội dung */
    .tab-content {
        margin-top: 20px;
    }

    .tab-content .tab-pane {
        display: none;
        padding: 15px;
    }

    .tab-content .tab-pane.active {
        display: block;
    }

    .tab-pane h6 {
        font-size: 18px;
        color: #333;
        font-weight: bold;
    }

    .tab-pane p {
        font-size: 14px;
        color: #555;
    }



    /* Tạo khoảng cách giữa các phần tử */
    .mb-4 {
        margin-bottom: 1.5rem;
    }

    .mt-4 {
        margin-top: 1.5rem;
    }

</style>
<div class="container mt-4">
    <h2 class="mb-4">Quản Lý Đơn Hàng</h2>

    <div class="card mb-4" style="border: 1px solid #b85555; background-color: white;">
        <div class="card-body">
            <h5 class="mb-3">
                <i class="fas fa-filter"></i> Bộ Lọc
            </h5>

            <div class="row justify-content-center mb-3">
                <div class="col-md-6">
                    <form class="form-inline" method="GET" action="">
                        <div class="input-group w-100">
                            <input class="form-control" name="key" placeholder="Nhập mã đơn hàng..." />
                            <button class="btn btn-red ml-2" type="submit" style="background-color: #b85555; color: white;">
                                <i class="fas fa-search"></i> Tìm kiếm
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="text-center mb-4">
                <button class="btn btn-red" type="button" style="background-color: #b85555; color: white;">
                    Làm mới
                </button>
            </div>

            <div class="form-row mb-4" style="gap: 10px;">
                <div class="col">
                    <label><h5>Loại:</h5></label>
                    <input type="radio" id="all" name="order-type" value="all" checked>
                    <label for="all">Tất Cả</label>
                    <input type="radio" id="online" name="order-type" value="online">
                    <label for="online">Online</label>
                    <input type="radio" id="offline" name="order-type" value="offline">
                    <label for="offline">Offline</label>
                </div>
            </div>
        </div>
    </div>

    <!-- Thêm phần Tabs vào thẻ div cuối -->
    <div class="card">
        <div class="card-body">
            <h5>Danh sách đơn hàng</h5>

            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#pendingConfirmation" data-toggle="tab">Chờ xác nhận</a></li>
                <li><a href="#confirmed" data-toggle="tab">Xác nhận</a></li>
                <li><a href="#waitingForDelivery" data-toggle="tab">Chờ giao hàng</a></li>
                <li><a href="#delivered" data-toggle="tab">Giao hàng</a></li>
                <li><a href="#completed" data-toggle="tab">Hoàn thành</a></li>
                <li><a href="#cancelled" data-toggle="tab">Đã hủy</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="pendingConfirmation">
                        <div class="card-body">
                            <table class="table" id="#">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Mã đơn hàng</th>
                                    <th>Tên khách hàng</th>
                                    <th>Ngày tạo</th>
                                    <th>Số điện thoại</th>
                                    <th>Tổng tiền</th>
                                    <th>Loại đơn</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                </div>

                <div class="tab-pane" id="confirmed">
                    <div class="card-body">
                        <table class="table" id="#1">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Mã đơn hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Ngày tạo</th>
                                <th>Số điện thoại</th>
                                <th>Tổng tiền</th>
                                <th>Loại đơn</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane" id="waitingForDelivery">
                    <div class="card-body">
                        <table class="table" id="#2">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Mã đơn hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Ngày tạo</th>
                                <th>Số điện thoại</th>
                                <th>Tổng tiền</th>
                                <th>Loại đơn</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane" id="delivered">
                    <div class="card-body">
                        <table class="table" id="#3">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Mã đơn hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Ngày tạo</th>
                                <th>Số điện thoại</th>
                                <th>Tổng tiền</th>
                                <th>Loại đơn</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane" id="completed">
                    <div class="card-body">
                        <table class="table" id="#4">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Mã đơn hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Ngày tạo</th>
                                <th>Số điện thoại</th>
                                <th>Tổng tiền</th>
                                <th>Loại đơn</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane" id="cancelled">
                    <div class="card-body">
                        <table class="table" id="customerTable">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Mã đơn hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Ngày tạo</th>
                                <th>Số điện thoại</th>
                                <th>Tổng tiền</th>
                                <th>Loại đơn</th>
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
    </div>
</div>

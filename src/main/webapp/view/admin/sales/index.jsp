<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div>
    <h3 class="mb-4">Bán Hàng Tại Quầy</h3>
    <div class="row">
        <div class="col-md-12">
            <button id="createInvoices" class="btn btn-primary mb-2"
                    style="background-color: #b85555; color: white; border: none;">+ Tạo Hóa Đơn
            </button>
        </div>
    </div>

    <div class="card" style="border: 2px solid #b85555;">
        <div class="card-body">
            <div class="d-flex justify-content-end mb-3">
                <button class="btn btn-secondary mr-2 reset-btn-product"
                        style="border: 2px solid #b85555; background-color: white; color: #b85555">Làm Mới
                </button>
                <button class="btn btn-success" data-toggle="modal" data-target="#productModal"
                        style="background-color: #b85555; color: white; border: none;">+ Thêm Sản Phẩm
                </button>
            </div>
            <!-- Popup Modal -->
            <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-lg" style="max-width: 80%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">Danh Sách Sản Phẩm</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span>&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="searchProduct" class="form-label">Tìm kiếm</label>
                                <input type="text" class="form-control w-50" placeholder="Nhập tên Sản Phẩm"
                                       id="searchProduct">
                            </div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Giá</th>
                                    <th>Số Lượng</th>
                                    <th>Xuất Xứ</th>
                                    <th>Thương Hiệu</th>
                                    <th>Doanh Mục</th>
                                    <th>Hành Động</th>
                                </tr>
                                </thead>
                                <tbody id="productTableBody">

                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Popup Modal nhập số lượng -->
            <div class="modal fade" id="quantityModal" tabindex="-1" aria-labelledby="quantityModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="quantityModalLabel">Nhập Số Lượng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span>&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="number" id="inputQuantity" min="1" class="form-control"
                                   placeholder="Nhập số lượng" value="1">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" id="confirmQuantity">Xác Nhận</button>
                        </div>
                    </div>
                </div>
            </div>

            <div style="min-height: 150px;">
                <div class="hoa-don">
                    <ul class="nav nav-tabs" id="invoiceList" style="display: flex">
                    </ul>

                    <div class="mt-2">
                        <table class="table" id="invoiceItemTable">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Tên Sản Phẩm</th>
                                <th>Đơn Giá</th>
                                <th>Số Lượng</th>
                                <th>Tổng tiền</th>
                                <th>Hành Động</th>
                            </tr>
                            </thead>
                            <tbody id="billProduct">

                            </tbody>
                        </table>
                        <div id="invoiceItemTableNoData" style="text-align: center">
                            Không có dữ liệu
                        </div>
                    </div>
                </div>


            </div>

            <div class="mt-3 text-right">
                <h5>Tổng Tiền: <span style="color: #b85555;" id="total-money">0</span></h5>
            </div>

        </div>
    </div>
    <div class="card mt-4" style="border: 2px solid #b85555; background-color: white;">
        <div class="card-header bg-white">
            <div class="d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Thông Tin Khách Hàng</h5>
                <div style="max-width: 400px;">
                    <button class="btn btn-danger" data-toggle="modal" data-target="#customerModal"
                            style="background-color: #b85555; color: white; border: none;">
                        + Chọn Khách Hàng
                    </button>

                    <div class="modal fade" id="customerModal" tabindex="-1" aria-labelledby="customerModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" style="max-width: 60%">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="customerModalLabel">Chọn Khách Hàng</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span>&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="searchCustomer" class="form-label">Tìm kiếm</label>
                                        <input type="text" class="form-control w-50"
                                               placeholder="Tìm kiếm tên hoặc số điện thoại" id="searchCustomer">
                                    </div>
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên</th>
                                            <th>Giới tính</th>
                                            <th>Ngày sinh</th>
                                            <th>Số điện thoại</th>
                                            <th>Email</th>
                                            <th>Hành Động</th>
                                        </tr>
                                        </thead>
                                        <tbody id="customerTable">

                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary btn-customer-null">Chọn Khách Lẻ
                                    </button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="card-body bg-white">
            <div class="d-flex">
                <div style="width: 300px"><strong>Tên khách hàng</strong></div>
                <div id="nameCustomer">Khách lẻ</div>
            </div>
            <div class="d-flex">
                <div style="width: 300px"><strong>Số điện thoại</strong></div>
                <div id="phoneCustomer">Khách lẻ</div>
            </div>
        </div>
    </div>
    <div class="mt-4">
        <div class="card" style="border: 2px solid #b85555; background-color: white;">
            <h5 class="ml-2 mt-2" style="color: #b85555;">Thanh Toán</h5>
            <div style="display: flex">
                <div class="col-6">
                    <div id="boxInfoGiaoHang" class="row mt-2" style="padding-top: 10px; display: none">
                        <div style="display: flex; justify-content: space-between; align-items: end; margin-bottom: 10px">
                            <strong>Địa chỉ giao hàng</strong>
                            <div>
                                <button class="btn btn-primary" id="selectAddressKhachHang" data-toggle="modal"
                                        data-target="#addressTableModal" style="display: none">Chọn địa chỉ
                                </button>
                            </div>
                        </div>
                        <div>
                            <div class="mb-3">
                                <label for="nameAddress" class="form-label">Họ và tên</label>
                                <input type="text" class="form-control" id="nameAddress"
                                       placeholder="Nhập tên người nhận">
                            </div>
                            <div class="mb-3">
                                <label for="phoneAddress" class="form-label">Số điện thoại</label>
                                <input type="text" class="form-control" id="phoneAddress"
                                       placeholder="Nhập Số điện thoại">
                            </div>
                            <div class="mb-3 row">
                                <div class="col-4">
                                    <label for="provinceAddress" class="form-label">Tỉnh/Thành</label>
                                    <select class="form-select" id="provinceAddress">
                                        <option value="" selected disabled>Chọn tỉnh</option>
                                    </select>
                                </div>
                                <div class="col-4">
                                    <label class="form-label" for="districtAddress">Quận/Huyện</label>
                                    <select class="form-select" id="districtAddress">
                                        <option value="" selected disabled>Chọn huyện</option>
                                    </select>
                                </div>
                                <div class="col-4">
                                    <label for="wardAddress" class="form-label">Xã/Phường</label>
                                    <select class="form-select" id="wardAddress">
                                        <option value="" selected disabled>Chọn xã</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="detailAddress" class="form-label">Địa chỉ chi tiết</label>
                                <input type="text" class="form-control" id="detailAddress"
                                       placeholder="Nhập địa chỉ chi tiết">
                            </div>
                            <div class="mt-2">
                                <label id="textTimeDhn"></label>
                            </div>
                        </div>
                        <div>
                            <div class="modal fade" id="addressTableModal" tabindex="-1"
                                 aria-labelledby="addressTableLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" style="max-width: 80%">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="addressTableLabel">Địa chỉ khách hàng</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span>&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <table class="table" id="addressTable">
                                                <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Địa chỉ mặc đinh</th>
                                                    <th>Họ và tên</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Tỉnh/Thành phố</th>
                                                    <th>Quận/Huyện</th>
                                                    <th>Xã/Phường</th>
                                                    <th>Chi tiết</th>
                                                    <th>Hành động</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-6">
                    <div class="card-body">
                        <div style="display: flex; justify-content: flex-start">
                            <div class="form-check form-switch" id="switchGiaoHangBox">
                                <input class="form-check-input" type="checkbox" role="switch" id="switchGiaoHang">
                                <label class="form-check-label" for="switchGiaoHang">Giao hàng</label>
                            </div>
                        </div>
                        <div>
                            <div style="display: flex; align-items: flex-end; justify-content: space-between; margin-bottom: 10px">
                                <div>Phiếu giảm giá</div>
                                <button class="btn btn-danger" data-toggle="modal" data-target="#voucherModal"
                                        style="background-color: #b85555; color: white; border: none;">
                                    + Phiếu giảm giá
                                </button>
                            </div>
                            <div class="alert alert-warning" role="alert" id="voucherInfo" style="display: none">
                                <div id="voucherInfoCode"></div>
                                <div id="voucherInfoName"></div>
                            </div>
                            <div class="modal fade" id="voucherModal" tabindex="-1" aria-labelledby="voucherModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" style="max-width: 70%">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="voucherModalLabel">Chọn phiếu giảm giá</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span>&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="searchVoucher" class="form-label">Tìm kiếm</label>
                                                <input type="text" class="form-control w-50"
                                                       placeholder="Nhập mã phiếu giảm giá" id="searchVoucher">
                                            </div>
                                            <table class="table" id="voucherTable">
                                                <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Mã</th>
                                                    <th>Tên</th>
                                                    <th>Giá trị tối thiểu</th>
                                                    <th>Giá trị giảm</th>
                                                    <th>Số lượng</th>
                                                    <th>Ngày bắt đầu</th>
                                                    <th>Ngày kết thúc</th>
                                                    <th>Hành Động</th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary btn-voucher-null">Bỏ Giảm Giá
                                            </button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <hr>

                        <div class="row">
                            <div class="col-md-6">
                                <p>Tổng tiền</p>
                                <p>Phí vận chuyển</p>
                                <p>Giảm giá</p>
                                <p><strong>Thành tiền</strong></p>
                                <p><strong>Tiền khách đưa:</strong></p>
                                <p>Tiền thừa</p>
                            </div>

                            <div class="col-md-6 text-right">
                                <p id="total-money2">0 đ</p>
                                <p id="ship-money">0 đ</p>
                                <p id="voucher-money">0 đ</p>
                                <p><strong style="color: #b85555;" id="total-amount">0 đ</strong></p>
                                <div class="input-group mb-3" style="border: 1px solid #b85555;">
                                    <input type="number" class="form-control" id="moneyCustomerInput"
                                           placeholder="0 VND"
                                           style="border: none;">
                                    <div class="input-group-append">
                                        <span class="input-group-text" style="border: none;">
                                            <i class="fas fa-credit-card"></i>
                                        </span>
                                    </div>
                                </div>

                                <p><strong style="color: #b85555;" id="moneyCustomer">0 ₫</strong></p>
                            </div>
                        </div>

                        <div class="text-right mt-3">
                            <button class="btn btn-payment-invoice"
                                    style="background-color: #b85555; color: white; border: none;">Xác Nhận Đặt Hàng
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        let selectedProductId = null;
        let lstBill = [];
        let lstBillDetail = [];
        let billId = null;
        let bill = {};
        let totalMoney = 0;
        let totalAmount = 0;
        let voucherMoney = 0;
        let shipMoney = 0;
        let khachHang = null;
        let voucher = null;
        let lstAddress = [];
        let isGiaoHang = false;

        $('#myTable').DataTable();

        async function loadInvoices() {
            await $.ajax({
                url: '/admin/sales/invoices',
                method: 'GET',
                dataType: 'json',
                success: function (data) {
                    lstBill = data.data
                    if (lstBill.length > 0) {
                        billId = lstBill[0].id;
                        bill = lstBill[0];
                        loadDataKhachHang(bill.khachHang)
                        loadDataVoucher(bill.phieuGiamGia)
                    } else {
                        billId = null;
                        bill = {};
                        loadDataKhachHang(null)
                        loadDataVoucher(null)
                    }
                    genTabBill(data.data);
                    countTotalMoney();
                },
                error: function (err) {
                    console.error('Lỗi khi lấy dữ liệu hóa đơn', err);
                    $('#invoiceList').append('<div>Lỗi khi tải danh sách hóa đơn.</div>');
                }
            });
        }

        function genTabBill(data) {
            var invoiceList = $('#invoiceList');
            var invoiceItemTable = $('#invoiceItemTable');

            invoiceList.empty();
            if (data.length === 0) {
                invoiceList.append('<div>Không có hóa đơn nào.</div>');
                invoiceItemTable.hide()
            } else {

                invoiceItemTable.show()
                $.each(data, function (index, invoice) {
                    let activeClass = invoice.id == billId ? 'actice-bill-tab' : '';
                    let invoiceItem =
                        '<li  class="invoice-item nav-item mr-2 bill-tab ' + activeClass + '">' +
                        '<button style="border: #ffffff" class=" btn select-btn-invoice position-relative" data-invoice-id="' + invoice.id + '">' +
                        '<strong>' + invoice.maHoaDon + '</strong>' +
                        '<span style="top: -10px; width: 1.2rem; height: 1.2rem" class="text-white position-absolute badge rounded-pill text-bg-danger bg-danger delete-invoice" data-invoice-id="' + invoice.id + '">' +
                        'x' +
                        '</span>' +
                        '</button>' +
                        '</li>';
                    invoiceList.append(invoiceItem);
                });
            }
        }

        async function loadDataInvoices() {
            try {
                await loadInvoices();
                await loadInvoicesItem();
            } catch (error) {
                console.error('Lỗi khi tải dữ liệu hóa đơn:', error);
            }
        }

        loadDataInvoices()
        $('#createInvoices').on('click', function () {
            createInvoices()
        });

        function createInvoices() {
            if (lstBill.length >= 5) {
                toastr.error('Chỉ có thể tạo tối đa 5 hóa đơn');
                return;
            }
            $.ajax({
                url: '/admin/sales/create-invoices',
                method: 'GET',
                dataType: 'json',
                success: function (data) {
                    loadDataInvoices()
                    toastr.success('Tạo hóa đơn thành công')
                },
                error: function (err) {
                    toastr.error('Lỗi khi lấy dữ liệu hóa đơn', err);
                }
            });
        }

        function loadInvoicesItem() {
            totalMoney = 0;
            if (billId == null) {
                return;
            }
            $.ajax({
                url: '/admin/sales/invoices-show',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(billId),
                success: function (response) {
                    var tableBody = $('#billProduct');
                    var invoiceItemTableNoData = $('#invoiceItemTableNoData');
                    tableBody.empty();
                    lstBillDetail = response.data
                    if (response.data.length === 0) {
                        invoiceItemTableNoData.show()
                    } else {
                        invoiceItemTableNoData.hide()
                        $.each(response.data, function (index, product) {
                            let item = '<tr>' +
                                '<td>' + (index + 1) + '</td>' +
                                '<td>' + product.tenSanPham + '</td>' +
                                '<td>' + formatCurrency(product.giaBan) + '</td>' +
                                '<td>' + product.soLuong + '</td>' +
                                '<td>' + formatCurrency(product.tongTien) + '</td>' +
                                '<td>' +
                                '<button  type="button" class="btn btn-danger delete-btn-product" data-delete-product-id="' + product.id + '" >Xóa</button></td>' +
                                '</tr>';
                            tableBody.append(item);
                            totalMoney += product.tongTien;
                        });
                    }
                    countTotalMoney()
                    // loadInvoices()
                    calculateShippingToAddress()
                },
                error: function (err) {
                    toastr.error('Đã xảy ra lỗi, vui lòng thử lại.');
                },


            });
        }

        $(document).on('click', '.select-btn-invoice', function () {
            billId = $(this).data('invoice-id');
            bill = lstBill.find(item => item.id == billId);
            loadDataKhachHang(bill.khachHang)
            loadDataVoucher(bill.phieuGiamGia)
            genTabBill(lstBill)
            loadInvoicesItem()
            countTotalMoney()
            $('#moneyCustomerInput').val('');
            $('#moneyCustomer').text(0);
        });
        $(document).on('click', '.delete-invoice', function () {
            const invoiceId = $(this).data('invoice-id');
            $.ajax({
                url: '/admin/sales/delete-invoices',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(invoiceId),
                success: function (response) {
                    toastr.success('Xóa hóa đơn thành công');
                    loadInvoices()
                    loadInvoicesItem()
                },
                error: function (err) {
                    toastr.error('Xóa hóa đơn thất bại');
                }
            });
        });


        $(document).on('click', '.delete-btn-product', function () {
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
                    let idDelete = $(this).data('delete-product-id');
                    $('#loading').show();
                    $.ajax({
                        url: '/admin/sales/delete-product',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(idDelete),
                        success: function (response) {
                            setTimeout(() => {
                                $('#loading').hide();
                            }, 500);
                            loadInvoicesItem()
                            toastr.success('Xóa sản phẩm thành công');
                        },
                        error: function (err) {
                            setTimeout(() => {
                                $('#loading').hide();
                            }, 500);
                            toastr.error('Xóa sản phẩm thất bại');
                        }
                    });
                }
            });

        });

        $(document).on('click', '.reset-btn-product', function () {
            Swal.fire({
                title: 'Bạn có chắc muốn làm mới toàn bộ sản phẩm?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Xác nhận',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#loading').fadeIn();
                    $.ajax({
                        url: '/admin/sales/delete-all-product',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(billId),
                        success: function (response) {
                            setTimeout(() => {
                                $('#loading').hide();
                            }, 500);
                            loadInvoicesItem()
                            toastr.success('Làm mới toàn bộ sản phẩm thành công');
                        },
                        error: function (err) {
                            setTimeout(() => {
                                $('#loading').hide();
                            }, 500);
                            toastr.error('Làm mới toàn bộ sản phẩm thất bại');
                        }
                    });
                }
            });

        });
        $('#searchProduct').on('input', function () {
            loadProduct();
        })

        function loadProduct() {
            let search = $('#searchProduct').val();

            $.ajax({
                url: '/admin/sales/products',
                method: 'GET',
                dataType: 'json',
                data: {search: search},
                success: function (data) {
                    var tableBody = $('#productTableBody');
                    tableBody.empty();

                    $.each(data.data, function (index, product) {
                        let item = '<tr>' +
                            '<td>' + (index + 1) + '</td>' +
                            '<td>' + product.sanPham.tenSanPham + '(' + product.mauSac.tenMauSac + ' ' + product.khoiLuong.tenKhoiLuong + ')' + '</td>' +
                            '<td>' + formatCurrency(product.giaBan) + '</td>' +
                            '<td>' + product.soLuong + '</td>' +
                            '<td>' + product.sanPham.xuatXu.tenXuatXu + '</td>' +
                            '<td>' + product.sanPham.thuongHieu.tenThuongHieu + '</td>' +
                            '<td>' + product.sanPham.danhMuc.tenDanhMuc + '</td>' +
                            '<td>' +
                            '<button  type="button" class="btn btn-success select-btn-product" data-product-id="' + product.id + '" >Chọn</button></td>' +
                            '</tr>';
                        tableBody.append(item);
                    });
                },
                error: function (err) {
                    toastr.error('Lỗi khi lấy dữ liệu sản phẩm', err);
                }
            });
        }

        $('#productModal').on('show.bs.modal', function (e) {
            loadProduct()
        });

        $(document).on('click', '.select-btn-product', function () {
            selectedProductId = $(this).data('product-id');
            $('#inputQuantity').val(1);
            $('#quantityModal').modal('show');
        });

        $('#confirmQuantity').on('click', function () {
            const quantity = $('#inputQuantity').val();
            if (quantity && quantity > 0) {
                addProduct(selectedProductId, quantity);
                $('#inputQuantity').val(1);
                $('#quantityModal').modal('hide');
            } else {
                toastr.error('Vui lòng nhập số lượng hợp lệ.');
            }
        });

        function addProduct(productId, quantity) {
            if (billId == null) {
                toastr.error('Vui lòng chọn hóa đơn');
                $('#productModal').modal('hide');
                return;
            }
            $.ajax({
                url: '/admin/sales/product-to-invoices',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    productId: productId,
                    quantity: quantity,
                    billId: billId,
                }),
                success: function (response) {
                    loadInvoicesItem()
                    $('#productModal').modal('hide');
                    toastr.success('Thêm sản phẩm thành công');

                },
                error: function (err) {
                    toastr.error('Thêm sản phẩm thất bại');
                }
            });

        }


        //     Khach Hang start
        function loadDataKhachHang(data) {
            khachHang = data;
            if (data == null) {
                $('#nameCustomer').text('Khách lẻ');
                $('#phoneCustomer').text('Khách lẻ');
            } else {
                $('#nameCustomer').text(data.hoVaTen);
                $('#phoneCustomer').text(data.soDienThoai);
            }
        }

        $('#customerModal').on('show.bs.modal', function (e) {
            loadTableCustomer()
        });

        function loadTableCustomer() {
            const search = $('#searchCustomer').val();
            $.ajax({
                url: '/admin/sales/customer',
                method: 'GET',
                dataType: 'json',
                data: {search: search},
                success: function (data) {
                    var tableBody = $('#customerTable');
                    tableBody.empty();
                    $.each(data.data, function (index, customer) {
                        let item = '<tr>' +
                            '<td>' + (index + 1) + '</td>' +
                            '<td>' + customer.hoVaTen + '</td>' +
                            '<td>' + customer.gioiTinh + '</td>' +
                            '<td>' + customer.ngaySinh + '</td>' +
                            '<td>' + customer.soDienThoai + '</td>' +
                            '<td>' + customer.email + '</td>' +
                            '<td>' +
                            '<button  type="button" class="btn btn-success select-btn-customer" data-customer-id="' + customer.id + '" >Chọn</button></td>' +
                            '</tr>';
                        tableBody.append(item);
                    });
                },
                error: function (err) {
                    toastr.error('Lỗi khi lấy dữ liệu khách hàng', err);
                }
            });
        }

        $('#searchCustomer').on('input', function () {
            loadTableCustomer()
        })

        $(document).on('click', '.select-btn-customer', function () {
            let customerId = $(this).data('customer-id');
            selectKhachHang(customerId)
            $('#switchGiaoHang').prop('checked', false);
            handelSwitchGiaoHang(false)
        });
        $(document).on('click', '.btn-customer-null', function () {
            selectKhachHang(null)
            $('#switchGiaoHang').prop('checked', false);
            handelSwitchGiaoHang(false)
        });

        function selectKhachHang(customer) {
            $.ajax({
                url: '/admin/sales/customer-invoices',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    customerId: customer,
                    billId: billId,
                }),
                success: function (response) {
                    $('#customerModal').modal('hide');
                    setTimeout(() => {
                        $('#loading').hide();
                    }, 500);
                    loadInvoices()
                    khachHang = customer
                    toastr.success('Chọn khách hàng thành công');
                    hideBtnAddressCustomer(customer)
                },
                error: function (err) {
                    setTimeout(() => {
                        $('#loading').hide();
                    }, 500);
                    toastr.error('Chọn khách hàng thất bại');
                }
            });
        }

        function hideBtnAddressCustomer(customer) {
            if (customer != null) {
                $("#selectAddressKhachHang").show()
            } else {
                $("#selectAddressKhachHang").hide()
            }
        }

        //     Khach hang end

        //     Thanh Toán start

        function countTotalMoney() {
            $('#total-money').text(formatCurrency(totalMoney));
            $('#total-money2').text(formatCurrency(totalMoney));
            $('#voucher-money').text(formatCurrency(voucherMoney));
            $('#ship-money').text(formatCurrency(shipMoney));
            totalAmount = totalMoney + shipMoney - voucherMoney;
            if (totalAmount <= 0) {
                totalAmount = 0
            }
            $('#total-amount').text(formatCurrency(totalAmount));
            let money = $('#moneyCustomerInput').val();
            let moneyResult = totalAmount - money;
            $('#moneyCustomer').text(formatCurrency(moneyResult));
        }

        function resetcountTotalMoney() {
            totalMoney = 0;
            voucherMoney = 0;
            shipMoney = 0;
            totalAmount = 0;
            $('#moneyCustomerInput').val('');
            $('#moneyCustomer').text(0);
            countTotalMoney();

        }


        countTotalMoney();

        $('#moneyCustomerInput').on('input', function () {
            let money = $('#moneyCustomerInput').val();
            let moneyResult = totalAmount - money;
            $('#moneyCustomer').text(formatCurrency(moneyResult));
        })
        $(document).on('click', '.btn-payment-invoice', function () {
            if (totalMoney <= 0) {
                toastr.error('Chưa có gì để thanh toán');
                return
            }
            let money = $('#moneyCustomerInput').val();
            let isSwitchGiaoHang = $("#switchGiaoHang").is(":checked")
            if (money < totalAmount && !isSwitchGiaoHang) {
                toastr.error('Vui lòng nhập đủ số tiền cần thanh toán');
                return;
            }
            paymentInvoice()
        });

        function paymentInvoice() {
            Swal.fire({
                title: 'Xác nhận đặt hàng ?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Xác nhận',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {

                    let nameAddress = $('#nameAddress').val();
                    let phoneAddress = $('#phoneAddress').val();
                    let provinceAddress = $('#provinceAddress option:selected').text();
                    let districtAddress = $('#districtAddress option:selected').text();
                    let wardAddress = $('#wardAddress option:selected').text();
                    let detailAddress = $('#detailAddress').val();
                    let address = null;
                    if (isGiaoHang) {
                        address = detailAddress + ", " + wardAddress + ", " + districtAddress + ", " + provinceAddress
                    }

                    $('#loading').show();
                    $.ajax({
                        url: '/admin/sales/payment-invoices',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            billId: billId,
                            tongTien: totalMoney,
                            phiVanChuyen: shipMoney,
                            tienGiam: voucherMoney,
                            thanhTien: totalAmount,
                            phuongThucThanhToan: '',
                            tenNguoiNhan: nameAddress,
                            soDienThoaiNguoiNhan: phoneAddress,
                            diaChiNguoiNhan: address,
                            isGiaoHang: isGiaoHang,
                        }),
                        success: function (response) {
                            loadDataInvoices()
                            setTimeout(() => {
                                $('#loading').hide();
                            }, 500);
                            resetcountTotalMoney();
                            $('#switchGiaoHang').prop('checked', false);
                            handelSwitchGiaoHang(false)
                            toastr.success('Đặt hàng thành công');
                            setTimeout(() => {
                                window.scrollTo({
                                    top: 0,
                                    behavior: 'smooth'
                                });
                            }, 500);
                        },
                        error: function (err) {
                            loadDataInvoices()
                            toastr.error('Đặt hàng thất bại');
                            setTimeout(() => {
                                $('#loading').hide();
                            }, 500);
                            setTimeout(() => {
                                window.scrollTo({
                                    top: 0,
                                    behavior: 'smooth'
                                });
                            }, 500);
                        }
                    });
                }
            });
        }

        //     Thanh Toán end


        //     Voucher start


        $('#voucherModal').on('show.bs.modal', function (e) {
            loadTableVoucher()
        });
        let voucherTable = $('#voucherTable').DataTable({
            "paging": true,        // Bật phân trang
            "searching": false,     // Bật tìm kiếm
            "ordering": false,      // Bật sắp xếp
            "info": false,          // Bật thông tin tổng quan
            "lengthChange": false,  // Cho phép thay đổi số lượng bản ghi hiển thị
            "pageLength": 5,       // Số lượng bản ghi trên mỗi trang

        });

        function loadTableVoucher() {
            const search = $('#searchVoucher').val();
            $.ajax({
                url: '/admin/sales/voucher',
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
                            formatDate(voucher.ngayBatDau),
                            formatDate(voucher.ngayKetThuc),
                            '<button  type="button" class="btn btn-success select-btn-voucher" data-voucher-id="' + voucher.id + '" data-voucher-value="' + voucher.dieuKienApDung + '" >Chọn</button>'
                        ])
                        voucherTable.draw();
                    });
                },
                error: function (err) {
                    toastr.error('Lỗi khi lấy dữ liệu', err);
                }
            });
        }

        $('#searchVoucher').on('input', function () {
            loadTableVoucher()
        })

        $(document).on('click', '.select-btn-voucher', function () {
            let voucherId = $(this).data('voucher-id');
            let voucherValue = $(this).data('voucher-value');
            selectVoucher(voucherId, voucherValue)
        });
        $(document).on('click', '.btn-voucher-null', function () {
            selectVoucher(null, null)
        });

        function selectVoucher(voucherId, voucherValue) {
            console.log(voucherValue)
            if (voucherValue != null && voucherValue > totalMoney) {
                toastr.error('Đơn hàng của bạn không đủ điều kiện để sử dụng phiếu giảm giá này');
                return;
            }
            $.ajax({
                url: '/admin/sales/voucher-invoices',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    voucherId: voucherId,
                    billId: billId,
                }),
                success: function (response) {
                    $('#voucherModal').modal('hide');
                    setTimeout(() => {
                        $('#loading').hide();
                    }, 500);
                    loadInvoices()
                    countTotalMoney();
                    toastr.success('Chọn phiếu giảm giá thành công');
                },
                error: function (err) {
                    setTimeout(() => {
                        $('#loading').hide();
                    }, 500);
                    toastr.error('Chọn phiếu giảm giá thất bại');
                }
            });
        }

        function loadDataVoucher(data) {
            voucher = data;
            if (data == null) {
                voucherMoney = 0
                $('#voucherInfo').hide()
                $('#voucherInfoCode').text('');
                $('#voucherInfoName').text('');
            } else {
                $('#voucherInfo').show()
                voucherMoney = data.giaTriGiam
                $('#voucherInfoCode').text("Mã: " + data.maPhieuGiamGia);
                $('#voucherInfoName').text("Tên: " + data.tenPhieuGiamGia);
            }
            countTotalMoney();
        }

        //     Voucher end

        // switchGiaoHang start
        $("#switchGiaoHang").change(function () {
            handelSwitchGiaoHang($(this).is(":checked"))
        });

        function handelSwitchGiaoHang(isCheck) {
            isGiaoHang = isCheck
            if (isCheck) {
                getDataProvince()
                $("#boxInfoGiaoHang").show()
            } else {
                shipMoney = 0
                resetFormAddress()
                countTotalMoney()
                $("#textTimeDhn").text("")
                $("#boxInfoGiaoHang").hide()
            }
            $('#moneyCustomerInput').prop('disabled', isCheck);
            hideBtnAddressCustomer(khachHang)
        }

        function resetFormAddress() {
            $('#nameAddress').val('');
            $('#phoneAddress').val('');
            $('#provinceAddress').val('');
            $('#districtAddress').val('');
            $('#wardAddress').val('');
            $('#detailAddress').val('');

        }

        // switchGiaoHang end
        // call address api ghn start

        let provinceId = null;
        let districtId = null;
        let wardId = null;
        let serviceId = null;

        let lstProvince = [];
        let lstDistrict = [];
        let lstWard = [];

        const GHN_API = "https://online-gateway.ghn.vn/shiip/public-api/master-data"
        const GHN_TOKEN = "dfe1e7cf-e582-11ee-b290-0e922fc774da"

        //get data province
        async function getDataProvince() {
            $('#provinceAddress').empty();
            $('#provinceAddress').append('<option value="" selected disabled>Chọn tỉnh</option>');
            await $.ajax({
                url: GHN_API + '/province',
                type: 'GET',
                headers: {
                    token: GHN_TOKEN
                },
                success: function (response) {
                    lstProvince = response.data.map((result) => {
                        return {
                            value: result.ProvinceID,
                            label: result.ProvinceName
                        };
                    });
                    lstProvince.forEach(function (province) {
                        $('#provinceAddress').append(
                            $('<option></option>').val(province.value).text(province.label)
                        );
                    });
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseJSON);
                }
            });
        }

        $('#provinceAddress').change(function () {
            provinceId = $(this).val();
            getDataDistrict()
            shipMoney = 0
            countTotalMoney()
            $("#textTimeDhn").text("")

        })

        async function getDataDistrict() {
            $('#districtAddress').empty();
            $('#districtAddress').append('<option value="" selected disabled>Chọn huyện</option>');
            $('#wardAddress').empty();
            $('#wardAddress').append('<option value="" selected disabled>Chọn xã</option>');
            if (provinceId != null && provinceId != "") {
                await $.ajax({
                    url: GHN_API + '/district',
                    type: 'GET',
                    headers: {
                        token: GHN_TOKEN
                    },
                    data: {
                        province_id: provinceId
                    },
                    success: function (response) {
                        lstDistrict = response.data.map((result) => {
                            return {
                                value: result.DistrictID,
                                label: result.DistrictName
                            };
                        });
                        lstDistrict.forEach(function (district) {
                            $('#districtAddress').append(
                                $('<option></option>').val(district.value).text(district.label)
                            );
                        });
                    },
                    error: function (xhr, status, error) {
                        console.log(xhr.responseJSON); // In ra thông báo lỗi
                    }
                });
            }
        }

        $('#districtAddress').change(function () {
            districtId = $(this).val();
            getDataWard()
            shipMoney = 0
            countTotalMoney()
            $("#textTimeDhn").text("")

        })

        async function getDataWard() {
            $('#wardAddress').empty();
            $('#wardAddress').append('<option value="" selected disabled>Chọn xã</option>');
            if (districtId != null && districtId != "") {
                await $.ajax({
                    url: GHN_API + '/ward',
                    type: 'GET',
                    headers: {
                        token: GHN_TOKEN
                    },
                    data: {
                        district_id: districtId
                    },
                    success: function (response) {
                        lstWard = response.data.map((result) => {
                            return {
                                value: result.WardCode,
                                label: result.WardName
                            };
                        });
                        lstWard.forEach(function (ward) {
                            $('#wardAddress').append(
                                $('<option></option>').val(ward.value).text(ward.label)
                            );
                        });
                    },
                    error: function (xhr, status, error) {
                        console.log(xhr.responseJSON); // In ra thông báo lỗi
                    }
                });
            }
        }

        $('#wardAddress').change(function () {
            wardId = $(this).val();
            calculateShippingToAddress()
        })


        async function fetchAvailableServices(valueDistrict) {
            if (valueDistrict != null) {
                await $.ajax({
                    url: 'https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/available-services',
                    method: 'GET',
                    headers: {
                        token: 'dfe1e7cf-e582-11ee-b290-0e922fc774da'
                    },
                    data: {
                        shop_id: 4962936,
                        from_district: 3440,
                        to_district: valueDistrict
                    },
                    success: function (response) {
                        serviceId = response.data[0].service_id;
                        console.log(serviceId + '-' + response.data[0].short_name);
                    },
                    error: function (error) {
                        console.log(error.responseJSON);
                    }
                });
            }
        }

        async function calculateShippingFee(lstBillDetails, valueDistrict, valueWard, serviceId) {
            console.log(lstBillDetails)
            if (lstBillDetails.length <= 0) {
                return;
            }
            const priceProduct = lstBillDetails.reduce((accumulator, currentProduct) => {
                return accumulator + (currentProduct.giaBan * currentProduct.soLuong);
            }, 0);

            const weightProduct = lstBillDetails.reduce((accumulator, currentProduct) => {
                return accumulator + (100 * currentProduct.soLuong);
            }, 0);

            console.log("Cân nặng: " + weightProduct);

            if (valueDistrict != null) {
                await $.ajax({
                    url: 'https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee',
                    method: 'GET',
                    headers: {
                        token: 'dfe1e7cf-e582-11ee-b290-0e922fc774da',
                        shop_id: 4962936
                    },
                    data: {
                        service_id: serviceId,
                        insurance_value: priceProduct,
                        coupon: null,
                        from_district_id: 3440,
                        to_district_id: valueDistrict,
                        to_ward_code: "",
                        weight: weightProduct
                    },
                    success: function (response) {
                        shipMoney = response.data.total
                        countTotalMoney()
                    },
                    error: function (error) {
                        console.log(error.responseJSON);
                    },
                    complete: function () {
                        setTimeout(() => {

                        }, 400);
                    }
                });
            }
        }

        function fetchLeadtime(valueDistrict, valueWard, serviceId) {
            if (valueDistrict != null && valueWard != null) {
                console.log(valueWard);
                $.ajax({
                    url: 'https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/leadtime',
                    method: 'GET',
                    headers: {
                        token: 'dfe1e7cf-e582-11ee-b290-0e922fc774da'
                    },
                    data: {
                        from_district_id: 3440,
                        from_ward_code: 13007,
                        to_district_id: valueDistrict,
                        to_ward_code: valueWard,
                        service_id: serviceId
                    },
                    success: function (response) {
                        const time = response.data.leadtime_order
                        const fromDateOnly = formatDate(time.from_estimate_date);
                        const toDateOnly = formatDate(time.to_estimate_date);
                        $("#textTimeDhn").text("Dự kiến giao hàng từ: " + fromDateOnly + " đến: " + toDateOnly)
                    },
                    error: function (error) {
                        console.log(error.responseJSON);
                    }
                });
            }
        }

        async function calculateShippingToAddress() {
            await fetchAvailableServices(districtId)
            await calculateShippingFee(lstBillDetail, districtId, wardId, serviceId)
            await fetchLeadtime(districtId, wardId, serviceId)
        }

        // call address api ghn end
        // address start
        let addressTable = $('#addressTable').DataTable({
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
        $('#addressTableModal').on('show.bs.modal', function (e) {
            getLstAddress()
        });

        function getLstAddress() {
            $('#loading').show();
            $.ajax({
                url: '/admin/sales/address-customer',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(khachHang.id),
                success: function (data) {
                    fillTableAddress(data.data)
                    setTimeout(() => {
                        $('#loading').hide();
                    }, 500);
                },
                error: function (err) {
                    setTimeout(() => {
                        $('#loading').hide();
                    }, 500);
                    toastr.error('Lỗi khi lấy dữ liệu address', err);
                }
            });
        }


        function fillTableAddress(data) {
            lstAddress = data
            addressTable.clear();
            $.each(data, function (index, address) {
                addressTable.row.add([
                    index + 1,
                    address.diaChiMacDinh ? '<span class="badge text-bg-primary">Mặc Đinh</span>' : '',
                    address.tenNguoiNhan,
                    address.dienThoaiNguoiNhan,
                    address.tinh,
                    address.huyen,
                    address.xa,
                    address.diaChiChiTiet,
                    '<button class="btn btn-success btn-sm btn-select-address ml-2" data-address-id="' + address.id + '">Chọn</button>'
                ]);
            });
            addressTable.draw();
        }

        $(document).on('click', '.btn-select-address', async function () {
            let addressId = $(this).data('address-id');
            let address = lstAddress.find(address => address.id == addressId);
            await getDataProvince()
            provinceId = lstProvince.find(item => item.label == address.tinh)?.value;
            console.log(address)
            console.log(lstProvince)
            console.log(provinceId)
            await getDataDistrict()
            districtId = lstDistrict.find(item => item.label == address.huyen)?.value;
            await getDataWard()
            wardId = lstWard.find(item => item.label == address.xa)?.value;
            calculateShippingToAddress()
            $('#addressTableModal').modal('hide');
            $('#provinceAddress').val(provinceId);
            $('#districtAddress').val(districtId);
            $('#wardAddress').val(wardId);
            $('#idAddress').val(address.id);
            $('#nameAddress').val(address.tenNguoiNhan);
            $('#phoneAddress').val(address.dienThoaiNguoiNhan);
            $('#detailAddress').val(address.diaChiChiTiet);
            $('#defaultAddress').prop('checked', address.diaChiMacDinh);
        });


        // address end
    });
</script>

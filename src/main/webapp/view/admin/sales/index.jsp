<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div >
    <h2>Bán Hàng Tại Quầy</h2>
    <div class="row">
        <div class="col-md-12">
            <button id="createInvoices" class="btn btn-primary mb-2" style="background-color: #b85555; color: white; border: none;" >+ Tạo Hóa Đơn</button>
        </div>
    </div>

    <div class="card" style="border: 2px solid #b85555;">
        <div class="card-body">
            <div class="d-flex justify-content-end mb-3">
                <button class="btn btn-secondary mr-2 reset-btn-product" style="border: 2px solid #b85555; background-color: white; color: #b85555">Làm Mới</button>
                <button class="btn btn-success" data-toggle="modal" data-target="#productModal" style="background-color: #b85555; color: white; border: none;">+ Thêm Sản Phẩm</button>
            </div>
            <!-- Popup Modal -->
            <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
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
                                <input type="text" class="form-control w-50" placeholder="Nhập tên Sản Phẩm" id="searchProduct">
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
            <div class="modal fade" id="quantityModal" tabindex="-1" aria-labelledby="quantityModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="quantityModalLabel">Nhập Số Lượng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span>&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="number" id="inputQuantity" min="1" class="form-control" placeholder="Nhập số lượng" value="0">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" id="confirmQuantity">Xác Nhận</button>
                        </div>
                    </div>
                </div>
            </div>

            <div style="min-height: 150px;">
                <div class="hoa-don" >
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
                <div  style="max-width: 400px;">
                    <button class="btn btn-danger"  data-toggle="modal" data-target="#customerModal" style="background-color: #b85555; color: white; border: none;">
                        + Chọn Khách Hàng</button>

                    <div class="modal fade" id="customerModal" tabindex="-1" aria-labelledby="customerModalLabel" aria-hidden="true">
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
                                        <input type="text" class="form-control w-50" placeholder="Tìm kiếm tên hoặc số điện thoại" id="searchCustomer">
                                    </div>
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã</th>
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
                                    <button type="button" class="btn btn-primary btn-customer-null">Chọn Khách Lẻ</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="card-body bg-white" >
           <div class="d-flex" >
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
                <h5 class="mb-0" style="color: #b85555;">Thanh Toán</h5>

            <div class="card-body">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">Phiếu giảm giá</label>
                    <div class="col-sm-8 text-right">
                        <button class="btn btn-danger"  data-toggle="modal" data-target="#voucherModal" style="background-color: #b85555; color: white; border: none;">
                            + Phiếu giảm giá</button>
                    </div>
                    <div class="modal fade" id="voucherModal" tabindex="-1" aria-labelledby="voucherModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" style="max-width: 68%">
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
                                        <input type="text" class="form-control w-50" placeholder="Nhập mã phiếu giảm giá" id="searchVoucher">
                                    </div>
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã</th>
                                            <th>Tên</th>
                                            <th>Loại</th>
                                            <th>Giá trị tối thiểu</th>
                                            <th>Giá trị giảm</th>
                                            <th>Số lượng</th>
                                            <th>Ngày bắt đầu</th>
                                            <th>Ngày kết thúc</th>
                                            <th>Hành Động</th>
                                        </tr>
                                        </thead>
                                        <tbody id="voucherTable">

                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary btn-voucher-null">Bỏ Giảm Giá</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="form-group row">
                    <label for="discountPercentage" class="col-sm-4 col-form-label">Phần trăm giảm</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="discountPercentage" placeholder="Phần trăm giảm" style="border: 1px solid #b85555;">
                    </div>
                </div>

                <hr>

                <div class="row">
                    <div class="col-md-6">
                        <p>Tiền hàng</p>
                        <p>Phí vận chuyển</p>
                        <p>Giảm giá</p>
                        <p><strong>Tổng số tiền</strong></p>
                        <p><strong>Khách thanh toán:</strong></p>
                        <p>Tiền thiếu</p>
                    </div>

                    <div class="col-md-6 text-right">
                        <p id="total-money2">0 đ</p>
                        <p id="ship-money">0 đ</p>
                        <p id="voucher-money">0 đ</p>
                        <p><strong style="color: #b85555;" id="total-amount">0 đ</strong></p>

                        <div class="input-group mb-3" style="border: 1px solid #b85555;">
                            <input type="text" class="form-control" id="moneyCustomerInput" placeholder="0 VND" style="border: none;">
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
                    <button class="btn btn-payment-invoice" style="background-color: #b85555; color: white; border: none;">Xác Nhận Đặt Hàng</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        let selectedProductId = null;
        let lstBill = [];
        let billId = null;
        let bill = {};
        let totalMoney = 0;
        let totalAmount = 0;
        let voucherMoney = 0;
        let shipMoney = 0;

        $('#myTable').DataTable();
        async function loadInvoices() {
            await $.ajax({
                url: '/admin/sales/invoices',
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    lstBill = data.data
                    if (lstBill.length > 0){
                        billId = lstBill[0].id;
                        bill = lstBill[0];
                        loadDataKhachHang(bill.khachHang)
                    }else {
                        billId = null;
                        bill = {};
                        loadDataKhachHang(null)
                    }
                    genTabBill(data.data);
                },
                error: function(err) {
                    console.error('Lỗi khi lấy dữ liệu hóa đơn', err);
                    $('#invoiceList').append('<div>Lỗi khi tải danh sách hóa đơn.</div>');
                }
            });
        }
        function genTabBill(data){
            var invoiceList = $('#invoiceList');
            var invoiceItemTable = $('#invoiceItemTable');

            invoiceList.empty();
            if (data.length === 0) {
                invoiceList.append('<div>Không có hóa đơn nào.</div>');
                invoiceItemTable.hide()
            } else {

                invoiceItemTable.show()
                $.each(data, function(index, invoice) {
                    let activeClass = invoice.id == billId ? 'actice-bill-tab' : '';
                    let invoiceItem =
                        '<li  class="invoice-item nav-item mr-2 bill-tab '+activeClass+'">' +
                        '<button style="border: #ffffff" class=" btn select-btn-invoice position-relative" data-invoice-id="' + invoice.id + '">' +
                        '<strong>' + invoice.maHoaDon  + '</strong>' +
                        '<span style="top: -10px; width: 1.2rem; height: 1.2rem" class="text-white position-absolute badge rounded-pill text-bg-danger bg-danger delete-invoice" data-invoice-id="' + invoice.id + '">'+
                        'x'+
                        '</span>'+
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
        $('#createInvoices').on('click', function() {
            createInvoices()
        });
        function createInvoices(){
            if(lstBill.length >=5){
                toastr.error('Chỉ có thể tạo tối đa 5 hóa đơn');
                return;
            }
            $.ajax({
                url: '/admin/sales/create-invoices',
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    loadInvoices()
                    toastr.success('Tạo hóa đơn thành công')
                },
                error: function(err) {
                    toastr.error('Lỗi khi lấy dữ liệu hóa đơn', err);
                }
            });
        }

        function loadInvoicesItem() {
            totalMoney = 0;
            if (billId == null){
                return;
            }
            $.ajax({
                url: '/admin/sales/invoices-show',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(billId),
                success: function(response) {
                    var tableBody = $('#billProduct');
                    var invoiceItemTableNoData = $('#invoiceItemTableNoData');
                    tableBody.empty();
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
                                // '<td>' + product.sanPham.thuongHieu.tenThuongHieu + '</td>' +
                                // '<td>' + product.sanPham.danhMuc.tenDanhMuc + '</td>' +
                                '<td>' +
                                '<button  type="button" class="btn btn-danger delete-btn-product" data-delete-product-id="' + product.id + '" >Xóa</button></td>' +
                                '</tr>';
                            tableBody.append(item);
                            totalMoney += product.tongTien;
                        });
                    }
                    countTotalMoney()
                    // loadInvoices()
                },
                error: function(err) {
                    toastr.error('Đã xảy ra lỗi, vui lòng thử lại.');
                },


            });
        }
        $(document).on('click', '.select-btn-invoice', function() {
            billId = $(this).data('invoice-id');
            bill = lstBill.find(item => item.id == billId);
            loadDataKhachHang(bill.khachHang)
            genTabBill(lstBill)
            loadInvoicesItem()
            countTotalMoney()
        });
        $(document).on('click', '.delete-invoice', function() {
            const invoiceId = $(this).data('invoice-id');
            $.ajax({
                url: '/admin/sales/delete-invoices',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(invoiceId),
                success: function(response) {
                    toastr.success('Xóa hóa đơn thành công');
                    loadInvoices()
                    loadInvoicesItem()
                },
                error: function(err) {
                    toastr.error('Xóa hóa đơn thất bại');
                }
            });
        });


        $(document).on('click', '.delete-btn-product', function() {
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
                        success: function(response) {
                            $('#loading').hide();
                            loadInvoicesItem()
                            toastr.success('Xóa sản phẩm thành công');
                        },
                        error: function(err) {
                            $('#loading').fadeOut();
                            toastr.error('Xóa sản phẩm thất bại');
                        }
                    });
                }
            });

        });

        $(document).on('click', '.reset-btn-product', function() {
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
                        success: function(response) {
                            $('#loading').fadeOut();
                            loadInvoicesItem()
                            toastr.success('Làm mới toàn bộ sản phẩm thành công');
                        },
                        error: function(err) {
                            $('#loading').fadeOut();
                            toastr.error('Làm mới toàn bộ sản phẩm thất bại');
                        }
                    });
                }
            });

        });
        $('#searchProduct').on('input', function() {
            loadProduct();
        })
        function loadProduct() {
            let search = $('#searchProduct').val();

            $.ajax({
                url: '/admin/sales/products',
                method: 'GET',
                dataType: 'json',
                data: { search: search },
                success: function(data) {
                    var tableBody = $('#productTableBody');
                    tableBody.empty();

                    $.each(data.data, function(index, product) {
                        let item = '<tr>' +
                            '<td>' + (index + 1) + '</td>' +
                            '<td>' + product.sanPham.tenSanPham +'('+product.mauSac.tenMauSac+' ' +product.khoiLuong.tenKhoiLuong+ ')'+ '</td>' +
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
                error: function(err) {
                    toastr.error('Lỗi khi lấy dữ liệu sản phẩm', err);
                }
            });
        }
        $('#productModal').on('show.bs.modal', function (e) {
            loadProduct()
        });

        $(document).on('click', '.select-btn-product', function() {
            selectedProductId = $(this).data('product-id');
            $('#quantityModal').modal('show');
        });

        $('#confirmQuantity').on('click', function() {
            const quantity = $('#inputQuantity').val();
            if (quantity && quantity > 0) {
                addProduct(selectedProductId,quantity);
                $('#inputQuantity').val(0);
                $('#quantityModal').modal('hide');
            } else {
                toastr.error('Vui lòng nhập số lượng hợp lệ.');
            }
        });
        function addProduct(productId, quantity) {
            if (billId == null){
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
                success: function(response) {
                    loadInvoicesItem()
                    $('#productModal').modal('hide');
                    toastr.success('Thêm sản phẩm thành công');

                },
                error: function(err) {
                    toastr.error('Thêm sản phẩm thất bại');
                }
            });

        }


    //     Khach Hang start
        function loadDataKhachHang(data){

            if (data == null){
                $('#nameCustomer').text('Khách lẻ');
                $('#phoneCustomer').text('Khách lẻ');
                $('#addressCustomer').text('Khách lẻ');
            }else {
                $('#nameCustomer').text(data.hoVaTen);
                $('#phoneCustomer').text(data.soDienThoai);
                $('#addressCustomer').text('Khách lẻ');
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
                data: { search: search },
                success: function(data) {
                    var tableBody = $('#customerTable');
                    tableBody.empty();
                    $.each(data.data, function(index, customer) {
                        let item = '<tr>' +
                            '<td>' + (index + 1) + '</td>' +
                            '<td>' + customer.maKhachHang + '</td>' +
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
                error: function(err) {
                    toastr.error('Lỗi khi lấy dữ liệu khách hàng', err);
                }
            });
        }
        $('#searchCustomer').on('input', function() {
            loadTableCustomer()
        })

        $(document).on('click', '.select-btn-customer', function() {
            let customerId = $(this).data('customer-id');
            selectKhachHang(customerId)
        });
        $(document).on('click', '.btn-customer-null', function() {
            selectKhachHang(null)
        });
        function selectKhachHang(customer){
            $.ajax({
                url: '/admin/sales/customer-invoices',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    customerId: customer,
                    billId: billId,
                }),
                success: function(response) {
                    $('#customerModal').modal('hide');
                    $('#loading').fadeOut();
                    loadInvoices()
                    toastr.success('Chọn khách hàng thành công');
                },
                error: function(err) {
                    $('#loading').fadeOut();
                    toastr.error('Chọn khách hàng thất bại');
                }
            });
        }

    //     Khach hang end

    //     Thanh Toán start

        function countTotalMoney(){
            $('#total-money').text(formatCurrency(totalMoney));
            $('#total-money2').text(formatCurrency(totalMoney));
            $('#voucher-money').text(formatCurrency(voucherMoney));
            $('#ship-money').text(formatCurrency(shipMoney));
            totalAmount = totalMoney + shipMoney - voucherMoney;
            $('#total-amount').text(formatCurrency(totalAmount));

        }
        function resetcountTotalMoney(){
            totalMoney = 0;
            voucherMoney = 0;
            shipMoney = 0;
            totalAmount = 0;
            countTotalMoney();
        }
        countTotalMoney();

        $('#moneyCustomerInput').on('input', function() {
            let money = $('#moneyCustomerInput').val();
            $('#moneyCustomer').text(formatCurrency(totalAmount - money));
        })
        $(document).on('click', '.btn-payment-invoice', function() {
            if (totalAmount <= 0){
                toastr.error('Chưa có gì để thanh toán');
                return
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
                    $('#loading').show();
                    $.ajax({
                        url: '/admin/sales/payment-invoices',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            billId: billId,
                            totalMoney: totalMoney,
                            totalAmount: totalAmount,
                            shipMoney: shipMoney,
                            voucherMoney: voucherMoney,
                        }),
                        success: function(response) {
                            resetcountTotalMoney();
                            loadInvoices()
                            $('#loading').hide();
                            toastr.success('Đặt hàng thành công');
                        },
                        error: function(err) {
                            $('#loading').hide();
                            toastr.error('Đặt hàng thất bại');

                        }
                    });
                }
            });
        }

    //     Thanh Toán end


    //     Voucher start
        function loadDataKhachHang(data){

            if (data == null){
                $('#nameCustomer').text('Khách lẻ');
                $('#phoneCustomer').text('Khách lẻ');
                $('#addressCustomer').text('Khách lẻ');
            }else {
                $('#nameCustomer').text(data.hoVaTen);
                $('#phoneCustomer').text(data.soDienThoai);
                $('#addressCustomer').text('Khách lẻ');
            }
        }
        $('#voucherModal').on('show.bs.modal', function (e) {
            loadTableVoucher()
        });
        function loadTableVoucher() {
            const search = $('#searchVoucher').val();
            $.ajax({
                url: '/admin/sales/voucher',
                method: 'GET',
                dataType: 'json',
                data: { search: search },
                success: function(data) {
                    var tableBody = $('#voucherTable');
                    tableBody.empty();
                    $.each(data.data, function(index, voucher) {
                        let item = '<tr>' +
                            '<td>' + (index + 1) + '</td>' +
                            '<td>' + voucher.maPhieuGiamGia + '</td>' +
                            '<td>' + voucher.tenPhieuGiamGia + '</td>' +
                            '<td>' + voucher.loaiPhieuGiamGia + '</td>' +
                            '<td>' + voucher.dieuKienApDung + '</td>' +
                            '<td>' + voucher.giaTriGiam + '</td>' +
                            '<td>' + voucher.soLuong + '</td>' +
                            '<td>' + voucher.ngayBatDau + '</td>' +
                            '<td>' + voucher.ngayKetThuc + '</td>' +
                            '<td>' +
                            '<button  type="button" class="btn btn-success select-btn-customer" data-customer-id="' + voucher.id + '" >Chọn</button></td>' +
                            '</tr>';
                        tableBody.append(item);
                    });
                },
                error: function(err) {
                    toastr.error('Lỗi khi lấy dữ liệu khách hàng', err);
                }
            });
        }
        $('#searchVoucher').on('input', function() {
            loadTableVoucher()
        })

        $(document).on('click', '.select-btn-voucher', function() {
            let customerId = $(this).data('voucher-id');
            selectKhachHang(customerId)
        });
        $(document).on('click', '.btn-voucher-null', function() {
            selectKhachHang(null)
        });
        function selectVoucher(voucher){
            $.ajax({
                url: '/admin/sales/customer-invoices',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    voucherId: voucher,
                    billId: billId,
                }),
                success: function(response) {
                    $('#voucherModal').modal('hide');
                    $('#loading').fadeOut();
                    loadInvoices()
                    toastr.success('Chọn khách hàng thành công');
                },
                error: function(err) {
                    $('#loading').fadeOut();
                    toastr.error('Chọn khách hàng thất bại');
                }
            });
        }

    //     Voucher end
    });
</script>

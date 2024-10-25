<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container mt-4">
    <h2>Bán Hàng Tại Quầy</h2>
    <div class="row">
        <div class="col-md-12">
            <button id="createInvoices" class="btn btn-primary mb-2" style="background-color: #b85555; color: white; border: none;" >+ Tạo Hóa Đơn</button>
        </div>
    </div>

    <div class="card" style="border: 2px solid #b85555;">
        <div class="card-body">
            <div class="d-flex justify-content-end mb-3">
                <button class="btn btn-secondary mr-2" style="border: 2px solid #b85555; background-color: white; color: #b85555">Làm Mới</button>
                <button class="btn btn-info mr-2" style="border: 2px solid #b85555;background-color: white; color: #333333">QR Code</button>
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
                    <div id="invoiceList" style="display: flex">
                        <!-- Dữ liệu hóa đơn sẽ được thêm vào đây bằng AJAX -->
                    </div>

                    <div class="mt-2">
                        <table class="table">
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
                    </div>
                </div>


            </div>

            <div class="mt-3 text-right">
                <h5>Tổng Tiền: <span style="color: #b85555;">0 đ</span></h5>
            </div>

        </div>
    </div>
    <div class="card mt-4" style="border: 2px solid #b85555; background-color: white;">
        <div class="card-header bg-white">
            <div class="d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Thông Tin Khách Hàng</h5>
                <div class="input-group" style="max-width: 400px;">
                    <input type="text" class="form-control mr-2" placeholder="Nhập tên khách hàng">
                    <div class="input-group-append">
                        <button class="btn btn-danger">+ Thêm Khách Hàng</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-body bg-white">
            <table class="table mb-0">
                <tr>
                    <th class="w-50">Tên Khách Hàng</th>
                    <td class="w-50">Khách Lẻ</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="mt-4">
        <div class="card" style="border: 2px solid #b85555; background-color: white;">
                <h5 class="mb-0" style="color: #b85555;">Thanh Toán</h5>

            <div class="card-body">
                <div class="form-group row">
                    <label for="discountCode" class="col-sm-4 col-form-label">Phiếu giảm giá</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="discountCode" placeholder="Nhập mã phiếu giảm giá" style="border: 1px solid #b85555;">
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
                        <p>0 VND</p>
                        <p>0 VND</p>
                        <p>0 VND</p>
                        <p><strong style="color: #b85555;">0 VND</strong></p>

                        <div class="input-group mb-3" style="border: 1px solid #b85555;">
                            <input type="text" class="form-control" placeholder="0 VND" style="border: none;">
                            <div class="input-group-append">
                            <span class="input-group-text" style="border: none;">
                                <i class="fas fa-credit-card"></i>
                            </span>
                            </div>
                        </div>

                        <p><strong style="color: #b85555;">0 VND</strong></p>
                    </div>
                </div>

                <div class="text-right mt-3">
                    <button class="btn" style="background-color: #b85555; color: white; border: none;">Xác Nhận Đặt Hàng</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        let selectedProductId = null;
        let billId = null;

        $('#myTable').DataTable();

        function loadInvoices() {
            $.ajax({
                url: '/admin/sales/invoices', // Địa chỉ API để lấy danh sách hóa đơn
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    var invoiceList = $('#invoiceList');
                    invoiceList.empty();
                    if (data.data.length === 0) {
                        invoiceList.append('<div>Không có hóa đơn nào.</div>');
                    } else {
                        $.each(data.data, function(index, invoice) {
                            let invoiceItem =
                                '<div class="invoice-item">' +
                                '<button style="border: #ffffff" class="select-btn-invoice" data-invoice-id="' + invoice.id + '">' +
                                '<strong>' + invoice.maHoaDon  + '</strong>' +
                                '</button>' +
                                '</div>';
                            invoiceList.append(invoiceItem);
                        });
                    }
                },
                error: function(err) {
                    console.error('Lỗi khi lấy dữ liệu hóa đơn', err);
                    $('#invoiceList').append('<div>Lỗi khi tải danh sách hóa đơn.</div>');
                }
            });
        }
        loadInvoices();
        $('#createInvoices').on('click', function() {
            createInvoices()
        });
        function createInvoices(){
            $.ajax({
                url: '/admin/sales/create-invoices',
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    loadInvoices()
                },
                error: function(err) {
                    console.error('Lỗi khi lấy dữ liệu hóa đơn', err);
                }
            });
        }
        $(document).on('click', '.select-btn-invoice', function() {
            billId = $(this).data('invoice-id');
            $.ajax({
                url: '/admin/sales/invoices-show',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(billId),
                success: function(response) {
                    console.log('Thành công: ', response);
                    loadInvoices();
                },
                error: function(err) {
                    console.error('Lỗi khi gửi dữ liệu:', err);
                    alert('Đã xảy ra lỗi, vui lòng thử lại.');
                }
            });
        });


        function loadProduct() {
            $.ajax({
                url: '/admin/sales/products',
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    var tableBody = $('#productTableBody');
                    tableBody.empty();

                    $.each(data.data, function(index, product) {
                        let item = '<tr>' +
                            '<td>' + (index + 1) + '</td>' +
                            '<td>' + product.sanPham.tenSanPham +'('+product.mauSac.tenMauSac+' ' +product.khoiLuong.tenKhoiLuong+ ')'+ '</td>' +
                            '<td>' + product.giaBan + '</td>' +
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
                    console.error('Lỗi khi lấy dữ liệu sản phẩm', err);
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
                console.log('Vui lòng nhập số lượng hợp lệ.');
            }
        });
        function addProduct(productId, quantity) {

            console.log(productId)
            console.log(quantity)
            console.log(billId)
            // $.ajax({
            //     url: '/api/your-endpoint', // Địa chỉ API mà bạn muốn gọi
            //     method: 'POST',
            //     contentType: 'application/json',
            //     data: JSON.stringify({ productId: productId, quantity: quantity }),
            //     success: function(response) {
            //         console.log('Gửi thành công:', response);
            //         // Có thể xử lý thêm ở đây nếu cần
            //     },
            //     error: function(err) {
            //         console.error('Lỗi khi gửi dữ liệu:', err);
            //     }
            // });
        }



    });
</script>

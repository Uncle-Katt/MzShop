<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    /* Wrapper để thêm tính năng cuộn ngang */
    .status-container {
        width: 100%;
        overflow-x: auto; /* Cuộn ngang */
        white-space: nowrap; /* Đảm bảo các phần tử không xuống dòng */
        border: 1px solid #ddd;
        border-radius: 10px;
        padding: 5px;
        background: #f3f3f3;
    }

    /* Container for the status line */
    .status-line {
        display: flex;
        align-items: center;
        justify-content: flex-start; /* Căn tất cả về bên trái */
        padding: 10px;
        width: 100%;
        min-width: 100%;
        height: 100px;
        margin: 20px 0;
        position: relative;

    }

    .status-line::before {
        content: "";
        position: absolute;
        top: 50%;
        left: 0; /* Bắt đầu từ cạnh trái */
        width: 100%; /* Chiều dài bằng toàn bộ container */
        height: 4px;
        background-color: #ddd;
        z-index: 0;
    }

    /* Each status step */
    .status-step {
        padding-top: 20px;
        position: relative;
        z-index: 1;
        text-align: center;
        margin-right: 20px; /* Khoảng cách giữa các bước */
    }

    /* Circle for the status */
    .status-circle {
        width: 25px;
        height: 25px;
        border-radius: 50%;
        background-color: #ddd;
        display: inline-block;
        line-height: 25px;
        font-size: 12px;
        color: #fff;
        font-weight: bold;
    }

    /* Label for the status */
    .status-label {
        margin-top: 5px;
        font-size: 14px;
        color: #333;
    }

    /* Active step */
    .status-step.active .status-circle {
        background-color: #b85555; /* Green for active step */
    }

    .status-step.active .status-label {
        font-weight: bold;
        color: #b85555;
    }

    .order-title{
        width: 35%;
    }
    .order-sub {
        width: 65%;
        white-space: wrap;      /* Không xuống dòng */
        overflow: hidden;         /* Ẩn phần nội dung thừa */
        display: inline-block;    /* Đảm bảo hiệu ứng hoạt động */
    }
</style>
<div class="container my-4">
    <h3>Tra cứu đơn hàng</h3>
    <div id="box-input-search" style="display: flex; justify-content: center; margin: 40px 0">
        <div class="input-group mb-3" style="width: 500px">
            <input id="input-code-bill" type="text" class="form-control" placeholder="Nhập mã hóa đơn" aria-describedby="button-addon2">
            <button class="btn btn-outline-secondary" type="button" id="button-search">Tra cứu</button>
        </div>
    </div>
    <div id="order-detail" style="display: none">
        <div class="card" style="border: 2px solid #b85555; background-color: white;">
            <div class="card-header bg-white">
                <div class="d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Lịch sử đơn hàng</h5>
                </div>
            </div>
            <div class="card-body bg-white">

                <div class="status-container">
                    <div id="statusContainer" class="status-line"></div>
                </div>

            </div>
        </div>

        <div class="card mt-4" style="border: 2px solid #b85555; background-color: white;">
            <div class="card-header bg-white">
                <div class="d-flex align-items-center">
                    <h5 class="mb-0">Thông Tin Đơn Hàng</h5>
                    <span class="mr-2 ml-2"> - </span>
                    <span id="labelBillCode"></span>
                </div>
            </div>

            <div class=" card-body bg-white ">
                <div class="row">
                    <div class="col-6">
                        <div class="d-flex">
                            <div class="order-title">Tên khách hàng</div>
                            <div id="orderNameCutommer" class="order-sub"></div>
                        </div>
                        <div class="d-flex mt-2">
                            <div class="order-title">Tên người nhận</div>
                            <div id="orderName" class="order-sub"></div>
                        </div>
                        <div class="d-flex mt-2">
                            <div class="order-title">Số điện thoại</div>
                            <div id="orderPhone" class="order-sub"></div>
                        </div>
                        <div class="d-flex mt-2">
                            <div class="order-title">Địa chỉ</div>
                            <div id="orderAddress" class="order-sub"></div>
                        </div>
                    </div>
                    <div class="col-6 mt-2">
                        <div class="d-flex">
                            <div class="order-title">Hình thức</div>
                            <div id="orderType" class="order-sub"></div>
                        </div>
                        <div class="d-flex mt-2">
                            <div class="order-title">Trạng thái</div>
                            <div>
                                <span  style="min-width: 100px" class="badge rounded-pill text-bg-secondary order-sub" id="orderStatus">

                                </span>
                            </div>
                        </div>
<%--                        <div class="d-flex mt-2">--%>
<%--                            <div class="order-title">Mô tả</div>--%>
<%--                            <div id="orderDec" class="order-sub"></div>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>

        <div class="card mt-4" style="border: 2px solid #b85555; background-color: white;">
            <div class="card-header bg-white">
                <div class="d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Danh sách sản phẩm</h5>
                </div>
            </div>
            <div class="card-body">
                <div class="mt-2">
                    <table class="table" id="orderTableProduct">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Đơn Giá</th>
                            <th>Số Lượng</th>
                            <th>Tổng tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="card mt-4" style="border: 2px solid #b85555; background-color: white;">
        <div style="display: flex; justify-content: flex-end">
            <div class="col-6">
                <div class="card-body">
                    <div>
                        <div style="display: flex; align-items: flex-end; justify-content: space-between; margin-bottom: 10px">
                            <div>Phiếu giảm giá</div>
                        </div>
                        <div class="alert alert-warning" role="alert" id="voucherInfo" style="display: none">
                            <div id="voucherInfoCode"></div>
                            <div id="voucherInfoName"></div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-6">
                            <p>Tổng tiền</p>
                            <p>Phí vận chuyển</p>
                            <p>Giảm giá</p>
                            <p><strong>Thành tiền</strong></p>
                        </div>

                        <div class="col-md-6 text-right">
                            <p id="total-money">0 đ</p>
                            <p id="ship-money">0 đ</p>
                            <p id="voucher-money">0 đ</p>
                            <p><strong style="color: #b85555;" id="total-amount">0 đ</strong></p>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
    </div>

    <div id="order-detail-not" style="display: none">
        <p style="text-align: center;">Không tìm thấy đơn hàng</p>
    </div>
</div>

<script>
    let hoaDon = null;
    //Trạng thái của hóa đơn phục vụ cho chuyển trạng thái
    let statusBill = [
        "TAO_DON_HANG",
        "CHO_XAC_NHAN",
        "DA_XAC_NHAN",
        "CHO_GIA0",
        "DANG_GIAO",
        "HOAN_THANH",
        "HUY",
    ]
    $(document).ready(function () {
        $('#button-search').on('click', function () {
            getDataBill()
        })


        function getDataBill() {
            let codeBill = $('#input-code-bill').val()
            $('#loading').show();
            $.ajax({
                url: '/look-up-order',
                method: 'POST',
                contentType: 'application/json',
                data: codeBill.trim(),
                success: function (data) {
                    console.log(data.data)
                    hoaDon = data.data
                    createStatusSteps(data.data.lstLichSuHoaDon)
                    loadTableProduct(data.data.lstHoaDonChiTiet)
                    loadTableHistoryPay(data.data.lstLichSuThanhToan)
                    loadMoneyBill(data.data)
                    loadDataVoucher(data.data.phieuGiamGia)
                    loadTableHistoryBill(data.data.lstLichSuHoaDon)
                    loadMoneyInfoOrder(data.data)
                    loadTableHistoryPay(data.data.lstLichSuThanhToan)
                    $('#order-detail-not').hide()
                    $('#order-detail').show()
                    setTimeout(() => {
                        $('#loading').hide();
                    }, 500);
                },
                error: function (err) {
                    $('#order-detail-not').show()
                    $('#order-detail').hide()

                    setTimeout(() => {
                        $('#loading').hide();
                    }, 500);
                    console.log('Lỗi khi lấy dữ liệu', err);
                },
            });
        }




        // Hàm tạo các bước trạng thái
        const createStatusSteps = (data) => {
            const statusContainer = $('#statusContainer');
            statusContainer.empty(); // Xóa các phần tử cũ nếu có
            data.sort((a, b) => a.id - b.id);
            // Lặp qua dữ liệu và tạo các bước trạng thái
            data.forEach((status, index) => {
                const stepDiv = $('<div>').addClass('status-step');
                // if (index !== data.length - 1) {
                stepDiv.addClass('active');
                // }
                stepDiv.html(
                    '<div class="status-circle">' + (index + 1) + '</div>' +
                    '<div class="status-label">' + convertTypeInvoiceStatus(status.loai) + '</div>'+
                    '<div class="status-label">' + formatDate(status.ngayTao) + '</div>'
                );

                // Thêm bước vào container
                statusContainer.append(stepDiv); // Thêm phần tử vào container
            });

            adjustLineWidth(statusContainer);
        };
        // Hàm điều chỉnh chiều rộng của status line
        const adjustLineWidth = (statusContainer) => {
            let totalWidth = 0;
            statusContainer.children().each(function () {
                totalWidth += $(this).outerWidth(true); // Tính tổng chiều rộng của các phần tử con
            });
            statusContainer.css('width', totalWidth + 'px');
        };

        let orderTableProduct = $('#orderTableProduct').DataTable({
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
        const loadTableProduct = (data) => {
            console.log(data)
            orderTableProduct.clear();
            $.each(data, function (index, item) {
                orderTableProduct.row.add([
                    index + 1,
                    '<div class="d-flex">' +
                    '<img style="max-width: 120px; height: 120px; object-fit: cover" class="img-thumbnail mr-2" src="'+item.sanPhamChiTiet.sanPham.urlAnh+'" alt="Image">' +
                    item.sanPhamChiTiet.sanPham.tenSanPham + ' (' + item.sanPhamChiTiet.mauSac.tenMauSac + ' ' + item.sanPhamChiTiet.khoiLuong.tenKhoiLuong + ')' +
                    '</div>',
                    formatCurrency(item.giaBan),
                    item.soLuong,
                    formatCurrency(item.giaBan*item.soLuong),

                ]);
            });
            orderTableProduct.draw();
        }
        let historyBillTable = $('#historyBillTable').DataTable({
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
        const loadTableHistoryBill = (data) => {
            data.sort((a, b) => a.id - b.id);
            historyBillTable.clear();
            $.each(data, function (index, item) {
                historyBillTable.row.add([
                    index + 1,
                    convertTypeInvoiceStatus(item.loai),
                    item.moTa,
                    formatDate(item.ngayTao)

                ]);
            });
            historyBillTable.draw();
        }
        let historyPayBillTable = $('#historyPayBillTable').DataTable({
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
        const loadTableHistoryPay = (data) => {
            data.sort((a,b) => a.id - b.id)
            historyPayBillTable.clear();
            $.each(data, function (index, item) {
                historyPayBillTable.row.add([
                    index + 1,
                    item.maGiaoDich,
                    convertPaymentMethod(item.loaiThanhToan),
                    formatCurrency(item.soTienThanhToan),
                    item.moTa,

                ]);
            });
            historyPayBillTable.draw();
        }

        const loadMoneyBill= (data) => {
            $("#total-money").text(formatCurrency(data.tongTien))
            $("#voucher-money").text(formatCurrency(data.tienGiam))
            $("#ship-money").text(formatCurrency(data.phiVanChuyen))
            $("#total-amount").text(formatCurrency(data.thanhTien))
            $("#paymentAmount").text(formatCurrency(data.thanhTien))
            $("#paymentAmountInput").val(data.thanhTien)
        }

        function loadDataVoucher(data) {
            if (data == null) {
                $('#voucherInfo').hide()
                $('#voucherInfoCode').text('');
                $('#voucherInfoName').text('');
            } else {
                $('#voucherInfo').show()
                $('#voucherInfoCode').text("Mã: "+data.maPhieuGiamGia);
                $('#voucherInfoName').text("Tên: "+data.tenPhieuGiamGia);
            }
        }
        const loadMoneyInfoOrder = (data) => {
            $("#orderNameCutommer").text(data?.khachHang ? data.khachHang.hoVaTen : "Khách lẻ");
            $("#orderName").text(data.tenNguoiNhan ? data.tenNguoiNhan : "");
            $("#orderPhone").text(data.soDienThoaiNguoiNhan ? data.soDienThoaiNguoiNhan : "");
            $("#orderAddress").text(data.diaChiNguoiNhan)
            $("#orderType").text(convertTypeBill(data.hinhThucHoaDon))
            $("#orderStatus").text(convertTypeInvoiceStatus(data.trangThai))
            $("#orderDec").text(data.moTa)
            $("#labelBillCode").text(data.maHoaDon)
        }


    });
</script>

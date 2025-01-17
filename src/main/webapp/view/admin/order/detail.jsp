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
<div>
    <h3>Quản lý đơn hàng</h3>
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
            <div class="mt-4" style="display: flex; justify-content: space-between">
               <div>
                   <button class="btn btn-primary mb-2"
                           id="btnCancel"
                           style="background-color: #b85555; color: white; border: none; display: none">Hủy
                   </button>

                   <button class="btn btn-primary mb-2"
                           id="btnAction"
                           style="background-color: #b85555; color: white; border: none;">Hành động
                   </button>
                   <button class="btn btn-primary mb-2"
                           id="btnActionBack"
                           style="background-color: #b85555; color: white; border: none;" >Quay lại trạng thái
                   </button>
               </div>
                <div>
                    <button class="btn btn-primary mb-2" id="printInvoiceBtn"
                            style="background-color: #b85555; color: white; border: none;"
                    >In Hóa Đơn</button>
                    <button class="btn btn-primary mb-2 ml-2"
                            data-toggle="modal" data-target="#historyBillModal"
                            style="background-color: #b85555; color: white; border: none;">Chi tiết
                    </button>

                    <div class="modal fade" id="historyBillModal" tabindex="-1" aria-labelledby="historyBillModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" style="max-width: 50%">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Lịch sử hóa đơn</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span>&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <table class="table" id="historyBillTable">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên</th>
                                            <th>Mô tả</th>
                                            <th>Ngày tạo</th>
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
    </div>
    <div class="card mt-4" style="border: 2px solid #b85555; background-color: white;">
        <div class="card-header bg-white">
            <div class="d-flex justify-content-between" style="align-items: flex-start">
                <h5 class="mb-0">Lịch sử thanh toán</h5>
                <button class="btn btn-primary mb-2"
                        style="background-color: #b85555; color: white; border: none;"
                        data-toggle="modal" data-target="#confirmPaymentModal"
                        id="btnConfirmPaymentModal"
                >Xác nhận thanh toán
                </button>
                <div class="modal fade" id="confirmPaymentModal" tabindex="-1" aria-labelledby="confirmPaymentModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" style="max-width: 50%">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Xác nhận thanh toán</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span>&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="d-flex">
                                    <div class="mr-2">Số tiền cần thanh toán: </div>
                                    <div id="paymentAmount"></div>
                                    <input type="hidden" class="form-control" id="paymentAmountInput" value="0">
                                </div>
                                <div class="mt-2">
                                    <label class="form-label">Tiền khách đưa:</label>
                                    <input type="number" class="form-control"
                                           id="paymentAmountCustomer"
                                           placeholder="Nhập số tiền khách đưa" value="0">
                                </div>
                                <div class="mt-2">
                                    <label class="form-label">Tiền thừa: </label>
                                    <input type="number" class="form-control" value="0" id="paymentAmountReturn" disabled>
                                </div>
                                <div class="mt-2">
                                    <label class="form-label">Ghi chú:</label>
                                    <textarea class="form-control" placeholder="Nhập ghi chú" id="decConfirmPayment"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" id="btn-confirm-payment">Xác nhận
                                </button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="mt-2">
                <table class="table" id="historyPayBillTable">
                    <thead>
                    <tr>
                        <th>STT</th>
<%--                        <th>Mã giao dịch</th>--%>
                        <th>Loại</th>
                        <th>Số tiền</th>
                        <th>Mô tả</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
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
<%--                    <div class="d-flex mt-2">--%>
<%--                        <div class="order-title">Mô tả</div>--%>
<%--                        <div id="orderDec" class="order-sub"></div>--%>
<%--                    </div>--%>
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

<script>
    let codeBill =  "${codeBill}";
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
        getDataBill()
        function getDataBill() {
            console.log(codeBill)
            $('#loading').show();
            $.ajax({
                url: '/admin/order/detail',
                method: 'POST',
                contentType: 'application/json',
                data: codeBill,
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
                    loadHideShowBtnOrderDetail(data.data)
                    setTimeout(() => {
                        $('#loading').hide();
                    }, 500);
                },
                error: function (err) {
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
                    // item.maGiaoDich,
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
        // get Index trong status hóa đơn
        function getIndexNumberByStatusBill(status){
            console.log(status)
            return statusBill.indexOf(status);
        }

        function setStatusBillByIndexNumber(index){
            if (index < 0 || index >= statusBill.length) {
                return "Index không hợp lệ"; // Xử lý khi index không hợp lệ
            }
            return statusBill[index]
        }

        const loadHideShowBtnOrderDetail = (data) => {
            let billStatus = data.trangThai;
            let billType = data.loaiHoaDon;
            if ((billStatus == "CHO_XAC_NHAN" || billStatus == "DA_XAC_NHAN") && billStatus != "HUY" ){
                $("#btnCancel").show()
            }else {
                $("#btnCancel").hide()
            }

            if (billStatus != "HOAN_THANH" && billStatus != "HUY"){
                let statusPre = getIndexNumberByStatusBill(hoaDon.trangThai)
                let statusNext = setStatusBillByIndexNumber(statusPre+1)
                $("#btnAction").text(convertTypeInvoiceStatus(statusNext))
                $("#btnAction").show()
            }else {
                $("#btnAction").hide()
            }

            if (billStatus != "CHO_XAC_NHAN" && billStatus != "HOAN_THANH"
                && billStatus != "HUY"){
                $("#btnActionBack").show()
            }else {
                $("#btnActionBack").hide()
            }
            if (billType == "OFFLINE" && billStatus == "DA_XAC_NHAN"){
                $("#btnActionBack").hide()
            }
            if (billStatus == "DANG_GIAO" && hoaDon?.lstLichSuThanhToan?.length == 0){
                $('#btnConfirmPaymentModal').show()
            }else {
                $('#btnConfirmPaymentModal').hide()
            }

        }

        function changeStatusOrder(data) {
            $.ajax({
                url: `/admin/order/change-status`,
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    ...data,
                }),
                success: function (data) {
                    getDataBill()
                    toastr.success('Thay đổi trạng thái thành công');
                },
                error: function (err) {
                    toastr.error(err.responseJSON.message)
                },
            });
        }


        $('#btnCancel').on('click', function () {
            Swal.fire({
                title: 'Bạn có chắc muốn hủy đơn hàng này?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Xác nhận',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    let data = {
                        codeBill: codeBill,
                        status: "HUY",
                        messenger: "",
                    }
                    changeStatusOrder(data)
                }
            });
        })

        $('#btnAction').on('click', function () {


            Swal.fire({
                title: 'Xác nhận đơn hàng',
                input: 'textarea', // Thêm ô input
                inputPlaceholder: 'Ghi chú',
                inputAttributes: {
                    maxlength: 500,
                    rows: 5,
                    autocapitalize: 'off',
                    autocorrect: 'off'
                },
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Xác nhận',
                cancelButtonText: 'Hủy',
            }).then((result) => {
                if (result.isConfirmed) {
                    let statusPre = getIndexNumberByStatusBill(hoaDon.trangThai)
                    console.log(statusPre)
                    let statusNext = setStatusBillByIndexNumber(statusPre+1)
                    console.log(statusNext)
                    if (statusNext == "HOAN_THANH" && hoaDon?.lstLichSuThanhToan?.length == 0){
                        toastr.error('Vui lòng xác nhận thanh toán');
                        return
                    }

                    let data = {
                        codeBill: codeBill,
                        status: statusNext,
                        messenger: result.value, // Gán giá trị từ textarea,
                    }
                    changeStatusOrder(data)
                }
            });
        })

        $('#btnActionBack').on('click', function () {
            Swal.fire({
                title: 'Quay lại trạng thái trước',
                input: 'textarea', // Thêm ô input
                inputPlaceholder: 'Ghi chú',
                inputAttributes: {
                    maxlength: 500,
                    rows: 5,
                    autocapitalize: 'off',
                    autocorrect: 'off'
                },
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Xác nhận',
                cancelButtonText: 'Hủy',
            }).then((result) => {
                if (result.isConfirmed) {
                    let status = getIndexNumberByStatusBill(hoaDon.trangThai)
                    let statusBack = setStatusBillByIndexNumber(status-1)
                    let data = {
                        codeBill: codeBill,
                        status: statusBack,
                        messenger: result.value, // Gán giá trị từ textarea,
                    }
                    changeStatusOrder(data)
                }
            });
        })


        function confirmPaymentOrder() {
            let dec = $('#decConfirmPayment').val()
            let money = parseFloat($('#paymentAmountCustomer').val()) || 0;
            let totalAmount = parseFloat($('#paymentAmountInput').val()) || 0;
            if (money < totalAmount){
                toastr.info('Bạn chưa nhập đủ số tiền cần thanh toán');
                return
            }

            $.ajax({
                url: `/admin/order/confirm-payment`,
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    codeBill: codeBill,
                    codePayment: "",
                    type: "TIEN_MAT",
                    description: dec,
                }),
                success: function (data) {
                    $('#confirmPaymentModal').modal('hide');
                    getDataBill()
                    toastr.success('Xác nhận thanh toán thành công');
                },
                error: function () {
                },
            });
        }

        $('#btn-confirm-payment').on('click', function () {
            confirmPaymentOrder();
        })


        $('#paymentAmountCustomer').on('input', function() {
            console.log('Input event triggered');
            let money = parseFloat($('#paymentAmountCustomer').val()) || 0;
            let totalAmount = parseFloat($('#paymentAmountInput').val()) || 0;
            let moneyResult = money -totalAmount;
            $('#paymentAmountReturn').val(moneyResult);
        });

        $("#printInvoiceBtn").click(function() {
            // Gửi yêu cầu GET để in hóa đơn
            $.ajax({
                url: "http://localhost:8080/invoice/print/" + codeBill,
                type: "GET",
                xhrFields: {
                    responseType: "blob" // Đặt phản hồi là blob (PDF)
                },
                success: function(response, status, xhr) {
                    // Tạo một đối tượng URL cho file PDF trả về
                    var blob = response;
                    var link = document.createElement("a");
                    link.href = URL.createObjectURL(blob);
                    link.download = "bill_" + codeBill + ".pdf"; // Đặt tên file tải về
                    link.click(); // Tự động tải về file PDF
                },
                error: function(xhr, status, error) {
                    console.error("Lỗi: " + status + ", " + error);
                }
            });
        });

    });
</script>

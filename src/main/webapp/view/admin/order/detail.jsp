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
</style>
<div>
    <h3>Quản lý đơn hàng</h3>
    <div class="card" style="border: 2px solid #b85555; background-color: white;">
        <div class="card-body bg-white" style="padding-top: 10px; padding-bottom: 0">
          <span style="font-weight: bold" id="codeBill"></span>
        </div>
        <div class="card-body bg-white">
            <div class="status-container">
                <div id="statusContainer" class="status-line"></div>
            </div>
            <div class="mt-4" style="display: flex; justify-content: space-between">
               <div>
                   <button class="btn btn-primary mb-2"
                           style="background-color: #b85555; color: white; border: none;">Hủy
                   </button>
               </div>
                <div>
                    <button class="btn btn-primary mb-2"
                            style="background-color: #b85555; color: white; border: none;">Chi tiết
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="card mt-4" style="border: 2px solid #b85555; background-color: white;">
        <div class="card-header bg-white">
            <div class="d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Lịch sử thanh toán</h5>
            </div>
        </div>
        <div class="card-body">
            <div class="mt-2">
                <table class="table" id="historyPayBillTable">
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
                    <tbody id="historyPayBill">

                    </tbody>
                </table>
                <div id="historyPayBillTableNoData" style="text-align: center">
                    Không có dữ liệu
                </div>
            </div>
        </div>
    </div>


    <div class="card mt-4" style="border: 2px solid #b85555; background-color: white;">
        <div class="card-header bg-white">
            <div class="d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Thông Tin Đơn Hàng</h5>
            </div>
        </div>

        <div class="card-body bg-white">
            <div class="d-flex">
                <div style="width: 300px">Tên khách hàng</div>
                <div >Khách lẻ</div>
            </div>
            <div class="d-flex">
                <div style="width: 300px">Số điện thoại</div>
                <div >Khách lẻ</div>
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
                            <p id="total-money2">0 đ</p>
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

    $(document).ready(function () {
        getDataBill()
        function getDataBill() {
            console.log(codeBill)
            $.ajax({
                url: '/admin/order',
                method: 'POST',
                contentType: 'application/json',
                data: codeBill,
                success: function (data) {
                    console.log(data.data)
                    createStatusSteps(data.data.lstLichSuHoaDon)
                },
                error: function (err) {
                    toastr.error('Lỗi khi lấy dữ liệu', err);
                }
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
                    '<div class="status-label">' + status.loai + '</div>'
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
        // Gọi hàm tạo các bước trạng thái khi trang tải
        createStatusSteps(statuses);

    });
</script>

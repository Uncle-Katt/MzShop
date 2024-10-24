<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container mt-4">
    <h2>Bán Hàng Tại Quầy</h2>
    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-primary mb-2" style="background-color: #b85555; color: white; border: none;">+ Tạo Hóa Đơn</button>
        </div>
    </div>

    <div class="card" style="border: 2px solid #b85555;">
        <div class="card-body">
            <div class="d-flex justify-content-end mb-3">
                <button class="btn btn-secondary mr-2" style="border: 2px solid #b85555; background-color: white; color: #b85555">Làm Mới</button>
                <button class="btn btn-info mr-2" style="border: 2px solid #b85555;background-color: white; color: #333333">QR Code</button>
                <button class="btn btn-success" style="background-color: #b85555; color: white; border: none;">+ Thêm Sản Phẩm</button>
            </div>

            <div class="d-flex justify-content-center align-items-center" style="height: 150px;">
                <p class="text-muted mb-0">No data</p>
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
    <div class="container mt-4">
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

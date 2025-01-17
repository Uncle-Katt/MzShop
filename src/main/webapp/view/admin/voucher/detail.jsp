<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <h3>Giảm Giá</h3>
    <a href="/admin/voucher" class="btn mb-2"><i class="fa-solid fa-arrow-left"></i></a>
    <div class="card">
        <div class="card-body">
            <form action="${action}" method="POST" id="voucherForm">
                <!-- ID (Ẩn đi nếu không cần chỉnh sửa ID) -->
                <input type="hidden" name="id" value="${voucher.id}">

                <!-- Mã phiếu giảm giá -->
                <div class="mb-3">
                    <label for="maPhieuGiamGia" class="form-label required">Mã phiếu giảm giá</label>
                    <input readonly type="text" class="form-control" name="maPhieuGiamGia" id="maPhieuGiamGia" placeholder="Nhập mã phiếu giảm giá" value="${voucher.maPhieuGiamGia}">
                </div>

                <!-- Tên phiếu giảm giá -->
                <div class="mb-3">
                    <label for="tenPhieuGiamGia" class="form-label required">Tên phiếu giảm giá</label>
                    <input readonly type="text" class="form-control" name="tenPhieuGiamGia" id="tenPhieuGiamGia" placeholder="Nhập tên phiếu giảm giá" value="${voucher.tenPhieuGiamGia}">
                </div>

                <!-- Giá trị giảm -->
                <div class="mb-3">
                    <label for="giaTriGiam" class="form-label required">Giá trị giảm</label>
                    <input readonly min="1" type="number" class="form-control" name="giaTriGiam" id="giaTriGiam" placeholder="Nhập giá trị giảm" value="${voucher.giaTriGiam}">
                </div>

                <!-- Điều kiện áp dụng -->
                <div class="mb-3">
                    <label for="dieuKienApDung" class="form-label required">Đơn tối thiểu</label>
                    <input readonly min="1" type="number" class="form-control" name="dieuKienApDung" id="dieuKienApDung" placeholder="Nhập điều kiện áp dụng" value="${voucher.dieuKienApDung}">
                </div>

                <!-- Ngày bắt đầu -->
                <div class="mb-3" style="width: 300px">
                    <label for="ngayBatDau" class="form-label required">Ngày bắt đầu</label>
                    <input readonly type="datetime-local" class="form-control" name="ngayBatDau" id="ngayBatDau" value="${voucher.ngayBatDau}">
                </div>

                <!-- Ngày kết thúc -->
                <div class="mb-3" style="width: 300px">
                    <label for="ngayKetThuc" class="form-label required">Ngày kết thúc</label>
                    <input readonly type="datetime-local" class="form-control" name="ngayKetThuc" id="ngayKetThuc" value="${voucher.ngayKetThuc}">
                </div>

                <!-- Số lượng -->
                <div class="mb-3">
                    <label for="soLuong" class="form-label required">Số lượng</label>
                    <input readonly min="1" type="number" class="form-control" name="soLuong" id="soLuong" placeholder="Nhập số lượng" value="${voucher.soLuong}">
                </div>

                <!-- Mô tả -->
                <div class="mb-3">
                    <label for="moTa" class="form-label required">Mô tả</label>
                    <textarea readonly class="form-control" name="moTa" id="moTa" placeholder="Nhập mô tả" >${voucher.moTa}</textarea>
                </div>
            </form>
        </div>
    </div>
</div>
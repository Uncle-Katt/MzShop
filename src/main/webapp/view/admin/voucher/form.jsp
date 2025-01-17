<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <input type="text" class="form-control" name="maPhieuGiamGia" id="maPhieuGiamGia" placeholder="Nhập mã phiếu giảm giá" value="${voucher.maPhieuGiamGia}">
                </div>

                <!-- Tên phiếu giảm giá -->
                <div class="mb-3">
                    <label for="tenPhieuGiamGia" class="form-label required">Tên phiếu giảm giá</label>
                    <input type="text" class="form-control" name="tenPhieuGiamGia" id="tenPhieuGiamGia" placeholder="Nhập tên phiếu giảm giá" value="${voucher.tenPhieuGiamGia}">
                </div>

                <!-- Giá trị giảm -->
                <div class="mb-3">
                    <label for="giaTriGiam" class="form-label required">Giá trị giảm</label>
                    <input min="1" type="number" class="form-control" name="giaTriGiam" id="giaTriGiam" placeholder="Nhập giá trị giảm" value="${voucher.giaTriGiam}">
                </div>

                <!-- Điều kiện áp dụng -->
                <div class="mb-3">
                    <label for="dieuKienApDung" class="form-label required">Đơn tối thiểu</label>
                    <input min="1" type="number" class="form-control" name="dieuKienApDung" id="dieuKienApDung" placeholder="Nhập điều kiện áp dụng" value="${voucher.dieuKienApDung}">
                </div>

                <!-- Ngày bắt đầu -->
                <div class="mb-3" style="width: 300px">
                    <label for="ngayBatDau" class="form-label required">Ngày bắt đầu</label>
                    <input type="datetime-local" class="form-control" name="ngayBatDau" id="ngayBatDau" value="${voucher.ngayBatDau}">
                </div>

                <!-- Ngày kết thúc -->
                <div class="mb-3" style="width: 300px">
                    <label for="ngayKetThuc" class="form-label required">Ngày kết thúc</label>
                    <input type="datetime-local" class="form-control" name="ngayKetThuc" id="ngayKetThuc" value="${voucher.ngayKetThuc}">
                </div>

                <!-- Số lượng -->
                <div class="mb-3">
                    <label for="soLuong" class="form-label required">Số lượng</label>
                    <input min="1" type="number" class="form-control" name="soLuong" id="soLuong" placeholder="Nhập số lượng" value="${voucher.soLuong}">
                </div>

                <!-- Mô tả -->
                <div class="mb-3">
                    <label for="moTa" class="form-label required">Mô tả</label>
                    <textarea class="form-control" name="moTa" id="moTa" placeholder="Nhập mô tả" >${voucher.moTa}</textarea>
                </div>

                <div class="mb-3">
                    <label for="moTa" class="form-label required">Trạng Thái</label>
                    <select class="form-control" name="trangThai" id="trangThai">
                        <option value="SAP_DIEN_RA" ${voucher.trangThai == 'SAP_DIEN_RA' ? 'selected' : ''}>Sắp Diễn Ra</option>
                        <option value="DANG_DIEN_RA" ${voucher.trangThai == 'DANG_DIEN_RA' ? 'selected' : ''}>Đang Diễn Ra</option>
                        <option value="DA_KET_THUC" ${voucher.trangThai == 'DA_KET_THUC' ? 'selected' : ''}>Đã Kết Thúc</option>
                    </select>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary">Lưu</button>
            </form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#voucherForm").on("submit", function (event) {
            event.preventDefault();

            // Kiểm tra mã phiếu giảm giá
            const maPhieuGiamGia = $("#maPhieuGiamGia").val();
            if (!maPhieuGiamGia.trim()) {
                toastr.error("Mã phiếu giảm giá không được để trống.");
                return false;
            }

            // Kiểm tra tên phiếu giảm giá
            const tenPhieuGiamGia = $("#tenPhieuGiamGia").val();
            if (!tenPhieuGiamGia.trim()) {
                toastr.error("Tên phiếu giảm giá không được để trống.");
                return false;
            }

            // Kiểm tra giá trị giảm
            const giaTriGiam = $("#giaTriGiam").val();
            if (!giaTriGiam || giaTriGiam <= 0) {
                toastr.error("Giá trị giảm phải lớn hơn 0.");
                return false;
            }

            // Kiểm tra điều kiện áp dụng
            const dieuKienApDung = $("#dieuKienApDung").val();
            if (!dieuKienApDung || dieuKienApDung <= 0) {
                toastr.error("Đơn tối thiểu phải lớn hơn 0.");
                return false;
            }

            // Kiểm tra ngày bắt đầu
            const ngayBatDau = new Date($("#ngayBatDau").val());
            const ngayKetThuc = new Date($("#ngayKetThuc").val());
            const now = new Date();

            if (!ngayBatDau || isNaN(ngayBatDau.getTime())) {
                toastr.error("Ngày bắt đầu không được để trống và phải đúng định dạng.");
                return false;
            }

            if (ngayBatDau < now) {
                toastr.error("Ngày bắt đầu phải lớn hơn hoặc bằng ngày hiện tại.");
                return false;
            }

            // Kiểm tra ngày kết thúc
            if (!ngayKetThuc || isNaN(ngayKetThuc.getTime())) {
                toastr.error("Ngày kết thúc không được để trống và phải đúng định dạng.");
                return false;
            }

            if (ngayKetThuc <= ngayBatDau) {
                toastr.error("Ngày kết thúc phải lớn hơn ngày bắt đầu.");
                return false;
            }


            // Kiểm tra tên phiếu giảm giá
            const soLuong = $("#soLuong").val();
            if (!soLuong || soLuong <= 0) {
                toastr.error("Số lượng phai lơn hơn 0.");
                return false;
            }

            // Kiểm tra giá trị giảm
            const moTa = $("#moTa").val();
            if (!moTa.trim()) {
                toastr.error("Mô tả không được để trống.");
                return false;
            }


            // Hiển thị xác nhận trước khi gửi form
            Swal.fire({
                title: 'Xác nhận lưu?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Xác nhận',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    $("#voucherForm")[0].submit(); // Gửi form trực tiếp sau khi xác nhận
                }
            });
        });
    });
</script>

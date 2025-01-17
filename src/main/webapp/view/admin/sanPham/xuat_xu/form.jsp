<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div>
    <h3>${btnText}</h3>
    <a href="/admin/origin" class="btn mb-2"><i class="fa-solid fa-arrow-left"></i> Quay lại</a>
    <div class="card">
        <div class="card-body">
            <form id="xuatXuForm" action="${action}" method="post">
                <input type="hidden" class="form-control" name="id" id="id" value="${xuatXu.id}">

                <div class="mb-3">
                    <label for="inputName" class="form-label">Tên Màu Sắc</label>
                    <input type="text" class="form-control" name="tenXuatXu" id="inputName" placeholder="Nhập tên xuất xứ" value="${xuatXu.tenXuatXu}">
                </div>

                <div class="d-flex justify-content-end mt-4">
                    <button type="submit" class="btn btn-primary">${btnText}</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    function validateForm(event) {
        event.preventDefault(); // Ngăn hành động gửi form mặc định

        // Kiểm tra tên
        var name = $("#inputName").val();
        if (name === "") {
            toastr.error("Xuất Xứ không được để trống");
            return false;
        }

        // Hiển thị xác nhận trước khi gửi form
        Swal.fire({
            title: 'Xác Nhận ${btnText}?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Xác nhận',
            cancelButtonText: 'Hủy'
        }).then((result) => {
            if (result.isConfirmed) {
                event.target.submit(); // Gửi form trực tiếp sau khi xác nhận
            }
        });
    }

    // Gắn sự kiện validateForm vào form
    $(document).ready(function () {
        $("#xuatXuForm").on("submit", validateForm);
    });
</script>
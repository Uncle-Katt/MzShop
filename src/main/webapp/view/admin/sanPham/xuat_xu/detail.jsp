<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Liên kết CSS và JS của Toastr -->
<link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>

<div>
    <h3>Chi tiết Xuất Xứ</h3>
    <a href="/admin/xuatxu" class="btn mb-2"><i class="fa-solid fa-arrow-left"></i> Quay lại</a>
    <div class="card">
        <div class="card-body">
            <form id="brandForm" action="/admin/xuatxu/update" method="post">
                <input type="hidden" class="form-control" name="id" id="id" value="${xuatXu.id}">

                <div class="mb-3">
                    <label class="form-label">Tên Xuất Xứ:</label>
                    <input type="text" class="form-control" name="tenXuatXu" value="${xuatXu.tenXuatXu}">
                </div>

                <div class="d-flex justify-content-end mt-4">
                    <button type="submit" class="btn btn-primary">Cập Nhật</button>
                    <a href="/admin/xuatxu" class="btn btn-secondary ms-2">Hủy</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Thêm thông báo toastr -->
<script>
    <c:if test="${not empty successMessage}">
    toastr.success("${successMessage}");
    </c:if>

    <c:if test="${not empty errorMessage}">
    toastr.error("${errorMessage}");
    </c:if>
</script>

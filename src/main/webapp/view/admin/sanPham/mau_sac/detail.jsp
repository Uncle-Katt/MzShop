<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
    <h3>Chi tiết Màu Sắc</h3>
    <a href="/admin/color" class="btn mb-2"><i class="fa-solid fa-arrow-left"></i> Quay lại</a>
    <div class="card">
        <div class="card-body">
            <input type="hidden" class="form-control" name="id" id="id" value="${mauSac.id}">
            <div class="mb-3">
                <label class="form-label">Tên Màu Sắc</label>
                <input type="text" readonly class="form-control" name="tenMauSac" value="${mauSac.tenMauSac}">
            </div>
        </div>
    </div>
</div>

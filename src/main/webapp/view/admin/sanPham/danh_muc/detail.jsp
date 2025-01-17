<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
    <h3>Chi tiết Danh Mục</h3>
    <a href="/admin/category" class="btn mb-2"><i class="fa-solid fa-arrow-left"></i> Quay lại</a>
    <div class="card">
        <div class="card-body">
            <input type="hidden" class="form-control" name="id" id="id" value="${danhMuc.id}">

            <div class="mb-3">
                <label class="form-label">Tên Danh Mục:</label>
                <input type="text" class="form-control" name="tenDanhMuc" readonly value="${danhMuc.tenDanhMuc}">
            </div>
        </div>
    </div>
</div>


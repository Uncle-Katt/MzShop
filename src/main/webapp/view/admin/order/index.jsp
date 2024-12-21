<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
    <h3>Quản lý hóa đơn</h3>
    <div class="card">

        <div class="card-body">
            <h5 class="card-title">Tìm kiếm</h5>
            <div class="row">
                <div class="col-md-6">
                    <input type="text" id="inputCustomer" class="form-control"
                           placeholder="Tìm kiếm tên hoặc sdt khách hàng">
                </div>
                <div class="col-md-2">
                    <button class="btn btn-primary" id="searchCustomer">Tìm kiếm</button>
                </div>
            </div>

        </div>
    </div>
    <div class="card mt-4">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-3">
                <h5 class="card-title">Danh sách</h5>
                <a href="/admin/customer/create" class="btn btn-primary"><i class="fa-solid fa-plus"></i> Thêm khách
                    hàng</a>
            </div>
            <table class="table" id="customerTable">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên khách hàng</th>
                    <th>Ngày sinh</th>
                    <th>Giới Tính</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

</div>
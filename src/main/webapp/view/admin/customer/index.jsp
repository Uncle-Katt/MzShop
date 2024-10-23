<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container mt-5">
    <h1>Danh Sách Khách Hàng</h1>

    <%-- Bảng danh sách khách hàng --%>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Email</th>
            <th>Số điện thoại</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>Nguyễn Văn A</td>
            <td>vana@example.com</td>
            <td>0123456789</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Trần Thị B</td>
            <td>thib@example.com</td>
            <td>0987654321</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Nguyễn Văn C</td>
            <td>vanc@example.com</td>
            <td>0112233445</td>
        </tr>
        </tbody>
    </table>

    <%-- Form thêm khách hàng --%>
    <h2>Thêm Khách Hàng</h2>
    <form action="/addCustomer" method="post">
        <div class="form-group">
            <label for="customerName">Tên:</label>
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <div class="form-group">
            <label for="customerEmail">Email:</label>
            <input type="email" class="form-control" id="customerEmail" name="customerEmail" required>
        </div>
        <div class="form-group">
            <label for="customerPhone">Số điện thoại:</label>
            <input type="tel" class="form-control" id="customerPhone" name="customerPhone" required>
        </div>
        <button type="submit" class="btn btn-primary">Thêm Khách Hàng</button>
    </form>
</div>
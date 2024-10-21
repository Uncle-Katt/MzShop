<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Nhập & Đăng Ký</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Đăng nhập / Đăng ký</h2>

    <!-- Hiển thị thông báo -->
    <c:if test="${not empty message}">
        <div class="alert alert-info">${message}</div>
    </c:if>

    <!-- Form Đăng Ký -->
    <form action="/dang-ky" method="post">
        <div class="form-group">
            <label for="username">Tên tài khoản</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tên tài khoản" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Nhập email" required>
        </div>
        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
        </div>
        <button type="submit" class="btn btn-primary">Đăng Ký</button>
    </form>

    <hr>

    <!-- Form Xác Thực -->
    <h3>Xác Thực Tài Khoản</h3>
    <form action="/xac-thuc" method="post">
        <div class="form-group">
            <label for="code">Mã xác thực</label>
            <input type="text" class="form-control" id="code" name="code" placeholder="Nhập mã xác thực">
        </div>
        <button type="submit" class="btn btn-success">Xác Thực</button>
    </form>
</div>
</body>
</html>

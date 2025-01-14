<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f7f7f7; /* Màu nền nhẹ */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #ffffff;
            border: 2px solid #b85555;
            border-radius: 10px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .login-container h3 {
            color: #b85555;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-control {
            border: 1px solid #b85555;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            box-shadow: 0 0 8px rgba(184, 85, 85, 0.5);
            border-color: #b85555;
        }

        .btn-primary {
            background-color: #b85555;
            border: none;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #d81b60;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
        }

        .form-text {
            text-align: center;
            margin-top: 15px;
        }

        .form-text a {
            color: #b85555;
            font-weight: bold;
            text-decoration: none;
        }

        .form-text a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h3>Đăng nhập</h3>
    <form action="/login" method="POST">
        <div class="mb-3">
            <label for="email" class="form-label">Tài Khoản</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Nhập số điện thoại của bạn" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu của bạn" required>
        </div>
        <button type="submit" class="btn btn-primary">Đăng nhập</button>
        <p class="form-text">
            Chưa có tài khoản? <a href="/register">Đăng ký ngay</a>
        </p>
    </form>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

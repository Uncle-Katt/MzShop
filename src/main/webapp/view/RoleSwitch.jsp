<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thay đổi vai trò quản lý bài viết</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            text-align: center;
        }

        .container {
            margin: 50px auto;
            max-width: 1200px;
        }

        h1 {
            color: #d52b1e;
        }

        .roles {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
        }

        .role {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 23%;
            padding: 20px;
            transition: transform 0.2s;
            cursor: pointer;
        }

        .role:hover {
            transform: scale(1.05);
        }

        .role img {
            width: 100%;
            height: 200px; /* Chiều cao cố định cho hình ảnh */
            object-fit: cover; /* Đảm bảo hình ảnh không bị méo */
            border-radius: 10px;
        }

        .role h2 {
            margin: 15px 0 10px;
            font-size: 18px;
            color: #333;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Thay đổi vai trò quản lý bán son</h1>
    <div class="roles">
        <!-- Admin role -->
        <div class="role" onclick="window.location.href='/quan-ly-view'">
            <img src="https://cdn-icons-png.flaticon.com/512/2206/2206368.png" alt="Admin">
            <h2><i class="fas fa-user-shield"></i> Admin</h2>
        </div>

        <!-- Lecturer role -->
        <div class="role" onclick="window.location.href='/phieu-giam-gia/list'">
            <img src="https://png.pngtree.com/png-clipart/20210826/ourmid/pngtree-start-salesman-service-hand-drawn-cartoon-elements-png-image_3539487.jpg" alt="Nhân viên">
            <h2><i class="fas fa-chalkboard-teacher"></i> Nhân viên</h2>
        </div>

    </div>
</div>

</body>
</html>

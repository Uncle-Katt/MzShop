<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
    <div>
        <div class="mb-3">
            <label for="username" class="form-label">Tài Khoản</label>
            <input type="email" class="form-control" id="username" name="username" placeholder="Nhập tài khoản của bạn" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu của bạn" required>
        </div>
        <button type="submit" class="btn btn-primary" id="btn-login" style="background-color: #a84343">Đăng nhập</button>
    </div>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script>

    $(document).ready(function () {
        // Khi nhấn nút đăng nhập
        $("#btn-login").click(function (e) {
            e.preventDefault(); // Ngăn chặn việc gửi form mặc định

            var username = $("#username").val();
            var password = $("#password").val();

            // Kiểm tra xem các trường có hợp lệ không
            if (username && password) {
                // Gửi yêu cầu AJAX đăng nhập
                $.ajax({
                    url: "/admin/login",  // Đổi thành URL đăng nhập thực tế của bạn
                    method: "POST",
                    contentType: "application/json",  // Đặt Content-Type là application/json
                    data: JSON.stringify({
                        username: username,
                        password: password
                    }),
                    success: function (response) {
                        let data = response.data
                        localStorage.setItem("account",  JSON.stringify(data));
                        window.location.href = "/admin";
                    },
                    error: function (xhr, status, error) {
                        toastr.error("Tài khoản và mật khẩu không chính xác.");
                        localStorage.removeItem("account");
                    }
                });
            } else {
                toastr.error("Vui lòng nhập đầy đủ tài khoản và mật khẩu.");
            }
        });
    });


</script>



</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        .header-top {
            background-color: #b85555;
            color: white;
            text-align: center;
            padding: 10px 0;
            font-size: 16px;
            font-weight: bold;
        }

        .logo img {
            width: 105px;
            height: 80px;
        }

        .nav-link {
            color: #b85555 !important;
            font-weight: bold;
        }

        .nav-link:hover {
            color: white !important;
            background-color: #b85555;
            border-radius: 5px;
        }

        .search-bar input {
            border-radius: 30px 0 0 30px;
        }

        .search-bar button {
            border-radius: 0 30px 30px 0;
            background-color: #b85555;
            color: white;
        }

        .search-bar button:hover {
            background-color: #d81b60;
        }

        .icons a {
            color: #b85555;
            font-size: 20px;
            margin: 0 10px;
        }

        .icons a:hover {
            color: #d81b60;
        }


        .section-title b {
            display: block;
            height: 3px;
            background-color: #b85555;
            flex-grow: 1;
        }

        .section-title h2 {
            font-size: 2rem;
            color: #b85555;
            text-align: center;
            margin: 0 20px;
            white-space: nowrap;
        }

        footer {
            background-color: #b85555;
            color: #ffffff;
            padding: 10px 0;
            text-align: center;
        }

        footer .footer-info {
            margin-bottom: 15px;
        }

        footer .footer-info p {
            margin: 5px 0;
        }

        footer .footer-info p:first-child {
            margin-top: 0;
        }

        footer .footer-links {
            margin-top: 10px;
        }

        footer .footer-links a {
            color: #ffffff;
            text-decoration: none;
            margin: 0 10px;
            font-size: 14px;
        }

        footer .footer-links a:hover {
            text-decoration: underline;
        }

        /* Định dạng các icon trong footer */
        .footer-icons {
            margin-top: 15px;
        }

        .footer-icons a {
            margin: 0 10px;
        }

        .footer-icons img {
            width: 40px; /* Kích thước icon */
            height: 40px;
            transition: transform 0.3s ease;
        }

        /* Hiệu ứng hover cho các icon */
        .footer-icons a:hover img {
            transform: scale(1.2); /* Phóng to nhẹ khi hover */
        }
        .cart-container {
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #b85555;
            border-radius: 8px;
            background-color: #fdfdfd;
            max-width: 900px;
        }

        .cart-header {
            font-weight: bold;
            color: #b85555;
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
        }

        .cart-item {
            border-bottom: 1px solid #b85555;
            padding: 20px 0;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .item-image img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .item-info h5 {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .item-info p {
            font-size: 14px;
            color: #b85555;
        }

        .item-quantity input {
            width: 60px;
            text-align: center;
        }

        .item-actions button {
            background-color: #b85555;
            color: white;
            border: none;
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .item-actions button:hover {
            background-color: #d81b60;
        }

        .cart-summary {
            margin-top: 20px;
            text-align: right;
        }

        .cart-summary h5 {
            font-size: 18px;
            font-weight: bold;
            color: #b85555;
        }

        .cart-summary button {
            background-color: #b85555;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .cart-summary button:hover {
            background-color: #d81b60;
        }
        .cart-item button {
            background-color: #b85555;
            color: white;
            border: none;
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .cart-item button:hover {
            background-color: #d81b60; /* Màu đỏ đậm hơn khi hover */
            transform: scale(1.1); /* Phóng to nhẹ */
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2); /* Hiệu ứng bóng */
        }

        .cart-item button:focus {
            outline: none;
        }

    </style>
</head>
<body>
<header>
    <!-- Header Top -->
    <div class="header-top">
        Xin chào quý khách! Chúc quý khách một ngày tốt lành.
    </div>

    <!-- Header Bottom -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <!-- Logo -->
            <a class="navbar-brand logo" href="#">
                <img src="/includes/images/1.jpg" alt="Logo" class="img-fluid" />
            </a>

            <!-- Toggler for Mobile -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Menu Items -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/view/client/index.jsp">TRANG CHỦ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/view/client/SanPham/sanpham.jsp">SẢN PHẨM</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">GIỚI THIỆU</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">TIN TỨC</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">LIÊN HỆ</a>
                    </li>
                </ul>

                <!-- Search Bar -->
                <form class="d-flex search-bar">
                    <input class="form-control me-2" type="search" placeholder="Tìm kiếm sản phẩm..." aria-label="Search">
                    <button class="btn btn-outline-light" type="submit"><i class="fas fa-search"></i></button>
                </form>

                <!-- Icons -->
                <div class="icons d-flex">
                    <a href="/view/client/Cart/index.jsp"><i class="fas fa-shopping-cart"></i></a>
                    <a href="/view/client/Login/index.jsp"><i class="fas fa-user"></i></a>
                </div>
            </div>
        </div>
    </nav>
</header>
<div class="container cart-container">
    <div class="cart-header">Giỏ hàng của bạn</div>

    <!-- Cart Item 1 -->
    <div class="row cart-item align-items-center">
        <div class="col-md-2 text-center">
            <img src="https://via.placeholder.com/100" alt="Product Image">
        </div>
        <div class="col-md-4">
            <h5>Son Tint Mac sang trọng</h5>
            <p>Giá: <span class="text-danger">380,000₫</span></p>
        </div>
        <div class="col-md-3 text-center">
            <label for="quantity-1">Số lượng:</label>
            <input type="number" id="quantity-1" value="1" class="form-control d-inline-block mx-2" style="width: 60px;">
        </div>
        <div class="col-md-3 text-center">
            <button>Xóa</button>
        </div>
    </div>

    <!-- Cart Item 2 -->
    <div class="row cart-item align-items-center">
        <div class="col-md-2 text-center">
            <img src="https://via.placeholder.com/100" alt="Product Image">
        </div>
        <div class="col-md-4">
            <h5>Son bóng Hàn Quốc</h5>
            <p>Giá: <span class="text-danger">420,000₫</span></p>
        </div>
        <div class="col-md-3 text-center">
            <label for="quantity-2">Số lượng:</label>
            <input type="number" id="quantity-2" value="1" class="form-control d-inline-block mx-2" style="width: 60px;">
        </div>
        <div class="col-md-3 text-center">
            <button>Xóa</button>
        </div>
    </div>

    <!-- Cart Summary -->
    <div class="cart-summary">
        <h5>Tổng tiền: <span class="text-danger">800,000₫</span></h5>
        <button>Thanh toán</button>
    </div>
</div>



<footer>
    <div class="footer-info">
        <p>Địa chỉ: Số 2 Kiều Mai, Nam Từ Liêm, Hà Nội</p>
        <p>Điện thoại: 0867954111</p>
    </div>
    <div class="footer-icons">
        <a href="https://www.facebook.com" title="Facebook" target="_blank">
            <img src="https://cdn-icons-png.flaticon.com/512/733/733547.png" alt="Facebook" />
        </a>
        <a href="https://zalo.me" title="Zalo" target="_blank">
            <img src="https://cdn-icons-png.flaticon.com/512/3536/3536445.png" alt="Zalo" />
        </a>
        <a href="tel:0867954111" title="Gọi ngay: 0867954111">
            <img src="https://cdn-icons-png.flaticon.com/512/724/724664.png" alt="Phone" />
        </a>
    </div>
    <div class="footer-links">
        <a href="#">Điều khoản</a>
        <a href="#">Chính sách bảo mật</a>
    </div>

</footer>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

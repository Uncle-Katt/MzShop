<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>5sShop Lipstick</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #f8f9fa;
            padding: 10px 20px;
        }
        .navbar-brand img {
            height: 40px;
        }
        .navbar .nav-link {
            color: #b85555 !important;
        }
        .navbar .btn {
            background-color: #fff;
            color: #b85555;
            border: none;
        }
        .navbar .btn:hover {
            background-color: #b85555;
            color: #fff;
        }
        .banner {
            background-image: url('album/Red and White Simple Modern Lipstick Presentation (2).jpg');
            background-size: cover;
            background-position: center;
            height: 400px;
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
        }
        .banner h1 {
            font-size: 2.5rem;
            font-weight: bold;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }
        .banner button {
            background-color: #b85555;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 1.2rem;
            margin-top: 20px;
            transition: background-color 0.3s;
        }
        .banner button:hover {
            background-color: #b85555;
        }
        .marquee {
            width: 100%;
            background: #b85555;
            color: #fff;
            padding: 10px 0;
            font-size: 1.1rem;
            font-weight: bold;
            overflow: hidden;
            white-space: nowrap;
            box-sizing: border-box;
        }
        .marquee span {
            display: inline-block;
            padding-left: 100%;
            animation: marquee 10s linear infinite;
        }
        @keyframes marquee {
            from {
                transform: translateX(0);
            }
            to {
                transform: translateX(-100%);
            }
        }
        .customer-service {
            background-color: #f8f9fa;
            padding: 50px 0;
            text-align: center;
        }
        .customer-service h2 {
            font-weight: bold;
            margin-bottom: 30px;
        }
        .service-item {
            margin-bottom: 20px;
        }
        .service-item i {
            font-size: 40px;
            color: #b85555;
            margin-bottom: 15px;
        }
        .featured-products {
            padding: 50px 0;
        }
        .product-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
        }
        .product-card img {
            max-width: 100%;
            border-radius: 5px;
        }
        .product-card h5 {
            margin: 15px 0 10px;
        }
        .product-card .price {
            color: #b85555;
            font-weight: bold;
        }
        .product-card button {
            background-color: #b85555;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            transition: background-color 0.3s;
        }
        .product-card button:hover {
            background-color: #ff8574;
        }
        footer {
            background-color: #343a40;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }
        footer a {
            color: #b85555;
            text-decoration: none;
        }
        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <!-- Greeting Section -->
    <div class="marquee">
        <span>Xin chào quý khách! Chúc quý khách một ngày tốt lành</span>
    </div>

    <!-- Navbar Section -->
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="#"><img src="album/1.jpg" alt="Logo"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Sản phẩm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Giới thiệu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Tin tức</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Liên hệ</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn" type="submit"><i class="bi bi-search"></i></button>
            </form>
            <div class="ms-3">
                <button class="btn" type="submit"><i class="bi bi-cart-fill"></i></button>
                <button class="btn" type="submit"><i class="bi bi-person"></i></button>
            </div>
        </div>
    </nav>

    <!-- Banner Section -->
    <div class="banner">
        <button>Mua Ngay</button>
    </div>

    <!-- Customer Service Section -->
    <section class="customer-service">
        <div class="container">
            <h2>Dịch Vụ Khách Hàng</h2>
            <div class="row">
                <div class="col-md-3 service-item">
                    <i class="bi bi-headset"></i>
                    <h5>Chăm Sóc Khách Hàng</h5>
                    <p>Hỗ trợ khách hàng 24/7</p>
                </div>
                <div class="col-md-3 service-item">
                    <i class="bi bi-tags-fill"></i>
                    <h5>Giá Cả Hợp Lý</h5>
                    <p>Phù hợp với mọi ngân sách</p>
                </div>
                <div class="col-md-3 service-item">
                    <i class="bi bi-cart-fill"></i>
                    <h5>Đặt Hàng Trực Tuyến</h5>
                    <p>Tiện lợi, nhanh chóng</p>
                </div>
                <div class="col-md-3 service-item">
                    <i class="bi bi-credit-card-fill"></i>
                    <h5>Thanh Toán Linh Hoạt</h5>
                    <p>Online hoặc trực tiếp tại nhà</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Products Section -->
    <section class="featured-products">
        <div class="container">
            <h2 class="text-center">Sản Phẩm Nổi Bật</h2>
            <div class="row mt-4">
                <div class="col-md-3">
                    <div class="product-card">
                        <img src="album/2.jpg" alt="Product 1">
                        <h5>Son Màu Đỏ Quyến Rũ</h5>
                        <p class="price">350,000 VND</p>
                        <button><i class="bi bi-cart-fill"></i></button>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-card">
                        <img src="album/3.jpg" alt="Product 2">
                        <h5>Son Màu Hồng Nữ Tính</h5>
                        <p class="price">320,000 VND</p>
                        <button><i class="bi bi-cart-fill"></i></button>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-card">
                        <img src="album/4.jpg" alt="Product 3">
                        <h5>Son Màu Nude Sang Trọng</h5>
                        <p class="price">400,000 VND</p>
                        <button><i class="bi bi-cart-fill"></i></button>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-card">
                        <img src="album/5.jpg" alt="Product 4">
                        <h5>Son Màu Cam Cá Tính</h5>
                        <p class="price">370,000 VND</p>
                        <button><i class="bi bi-cart-fill"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; Địa chỉ: P. Trịnh Văn Bô, Nam Từ Liêm, Hà Nội</p>
        <p>Liên hệ: 0963909319</p>
    </footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


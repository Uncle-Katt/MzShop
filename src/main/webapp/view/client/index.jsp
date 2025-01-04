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

        #hero {
            background-image: url("/includes/images/banner.jpg");
            height: 85vh;
            width: 100%;
            background-size: cover;
            background-position: top 25% right 0;
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center;
        }

        /* Styling cho nút Mua Ngay */
        #hero button {
            background-color: transparent;
            color: #b85555;
            padding: 14px 80px 14px 65px;
            cursor: pointer;
            font-weight: 700;
            font-size: 15px;
            border: 2px solid transparent;
            border-radius: 30px;
            background-image: linear-gradient(white, white), linear-gradient(45deg, #b85555, #d81b60);
            background-origin: border-box;
            background-clip: padding-box, border-box;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Hiệu ứng khi di chuột vào nút */
        #hero button:hover {
            background-color: #b85555;
            color: #b85555;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
            transform: translateY(-3px);
            border: 2px solid #b85555;
            transition: all 0.3s ease;
        }

        /* Default styles cho sản phẩm */
        .product-category {
            width: 200px;
        }

        .product-item {
            background-color: #ffffff;
            border: 1px solid #b85555;
            border-radius: 20px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .product-image {
            width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        /* Căn giữa các phần tử chữ */
        .product-name, .product-description, .product-price {
            color: #b85555;
            text-align: center; /* Căn giữa chữ */
        }

        .product-rating {
            color: #f6dc4e;
            margin-top: 10px;
            text-align: center; /* Căn giữa chữ cho đánh giá */
        }

        .section-title {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 20px 0;
            position: relative;
            width: 100%; /* Chiếm hết chiều ngang */
        }

        .section-title b {
            display: block;
            height: 3px;
            background-color: #b85555;
            flex-grow: 1; /* Giúp thanh dài hết phần không gian còn lại */
        }

        .section-title h2 {
            font-size: 2rem;
            color: #b85555;
            text-align: center;
            margin: 0 20px; /* Khoảng cách giữa tiêu đề và thanh */
            white-space: nowrap; /* Đảm bảo tiêu đề trên một dòng */
        }
        /* Thiết lập chung cho .col-service */
        .col-service {
            flex: 1;
            padding: 10px;
            display: flex;
            flex-direction: column;
            align-items: center; /* Căn giữa nội dung theo chiều ngang */
            justify-content: center; /* Căn giữa nội dung theo chiều dọc */
            text-align: center;
        }

        /* Hộp dịch vụ */
        .service-box {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 10px;
        }

        .icon-box {
            font-size: 40px;
            margin-bottom: 10px;
            color: #b85555;
            width: 80px;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%; /* Bo tròn icon */
            background-color: #f2f2f2; /* Màu nền mặc định */
            transition: all 0.3s ease; /* Hiệu ứng chuyển màu mượt mà */
        }

        .icon-box:hover {
            background-color: #d81b60;
            transform: scale(1.1);
        }

        .icon-box i {
            color: #b85555;
            transition: color 0.3s ease;
        }

        .icon-box:hover i {
            color: #fff;
        }

        .service-text p {
            margin: 5px 0;
            color: #b85555;
        }

        .service-text p strong {
            font-size: 110%;
        }

        .row {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .product-actions {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }

        .btn-icon {
            background-color: #b85555;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            max-width: 150px;
        }

        .btn-icon:hover {
            background-color: #d81b60;
        }

        .product-item {
            border: 1px solid #b85555;
            border-radius: 20px;
            transition: transform 0.3s ease, border 0.3s ease;
        }

        .product-item:hover {
            transform: scale(1.05);
            border: 2px solid #d81b60;;
        }
        .row2 {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .arrow-button {
            background-color: transparent;
            border: none;
            cursor: pointer;
            font-size: 24px;
            margin: 0 10px;
            transition: color 0.3s ease;
        }

        .arrow-button:hover {
            color: #b85555; /* Màu khi hover */
        }

        /* Định dạng các cột */
        .col-lg-3.col-md-6 {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        /* Footer Styles */
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
                        <a class="nav-link active" aria-current="page" href="#">TRANG CHỦ</a>
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
<div>
    <div class="container">
        <section id="hero">
            <a href="/view/client/SanPham/sanpham.jsp">
                <button class="btn-buy">Mua Ngay</button>
            </a>
        </section>
    </div>

    <div class="container">
        <div class="section-title">
            <b></b>
            <h2>DỊCH VỤ KHÁCH HÀNG</h2>
            <b></b>
        </div>
        <div class="row">
            <div class="col-service">
                <div class="service-box">
                    <div class="icon-box">
                        <i class="fas fa-headset" aria-hidden="true"></i>
                    </div>
                    <div class="service-text">
                        <p><strong>CHĂM SÓC KHÁCH HÀNG</strong></p>
                        <p>Hỗ trợ khách hàng 24/7</p>
                    </div>
                </div>
            </div>

            <div class="col-service">
                <div class="service-box">
                    <div class="icon-box">
                        <i class="fas fa-tags" aria-hidden="true"></i> <!-- Icon giá cả hợp lý -->
                    </div>
                    <div class="service-text">
                        <p><strong>GIÁ CẢ HỢP LÝ</strong></p>
                        <p>Phù hợp với mọi ngân sách</p>
                    </div>
                </div>
            </div>

            <div class="col-service">
                <div class="service-box">
                    <div class="icon-box">
                        <i class="fas fa-shopping-cart" aria-hidden="true"></i> <!-- Icon đặt hàng trực tuyến -->
                    </div>
                    <div class="service-text">
                        <p><strong>ĐẶT HÀNG TRỰC TUYẾN</strong></p>
                        <p>Tiện lợi, nhanh chóng</p>
                    </div>
                </div>
            </div>

            <div class="col-service">
                <div class="service-box">
                    <div class="icon-box">
                        <i class="fas fa-credit-card" aria-hidden="true"></i>
                    </div>
                    <div class="service-text">
                        <p><strong>THANH TOÁN LINH HOẠT</strong></p>
                        <p>Online hoặc trực tiếp tại nhà</p>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="container">
        <div class="section-title">
            <b></b>
            <h2>SẢN PHẨM NỔI BẬT</h2>
            <b></b>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="product-item">
                    <img src="/assets/img/sp15.jpg"
                         alt="Product Item" class="product-image">
                    <h6 class="product-name">Product 1</h6>
                    <div class="product-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <p class="product-price">100.000</p>
                    <div class="product-actions">
                        <button class="btn btn-icon">
                            <i class="fas fa-shopping-cart"></i> <!-- Biểu tượng giỏ hàng -->
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="product-item">
                    <img src="/assets/img/sp2.jpg"
                         alt="Product Item" class="product-image">
                    <h6 class="product-name">Product 2</h6>
                    <div class="product-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <p class="product-price">100.000</p>
                    <div class="product-actions">
                        <button class="btn btn-icon">
                            <i class="fas fa-shopping-cart"></i> <!-- Biểu tượng giỏ hàng -->
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="product-item">
                    <img src="/assets/img/sp3.jpg"
                         alt="Product Item" class="product-image">
                    <h6 class="product-name">Product 3</h6>
                    <div class="product-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <p class="product-price">100.000</p>
                    <div class="product-actions">
                        <button class="btn btn-icon">
                            <i class="fas fa-shopping-cart"></i> <!-- Biểu tượng giỏ hàng -->
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="product-item">
                    <img src="/assets/img/sp4.jpg"
                         alt="Product Item" class="product-image">
                    <h6 class="product-name">Product 4</h6>
                    <div class="product-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <p class="product-price">100.000</p>
                    <div class="product-actions">
                        <button class="btn btn-icon">
                            <i class="fas fa-shopping-cart"></i> <!-- Biểu tượng giỏ hàng -->
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="product-item">
                    <img src="/assets/img/sp5.jpg"
                         alt="Product Item" class="product-image">
                    <h6 class="product-name">Product 5</h6>
                    <div class="product-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <p class="product-price">100.000</p>
                    <div class="product-actions">
                        <button class="btn btn-icon">
                            <i class="fas fa-shopping-cart"></i> <!-- Biểu tượng giỏ hàng -->
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="product-item">
                    <img src="/assets/img/sp6.jpg"
                         alt="Product Item" class="product-image">
                    <h6 class="product-name">Product 6</h6>
                    <div class="product-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <p class="product-price">100.000</p>
                    <div class="product-actions">
                        <button class="btn btn-icon">
                            <i class="fas fa-shopping-cart"></i> <!-- Biểu tượng giỏ hàng -->
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="product-item">
                    <img src="/assets/img/sp7.jpg"
                         alt="Product Item" class="product-image">
                    <h6 class="product-name">Product 7</h6>
                    <div class="product-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <p class="product-price">100.000</p>
                    <div class="product-actions">
                        <button class="btn btn-icon">
                            <i class="fas fa-shopping-cart"></i> <!-- Biểu tượng giỏ hàng -->
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="product-item">
                    <img src="/assets/img/sp8.jpg"
                         alt="Product Item" class="product-image">
                    <h6 class="product-name">Product 8</h6>
                    <div class="product-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <p class="product-price">100.000</p>
                    <div class="product-actions">
                        <button class="btn btn-icon">
                            <i class="fas fa-shopping-cart"></i> <!-- Biểu tượng giỏ hàng -->
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="section-title">
            <b></b>
            <h2>TIN TỨC</h2>
            <b></b>
        </div>
        <div class="row2">
            <button class="arrow-button left-arrow">
                <i class="fas fa-chevron-left"> </i>
            </button>
            <div class="col-lg-3 col-md-6">
                <div class="product-item">
                    <img src="" alt="">
                    <h6>Tiêu đề</h6>
                    <p>Nội dung</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="product-item"></div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="product-item"></div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="product-item"></div>
            </div>
            <button class="arrow-button right-arrow">
                <i class="fas fa-chevron-right"></i>
            </button>
        </div>
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

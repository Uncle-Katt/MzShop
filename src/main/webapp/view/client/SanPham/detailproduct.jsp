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
        .container.product-details {
            margin-top: 50px;
            margin-bottom: 50px;
            padding: 30px;
            background-color: #ffffff;
        }
        .container.product-details h4 {
            color: #b85555; /* Màu đỏ đặc trưng */
            font-weight: bold; /* Làm nổi bật tiêu đề */
            text-transform: uppercase; /* Viết hoa toàn bộ */
            margin-bottom: 20px; /* Khoảng cách dưới tiêu đề */
        }
        .Anh {
            padding: 20px; /* Giảm padding để border gần hơn nội dung */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #fdfdfd;
            gap: 5px; /* Giảm khoảng cách giữa các ảnh nhỏ */
        }


        .d-flex.gap-2 img {
            width: 80px;
            height: 80px;
            border: 1px solid transparent;
            border-radius: 5px;
            transition: all 0.3s ease;
            cursor: pointer;
            object-fit: cover;
        }

        .d-flex.gap-2 img:hover {
            border: 2px solid #b85555;
            transform: scale(1.05);
        }
        .product-info {
            font-size: 16px; /* Cỡ chữ chuẩn */
            color: #333; /* Màu chữ */
        }

        .product-title {
            font-weight: bold;
            margin-bottom: 15px;
        }

        .product-status label {
            font-weight: bold;
            color: #b85555;
        }

        .product-status .badge {
            font-size: 14px;
        }

        .product-price span {
            font-size: 24px;
            font-weight: bold;
        }

        .product-details p {
            margin: 5px 0;
            color: #555;
        }

        .product-details strong {
            color: #b85555; /* Màu chính cho nhãn */
        }

        .product-options label {
            font-weight: bold;
            color: #b85555; /* Màu chính */
            margin-bottom: 10px;
            display: inline-block;
        }

        .product-options .btn-group .btn {
            margin-right: 5px; /* Khoảng cách giữa các nút */
            border: 1px solid #b85555;
            font-weight: bold;
            transition: all 0.3s ease;
            border-radius: 0; /* Không bo tròn viền */

        }

        .product-options .btn-group .btn:hover {
            background-color: #b85555;
            color: white;
            border-color: #b85555;
        }

        .quantity-control {
            margin-top: 10px;
            margin-bottom: 20px; /* Khoảng cách giữa các mục */
        }

        .quantity-control input {
            border: 1px solid #b85555;
            border-radius: 5px;
            text-align: center;
            font-size: 14px;
        }

        .product-actions {
            margin-top: 20px;
        }

        .product-actions .btn {
            background-color: #b85555;
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .product-actions .btn:hover {
            background-color: #d81b60;
        }

        hr {
            border: none;
            border-top: 2px solid #b85555; /* Đường kẻ dùng màu #b85555 */
            margin: 15px 0;
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
<div class="container product-details">
    <h4>Chi tiết sản phẩm</h4>
    <hr class="my-4" style="border-top: 1px solid #b85555;">

    <div class="row">
        <!-- Hình ảnh sản phẩm -->
        <div class="Anh col-md-6">
            <img src="https://via.placeholder.com/400" alt="Sản phẩm chính" class="img-fluid mb-3">
            <div class="d-flex gap-2">
                <img src="/includes/images/3.jpg" alt="Ảnh nhỏ 1" class="img-thumbnail">
                <img src="/includes/images/4.jpg" alt="Ảnh nhỏ 2" class="img-thumbnail">
            </div>
        </div>

        <!-- Thông tin sản phẩm -->
        <div class="col-md-6 product-info">
            <h2 class="product-title">Son Tint Mac sang trọng</h2>
            <div class="product-status">
                <label>Trạng thái: </label>
                <span class="badge bg-danger">Còn hàng</span>
            </div>
            <div class="product-price">
                <span>380,000₫</span>
            </div>
            <hr>
            <div class="product-details">
                <p><strong>Thương Hiệu:</strong> Đang cập nhật</p>
                <p><strong>Xuất xứ:</strong> Đang cập nhật</p>
            </div>
            <hr>
            <div class="product-options">
                <div class="mb-3">
                    <label><strong>Màu sắc:</strong></label>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-outline-secondary">Đỏ nâu</button>
                        <button type="button" class="btn btn-outline-secondary">Đỏ đất</button>
                    </div>
                </div>
                <div class="mb-3">
                    <label><strong>Kích thước:</strong></label>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-outline-secondary">37</button>
                        <button type="button" class="btn btn-outline-secondary">38</button>
                        <button type="button" class="btn btn-outline-secondary">39</button>
                    </div>
                </div>
                <div class="quantity-control mb-3 d-flex align-items-center">
                    <label class="me-3"><strong>Số lượng:</strong></label>
                    <input type="number" value="1" class="form-control text-center" style="max-width: 70px;">
                </div>

            </div>
            <div class="product-actions">
                <button class="btn btn-danger me-2">Thêm vào giỏ hàng</button>
                <button class="btn btn-danger me-2">Mua Ngay</button>

            </div>
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

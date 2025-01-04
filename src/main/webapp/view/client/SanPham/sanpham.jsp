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

        .left-column {
            padding: 20px;
            border-right: 2px solid #b85555;
            height: 100%; /* Đảm bảo chiếm hết chiều cao */
        }

        .left-column .section-title {
            color: #b85555;
            border-bottom: 1px solid #b85555;
            padding-bottom: 5px;
            margin-bottom: 15px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .left-column .top-section,
        .left-column .middle-section {
            padding: 15px;
            margin-bottom: 20px;
        }

        .left-column .bottom-section {
            margin-top: 20px;
        }

        .left-column .slider-input input[type="text"] {
            width: 40%; /* Adjust width for price range inputs */
            text-align: center; /* Center align text inside input */
            margin: 5px 10px; /* Add spacing around inputs */
        }



        .right-column {
            background-color: #ffffff;
            padding: 20px;
            width: 65%;
        }
        .right-column h4 {
            color: #b85555;
            font-weight: bold;
            text-transform: uppercase;
        }

        .right-column hr {
            border: 1px solid #b85555;
            margin-top: 10px;
            margin-bottom: 20px; /* Add spacing below */
            width: 100%; /* Ensure the HR spans the full width */
        }


        .container .row {
            margin-top: 20px;
        }

        .product-item {
            background-color: #fff;
            border: 1px solid #b85555 !important; /* Force red border */
            border-radius: 10px;
            padding: 15px;
            transition: all 0.3s ease;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .product-item:hover {
            transform: translateY(-5px);
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
            border: 2px solid #d81b60; /* Darker red border on hover */
        }

        .product-item img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 10px;
            object-fit: cover;
        }

        .product-item h6 {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .product-item p {
            font-size: 18px;
            font-weight: bold;
            color: #b85555;
            margin-bottom: 10px;
        }

        .product-item .btn {
            background-color: #b85555;
            color: #fff;
            border-radius: 5px;
            font-size: 14px;
            padding: 8px 12px;
            transition: all 0.3s ease;
        }

        .product-item .btn:hover {
            background-color: #d81b60;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
        }

        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-color: #b85555;
            border-radius: 50%;
            padding: 10px;
        }

        .carousel-control-prev-icon:hover,
        .carousel-control-next-icon:hover {
            background-color: #d81b60;
        }


        /* Title styling */
        .middle-section .section-title {
            color: #b85555;
            font-weight: bold;
            text-transform: uppercase;
            border-bottom: 1px solid #b85555;
            padding-bottom: 5px;
            margin-bottom: 20px;
        }

        /* Range slider styling */
        .middle-section .form-range {
            accent-color: #b85555; /* Theme color for slider */
            height: 8px;
            background: linear-gradient(to right, #b85555 0%, #b85555 50%, #e0e0e0 50%);
            border-radius: 5px;
            transition: background 0.3s ease-in-out;
        }

        .middle-section .form-range::-webkit-slider-thumb {
            background-color: #b85555;
            width: 16px;
            height: 16px;
            border-radius: 50%;
            border: 2px solid white;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .middle-section .form-range::-webkit-slider-thumb:hover {
            transform: scale(1.2);
        }

        .middle-section .form-range:focus {
            outline: none;
        }

        /* Input styling */
        .middle-section .slider-input {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 15px;
        }

        .middle-section .slider-input input[type="text"] {
            width: 100px;
            padding: 5px 10px;
            font-weight: bold;
            font-size: 14px;
            color: #b85555;
            text-align: center;
            border: 1px solid #b85555;
            border-radius: 5px;
            background-color: #fff;
            transition: box-shadow 0.3s ease;
        }

        .middle-section .slider-input input[type="text"]:focus {
            outline: none;
            box-shadow: 0px 4px 8px rgba(184, 85, 85, 0.2);
        }

        .middle-section .slider-input span {
            font-size: 18px;
            font-weight: bold;
            color: #b85555;
            margin: 0 10px;
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
<div class="container my-5">
    <div class="row">
        <div class="col-md-4 left-column">
            <div class="top-section">
                <h5 class="section-title mb-4">DANH MỤC</h5>
                <ul class="list-unstyled">
                    <li>
                        <input type="radio" name="category" id="category1" checked>
                        <label for="category1" class="ms-2">Son lì</label>
                    </li>
                    <li>
                        <input type="radio" name="category" id="category2">
                        <label for="category2" class="ms-2"></label>
                    </li>
                    <li>
                        <input type="radio" name="category" id="category3">
                        <label for="category3" class="ms-2"></label>
                    </li>
                </ul>
            </div>
            <div class="middle-section">
                <h5 class="section-title mt-4">GIÁ SẢN PHẨM</h5>
                <input type="range" class="form-range" min="0" max="1000000" step="1000" id="priceRange">
                <div class="slider-input">
                    <input type="text" value="100.000₫" id="minPrice">
                    <span>-</span>
                    <input type="text" value="1,000,000₫" id="maxPrice">
                </div>
            </div>
            <div class="bottom-section">
                <h5 class="section-title">ĐỊA CHỈ</h5>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.699004540093!2d105.74995997495157!3d21.044726287230574!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345500459db50f%3A0x2af0a296afa85ba2!2zcDIga2nhu4F1IG1haQ!5e0!3m2!1svi!2s!4v1735914968132!5m2!1svi!2s"
                        width="385" height="550" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>


        <div class="col-md-6 right-column">
            <h4>Sản phẩm</h4>
            <hr>

            <div class="container">
                <div class="row">
                    <div class="col-3 mb-4">
                        <div class="product-item text-center p-3 border rounded">
                            <img src="https://via.placeholder.com/150" alt="Sản phẩm 1" class="img-fluid mb-2">
                            <h6 class="text-truncate">Sản phẩm 1</h6>
                            <p class="text-danger fw-bold">425,000₫</p>
                            <button class="btn btn-sm btn-primary">Thêm vào giỏ</button>
                        </div>
                    </div>
                    <div class="col-3 mb-4">
                        <div class="product-item text-center p-3 border rounded">
                            <img src="https://via.placeholder.com/150" alt="Sản phẩm 2" class="img-fluid mb-2">
                            <h6 class="text-truncate">Sản phẩm 2</h6>
                            <p class="text-danger fw-bold">380,000₫</p>
                            <button class="btn btn-sm btn-primary">Thêm vào giỏ</button>
                        </div>
                    </div>
                    <div class="col-3 mb-4">
                        <div class="product-item text-center p-3 border rounded">
                            <img src="https://via.placeholder.com/150" alt="Sản phẩm 1" class="img-fluid mb-2">
                            <h6 class="text-truncate">Sản phẩm 1</h6>
                            <p class="text-danger fw-bold">425,000₫</p>
                            <button class="btn btn-sm btn-primary">Thêm vào giỏ</button>
                        </div>
                    </div>
                    <div class="col-3 mb-4">
                        <div class="product-item text-center p-3 border rounded">
                            <img src="https://via.placeholder.com/150" alt="Sản phẩm 2" class="img-fluid mb-2">
                            <h6 class="text-truncate">Sản phẩm 2</h6>
                            <p class="text-danger fw-bold">380,000₫</p>
                            <button class="btn btn-sm btn-primary">Thêm vào giỏ</button>
                        </div>
                    </div>
                    <div class="col-3 mb-4">
                        <div class="product-item text-center p-3 border rounded">
                            <img src="https://via.placeholder.com/150" alt="Sản phẩm 1" class="img-fluid mb-2">
                            <h6 class="text-truncate">Sản phẩm 1</h6>
                            <p class="text-danger fw-bold">425,000₫</p>
                            <button class="btn btn-sm btn-primary">Thêm vào giỏ</button>
                        </div>
                    </div>
                    <div class="col-3 mb-4">
                        <div class="product-item text-center p-3 border rounded">
                            <img src="https://via.placeholder.com/150" alt="Sản phẩm 2" class="img-fluid mb-2">
                            <h6 class="text-truncate">Sản phẩm 2</h6>
                            <p class="text-danger fw-bold">380,000₫</p>
                            <button class="btn btn-sm btn-primary">Thêm vào giỏ</button>
                        </div>
                    </div>
                    <div class="col-3 mb-4">
                        <div class="product-item text-center p-3 border rounded">
                            <img src="https://via.placeholder.com/150" alt="Sản phẩm 1" class="img-fluid mb-2">
                            <h6 class="text-truncate">Sản phẩm 1</h6>
                            <p class="text-danger fw-bold">425,000₫</p>
                            <button class="btn btn-sm btn-primary">Thêm vào giỏ</button>
                        </div>
                    </div>
                    <div class="col-3 mb-4">
                        <div class="product-item text-center p-3 border rounded">
                            <img src="https://via.placeholder.com/150" alt="Sản phẩm 2" class="img-fluid mb-2">
                            <h6 class="text-truncate">Sản phẩm 2</h6>
                            <p class="text-danger fw-bold">380,000₫</p>
                            <button class="btn btn-sm btn-primary">Thêm vào giỏ</button>
                        </div>
                    </div>
                    <div class="col-3 mb-4">
                        <div class="product-item text-center p-3 border rounded">
                            <img src="https://via.placeholder.com/150" alt="Sản phẩm 1" class="img-fluid mb-2">
                            <h6 class="text-truncate">Sản phẩm 1</h6>
                            <p class="text-danger fw-bold">425,000₫</p>
                            <button class="btn btn-sm btn-primary">Thêm vào giỏ</button>
                        </div>
                    </div>
                    <div class="col-3 mb-4">
                        <div class="product-item text-center p-3 border rounded">
                            <img src="https://via.placeholder.com/150" alt="Sản phẩm 2" class="img-fluid mb-2">
                            <h6 class="text-truncate">Sản phẩm 2</h6>
                            <p class="text-danger fw-bold">380,000₫</p>
                            <button class="btn btn-sm btn-primary">Thêm vào giỏ</button>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-center mt-4">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
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

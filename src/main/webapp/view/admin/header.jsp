<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
        }
        body {
            color: black;
            font-family: 'Roboto', sans-serif;
        }
        .sidebar {
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 20%;
            max-width: 300px;
            z-index: 1000;
            background-color: #b85555;
            padding: 20px;
        }
        .text-center,
        .content {
            margin-left: 20%;
            padding: 10px;
            border-radius: 5px;
            color: black;
            background-color: white;
            max-width: 80%;
        }
        h2 {
            color: black;
        }
        .nav-item {
            margin: 9px 0;
        }
        .nav-link {
            transition: color 0.3s;
        }
        .nav-link:hover {
            color: #d81b60;
            opacity: 0.8;
        }
        .logo {
            text-align: center;
            margin: 20px 0;
        }
        .logo img {
            width: 105px;
            height: 80px;
            margin: 14px auto;
            display: block;
            object-fit: contain;
        }
        #productManagement .nav-item {
            margin: 0;
        }
        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.7);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }

        .loader {
            border: 8px solid #f3f3f3;
            border-radius: 50%;
            border-top: 8px solid #3498db;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        .bill-tab{
            border-top: 1px solid #b85555;
            border-left: 1px solid #b85555;
            border-right: 1px solid #b85555;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;

        }
        .actice-bill-tab{
          background: #a84343;
        }
        .actice-bill-tab strong{
            color: #e6e6e6;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 d-none d-md-block sidebar">
            <div class="sidebar-sticky">
                <div class="logo">
                    <img src="/img/Logo.jpg" alt="Logo" class="img-fluid" />
                </div>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active text-white h5" href="/san-pham/index" aria-label="Thống kê">
                            Thống kê
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white h5" href="/admin/sales" aria-label="Bán hàng tại quầy">
                            Bán hàng tại quầy
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white h5" href="/san-pham/index" aria-label="Quản lý đơn hàng">
                            Quản lý đơn hàng
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white h5" data-toggle="collapse" href="#productManagement" role="button"
                           aria-expanded="false" aria-controls="productManagement">
                            Quản lý sản phẩm <i class="fas fa-chevron-down"></i>
                        </a>
                        <div class="collapse" id="productManagement">
                            <ul class="nav flex-column ml-3">
                                <li class="nav-item">
                                    <a class="nav-link text-white h5" href="/san-pham/index" aria-label="Sản phẩm">Sản phẩm</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white h5" href="/khoi-luong/index" aria-label="Khối lượng">Khối lượng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white h5" href="/mui-huong/index" aria-label="Mùi Hương">Mùi Hương</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white h5" href="/mau-sac/index" aria-label="Màu Sắc">Màu Sắc</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white h5" href="/xuat-xu/index" aria-label="Xuất Xứ">Xuất Xứ</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white h5" href="/thuong-hieu/index" aria-label="Thương Hiệu">Thương Hiệu</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white h5" href="/danh-muc/index" aria-label="Danh Mục">Danh Mục</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white h5" href="/admin/customer" aria-label="Khach Hang">
                            Khách hàng
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white h5" href="/phieu-giam-gia/list" aria-label="Giảm giá">
                            Giảm giá
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white h5" href="/san-pham/index" aria-label="Tài khoản">
                            Tài khoản
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>F Shoes Management</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <h4 class="text-center">Son 5S</h4>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            Thống kê
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Bán hàng tại quầy
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Quản lý đơn hàng
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#productManagement" role="button"
                           aria-expanded="false" aria-controls="productManagement">
                            Quản lý sản phẩm <i class="fas fa-chevron-down"></i>
                        </a>
                        <div class="collapse" id="productManagement">
                            <ul class="nav flex-column ml-3">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Sản phẩm</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Khối lượng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Mùi Hương</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Màu Sắc</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Xuất Xứ</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Thương Hiệu</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Danh Mục</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Trả hàng
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Giảm giá
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Tài khoản
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

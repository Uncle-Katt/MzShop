<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container mt-4">
    <h2 class="mb-4">Thống Kê</h2>

    <!-- Thống kê tổng quan -->
    <div class="row">
        <!-- Tổng doanh thu -->
        <div class="col-md-3">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h5 class="card-title">Tổng Doanh Thu</h5>
                    <h4 class="text-success" id="totalRevenue">0 VNĐ</h4>
                </div>
            </div>
        </div>
        <!-- Tổng số lượng bán -->
        <div class="col-md-3">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h5 class="card-title">Tổng Số Lượng Bán</h5>
                    <h4 class="text-primary" id="totalSales">0</h4>
                </div>
            </div>
        </div>
        <!-- Sản phẩm bán chạy -->
        <div class="col-md-3">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h5 class="card-title">Sản Phẩm Bán Chạy</h5>
                    <h4 class="text-danger" id="bestSeller">Chưa có dữ liệu</h4>
                </div>
            </div>
        </div>
        <!-- Số lượng tồn kho -->
        <div class="col-md-3">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h5 class="card-title">Số Lượng Tồn Kho</h5>
                    <h4 class="text-warning" id="stockRemaining">0</h4>
                </div>
            </div>
        </div>
    </div>

    <!-- Biểu đồ thống kê -->
    <div class="row">
        <!-- Biểu đồ doanh thu -->
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">Biểu Đồ Doanh Thu</h5>
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>
        </div>
        <!-- Biểu đồ số lượng bán -->
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">Biểu Đồ Số Lượng Bán</h5>
                    <canvas id="salesChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Thống kê theo thời gian -->
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">Thống Kê Theo Tháng</h5>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Tháng</th>
                            <th>Doanh Thu</th>
                            <th>Số Lượng Bán</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Custom Styles -->
<style>
    .card-title {
        font-size: 18px;
        font-weight: bold;
    }
    #revenueChart, #salesChart {
        height: 300px;  /* Hoặc chiều cao bạn muốn */
        width: 100%;    /* Đảm bảo biểu đồ chiếm toàn bộ chiều rộng */
    }
    .card-body {
        padding: 20px;
        height: 350px;  /* Đảm bảo chiều cao của phần tử chứa */
    }
    .card-body {
        display: flex;  /* Sử dụng flexbox */
        flex-direction: column;  /* Đặt hướng của các phần tử là theo cột */
        justify-content: center;  /* Căn giữa theo chiều dọc */
        align-items: center;  /* Căn giữa theo chiều ngang */
        padding: 10px;  /* Giảm bớt khoảng cách bên trong ô */
    }

    .card-title {
        font-size: 16px;  /* Giảm kích thước font của tiêu đề */
    }

    .card-body h4 {
        font-size: 18px;  /* Giảm kích thước font của nội dung */
    }




    .table th, .table td {
        text-align: center;
        vertical-align: middle;
    }

</style>

<!-- Biểu đồ sử dụng Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    $(document).ready(function () {
        // Biểu đồ doanh thu
        const ctxRevenue = document.getElementById('revenueChart').getContext('2d');
        const revenueChart = new Chart(ctxRevenue, {
            type: 'line', // Loại biểu đồ
            data: {
                labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5'],
                datasets: [{
                    label: 'Doanh Thu (VNĐ)',
                    data: [0, 0, 0, 0, 0],  // Chưa có dữ liệu
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 2,
                    fill: false
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });

        // Biểu đồ số lượng bán
        const ctxSales = document.getElementById('salesChart').getContext('2d');
        const salesChart = new Chart(ctxSales, {
            type: 'bar', // Loại biểu đồ
            data: {
                labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5'],
                datasets: [{
                    label: 'Số Lượng Bán',
                    data: [0, 0, 0, 0, 0],  // Chưa có dữ liệu
                    backgroundColor: 'rgba(255, 159, 64, 0.2)',
                    borderColor: 'rgba(255, 159, 64, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });

        // Dữ liệu thống kê
        $('#totalRevenue').text('0 VNĐ');
        $('#totalSales').text('0');
        $('#bestSeller').text('Chưa có dữ liệu');
        $('#stockRemaining').text('0');
    });
</script>

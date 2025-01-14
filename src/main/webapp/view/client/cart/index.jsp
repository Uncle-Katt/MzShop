<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
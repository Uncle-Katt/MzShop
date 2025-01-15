<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


<script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    function formatCurrency(value) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(value);
    }
    function formatDate(isoString) {
        const date = new Date(isoString);
        const day = String(date.getUTCDate()).padStart(2, '0'); // Lấy ngày (2 chữ số)
        const month = String(date.getUTCMonth() + 1).padStart(2, '0'); // Lấy tháng (2 chữ số, cộng thêm 1 vì tháng bắt đầu từ 0)
        const year = date.getUTCFullYear(); // Lấy năm
        return day + "-" + month + "-" + year;
    }
    const convertTypeInvoiceStatus = (type) =>
    {
        switch (type) {
            case "CHO_XAC_NHAN":
                return "Chờ Xác Nhận";
            case "DA_XAC_NHAN":
                return "Đã Xác Nhận";
            case "CHO_GIA0":
                return "Chờ Giao";
            case "DANG_GIAO":
                return "Đang Giao";
            case "HOAN_THANH":
                return "Hoàn Thành";
            case "CHO_THANH_TOAN":
                return "Chờ Thanh Toán";
            case "HUY":
                return "Hủy";
            case "TAO_DON_HANG":
                return "Tạo Đơn Hàng";
            case "DA_THANH_TOAN":
                return "Đã Thanh Toán";
            default:
                return "Không Xác Định";
        }
    }
    const convertPaymentMethod = (type) =>
    {
        switch (type) {
            case "TIEN_MAT":
                return "Tiền Mặt";
            case "CHUYEN_KHOAN":
                return "Chuyển Khoản";
            default:
                return "Không Xác Định";
        }
    }

    const convertStatusProduct = (type) =>
    {
        switch (type) {
            case "HOAT_DONG":
                return "Đang bán";
            case "NGUNG_HOAT_DONG":
                return "Ngừng bán";
            default:
                return "Không Xác Định";
        }
    }

    // Lưu dữ liệu vào localStorage
    const setProductToCart = (data) => {
        localStorage.setItem('cart', JSON.stringify(data)); // Lưu mảng hoặc đối tượng
    };
    // Hàm lấy dữ liệu từ localStorage
    const getProductFromCart = () => {
        let data = localStorage.getItem('cart'); // Lấy dữ liệu từ localStorage
        if (data) {
            // Nếu có dữ liệu, chuyển đổi từ chuỗi JSON thành đối tượng
            return JSON.parse(data);
        } else {
            // Nếu không có dữ liệu, trả về mảng rỗng
            return [];
        }
    }

</script>
</body>
</html>
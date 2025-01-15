<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container cart-container">
    <div class="cart-header mt-4 mb-2">
        <h5>Giỏ hàng của bạn</h5>
    </div>

    <!-- Cart -->
    <div class="my-4" id="cart-items-container">

    </div>

    <!-- Cart Summary -->
    <div class="cart-summary my-4" style="display: flex; justify-content: flex-end; align-items: flex-end">
        <h5>Tổng tiền: <span class="text-danger" id="total-amount"></span></h5>
        <button class="btn btn-primary ml-4" id="check-out">Thanh toán</button>
    </div>
</div>

<script>

    $(document).ready(function () {
        loadDataCart()
        function loadDataCart(){
            let lstProduct = getProductFromCart();
            $('#cart-items-container').empty()
            lstProduct.forEach(item=> {
                let totalMoney = Number(item.giaBan) * Number(item.soLuongMua)
                let productHtml =
                        '<div class="row cart-item align-items-center" style="border-bottom: 1px solid #ccc; padding: 10px">'+
                            '<div class="col-md-1 text-center">'+
                                '<img style="width: 100px; height: 100px; object-fit: cover" src="'+item.urlAnh+'" alt="Image"/>'+
                            '</div>'+
                            '<div class="col-md-4">'+
                                '<div class="d-flex">'+
                                    '<h5>'+item.tenSanPham+'</h5>'+
                                    '<span class="ml-2">('+item.mauSac.tenMauSac+' - '+ item.khoiLuong.tenKhoiLuong+')</span>'+
                                '</div>'+
                                '<p>Đơn Giá: <span class="text-danger">'+formatCurrency(item.giaBan)+'</span></p>'+
                            '</div>'+
                            '<div class="col-md-2 text-center">'+
                                '<input type="number" min="1" max="'+item.soLuong+'" data-id="'+item.id+'" id="quantity-'+item.id+'" value="'+item.soLuongMua+'" class="form-control d-inline-block mx-2 input_quantity_cart" style="width: 120px;" />'+
                            '</div>'+
                            '<div class="col-md-2 text-center">'+
                                '<span class="text-danger">'+formatCurrency(totalMoney)+'</span>'+
                            '</div>'+
                            '<div class="col-md-2 text-center">'+
                                '<button class="btn btn-danger remove-item-cart" data-id="'+item.id+'">Xóa</button>'+
                            '</div>'+
                        '</div>'
                $('#cart-items-container').append(productHtml); // Gắn HTML vào phần tử container
            })
            let totalAmount = lstProduct.reduce((total, item) => {
                let totalMoney = Number(item.giaBan) * Number(item.soLuongMua);
                return total + totalMoney;
            }, 0);

            // Hiển thị tổng tiền trong giỏ hàng
            let totalAmountFormatted = formatCurrency(totalAmount); // Giả sử bạn có hàm formatCurrency để định dạng tiền tệ
            $('#total-amount').text(totalAmountFormatted);

        }


        $('#cart-items-container').on('change', '.input_quantity_cart', function () {
            // Lấy ID của sản phẩm từ thuộc tính data-id
            var productId = $(this).data('id'); // Lấy id sản phẩm từ data-id
            var quantity = parseInt($(this).val()); // Lấy giá trị số lượng người dùng nhập

            // Kiểm tra xem số lượng có hợp lệ không
            var maxQuantity = parseInt($(this).attr('max')); // Lấy số lượng tối đa từ thuộc tính max
            if (isNaN(quantity) ||quantity < 1) {
                $(this).val(1);
                quantity = 1;
            } else if (quantity > maxQuantity) {
                $(this).val(maxQuantity);
                quantity = maxQuantity;
            }
            let lstProduct = getProductFromCart();
            // Tìm sản phẩm trong lstProduct và cập nhật số lượng
            let product = lstProduct.find(p => p.id === productId);
            console.log(product)
            if (product) {
                product.soLuongMua = quantity; // Cập nhật lại số lượng sản phẩm trong lstProduct
            }
            let dataCart = [...lstProduct];  // Sao chép lại lstProduct
            console.log('Cập nhật giỏ hàng:', dataCart);
            setProductToCart(dataCart);
            loadDataCart()
        });

        $('#cart-items-container').on('click', '.remove-item-cart', function () {
            // Lấy ID của sản phẩm từ thuộc tính data-id
            var productId = $(this).data('id'); // Lấy id sản phẩm từ data-id
            console.log(productId)
            let lstProduct = getProductFromCart();

            // Lọc ra các sản phẩm không có ID trùng với sản phẩm cần xóa
            lstProduct = lstProduct.filter(product => product.id !== productId);

            // Cập nhật lại giỏ hàng (giả sử có hàm setProductToCart)
            setProductToCart(lstProduct);

            // Tải lại giỏ hàng (giả sử có hàm loadDataCart)
            loadDataCart();
        });
        $('#check-out').on('click',function () {
            let lstProduct = getProductFromCart();
            if (lstProduct.length == 0){
                toast.error("Không có gì để thanh toán")
            }else {
                window.location.href = '/check-out';
            }
        })

    });


</script>



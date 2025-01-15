<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container product-details">

    <div class="row mt-4">
        <!-- Hình ảnh sản phẩm -->
        <div class="Anh col-md-6">
            <img id="urlAnh" src="/includes/images/3.jpg" alt="img" class="img-fluid mb-3">
        </div>

        <!-- Thông tin sản phẩm -->
        <div class="col-md-6 product-info" style="padding-left: 20px; padding-bottom: 80px">
            <h2 class="product-title" id="tenSanPham"></h2>
            <div class="product-status">
                <span>Số Lượng: </span>
                <span class="badge bg-danger" id="soLuong">0</span>
            </div>
            <div class="product-price mt-2">
                <span id="giaSanPham"></span>
            </div>
            <hr>
            <div class="product-details">
                <div class="d-flex">
                    <strong class="mr-2">Thương Hiệu: </strong>
                    <p id="thuongHieu"></p>
                </div>
                <div class="d-flex">
                    <strong class="mr-2">Xuất xứ: </strong>
                    <p id="xuatXu"></p>
                </div>
            </div>
            <hr>
            <div class="product-options">
                <div class="mb-3">
                    <label><strong>Màu sắc:</strong></label>
                    <div id="color-container"></div>
                </div>
                <div class="mb-3">
                    <label><strong>Khối lượng:</strong></label>
                    <div id="weight-container"></div>
                </div>
                <div class="quantity-control mb-3 d-flex align-items-center">
                    <label class="me-3"><strong>Số lượng:</strong></label>
                    <input id="inputSoLuong" min="0" type="number" value="1" class="form-control text-center" style="width: 100px;">
                </div>

            </div>
            <div class="product-actions">
                <button class="btn btn-danger me-2" id="addToCart">Thêm vào giỏ hàng</button>
                <button class="btn btn-danger me-2" id="buyToCart">Mua Ngay</button>
            </div>
        </div>

    </div>
</div>

<script>

    $(document).ready(function () {
        let productId = "${id}"
        let product;
        let productItemResult = null;
        let lstProductDetail;
        let selectedColor;
        let selectedWeight;

        function getDataProduct(){
            $.ajax({
                url: `/product/detail`,
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(productId),
                success: function (rep) {
                    product = rep.data
                    lstProductDetail = rep.data.lstChiTietSanPham
                    fillDataProduct(rep.data)
                },
                error: function () {

                },
            });
        }
        getDataProduct()

        function fillDataProduct(data){
            $('#urlAnh').attr('src', data.urlAnh);
            $('#tenSanPham').text(data.tenSanPham)
            let sumQuantity = lstProductDetail.reduce((sum, product) => sum + product.soLuong, 0);
            $('#soLuong').text(sumQuantity > 0 ? sumQuantity + "" : "Hết Hàng")
            let prices = lstProductDetail.map(product => product.giaBan);
            let minPrice = Math.min(...prices);
            let maxPrice = Math.max(...prices);
            $('#giaSanPham').text(formatCurrency(minPrice) + ' - ' + formatCurrency(maxPrice))
            $('#thuongHieu').text(data.thuongHieu.tenThuongHieu)
            $('#xuatXu').text(data.xuatXu.tenXuatXu)
            loadCheckBoxItemProdcut()
        }
        function loadCheckBoxItemProdcut(){
            let uniqueColors = lstProductDetail
                .map(product => product.mauSac)  // Lấy ra đối tượng màu sắc từ mỗi sản phẩm
                .filter((value, index, self) =>  // Lọc ra các màu sắc không trùng
                    self.findIndex(t => t.id === value.id) === index  // Kiểm tra theo ID để đảm bảo màu sắc không trùng
                );

            let uniqueWeights = lstProductDetail
                .map(product => product.khoiLuong)  // Lấy ra đối tượng màu sắc từ mỗi sản phẩm
                .filter((value, index, self) =>  // Lọc ra các Weights không trùng
                    self.findIndex(t => t.id === value.id) === index  // Kiểm tra theo ID để đảm bảo Weights không trùng
                );
            console.log(uniqueColors)
            console.log(uniqueWeights)

            displayColors(uniqueColors)
            displayWeights(uniqueWeights)
        }

        function displayColors(colors) {
            var container = $('#color-container');
            container.empty(); // Xóa nội dung cũ (nếu có)
            colors.sort((a, b) => a.id - b.id); // Sắp xếp tăng dần theo id
            $.each(colors, function (index, color) {
                var checkedAttr = (color.id == selectedColor) ? 'checked' : ''; // Kiểm tra nếu value bằng 1 thì thêm thuộc tính checked
                var colorInput =
                    '<input type="radio" class="btn-check" name="color" value="'+color.id+'" id="color-'+color.id+'" autocomplete="off" '+checkedAttr+'>'+
                    '<label class="btn  btn-outline-primary ml-2" for="color-'+color.id+'">'+
                    color.tenMauSac+
                    '</label>'
                container.append(colorInput);
            });
        }
        // Hàm hiển thị khối lượng trên giao diện
        function displayWeights(weights) {
            console.log(weights)
            console.log("weights")
            var container = $('#weight-container');
            container.empty();
            weights.sort((a, b) => a.id - b.id); // Sắp xếp tăng dần theo id
            $.each(weights, function (index, weight) {
                var checkedAttr = (weight.id == selectedWeight) ? 'checked' : ''; // Kiểm tra nếu value bằng 1 thì thêm thuộc tính checked
                var weightInput =
                    '<input type="radio" class="btn-check" name="weight" value="'+weight.id+'" id="weight-'+weight.id+'" autocomplete="off" '+checkedAttr+'>'+
                    '<label class="btn  btn-outline-primary ml-2" for="weight-'+weight.id+'">'+
                    weight.tenKhoiLuong+
                    '</label>'
                container.append(weightInput);
            });
        }

        // Lắng nghe sự kiện thay đổi lựa chọn khối lượng
        $(document).on('change', 'input[name="weight"]', function () {
            $('input[name="weight"]').not(this).prop('checked', false); // Bỏ chọn tất cả checkbox khác

            // var selectedWeight = $('input[name="weight"]:checked').next('label').text();
            selectedWeight = $('input[name="weight"]:checked').val(); // Lấy giá trị của checkjbox button được chọn
            console.log(selectedWeight)

            // $('#selected-weight').text(selectedWeight);  // Hiển thị trọng lượng đã chọn
            let filteredProductDetails = lstProductDetail.filter(item => item.khoiLuong.id == selectedWeight);
            console.log(filteredProductDetails)
            let uniqueColors = filteredProductDetails.map(product => product.mauSac)  // Lấy ra đối tượng màu sắc từ mỗi sản phẩm
                .filter((value, index, self) =>  // Lọc ra các màu sắc không trùng
                    self.findIndex(t => t.id === value.id) === index  // Kiểm tra theo ID để đảm bảo màu sắc không trùng
                );
            displayColors(uniqueColors)
            fillDataProductItem()
        });
        // Lắng nghe sự kiện thay đổi lựa chọn mau sac
        $(document).on('change', 'input[name="color"]', function () {
            $('input[name="color"]').not(this).prop('checked', false); // Bỏ chọn tất cả checkbox khác

            selectedColor = $('input[name="color"]:checked').val(); // Lấy giá trị của checkjbox button được chọn
            //bỏ chọn item load lại item
            console.log(selectedColor)
            console.log("===========")

            // var selectedColor = $('input[name="color"]:checked').next('label').text();
            let filteredProductDetails = lstProductDetail.filter(item => item.mauSac.id == selectedColor);
            console.log(filteredProductDetails)
            let uniqueWeights = filteredProductDetails.map(product => product.khoiLuong)  // Lấy ra đối tượng màu sắc từ mỗi sản phẩm

            console.log(uniqueWeights)
            displayWeights(uniqueWeights)
            fillDataProductItem()
        });


        function fillDataProductItem(){

            productItemResult = lstProductDetail.find(product =>
                product.mauSac.id == selectedColor && product.khoiLuong.id == selectedWeight
            );
            console.log(productItemResult)
            if (productItemResult){
                $('#giaSanPham').text(formatCurrency(productItemResult.giaBan))
                $('#soLuong').text(productItemResult.soLuong > 0 ? productItemResult.soLuong + "" : "Hết Hàng")
                $('#inputSoLuong').attr('max', productItemResult.soLuong);
                if (productItemResult.soLuong == 0){
                    $('#inputSoLuong').val(0)
                }else {
                    $('#inputSoLuong').val(1)
                }
            }
        }

        $('#addToCart').click(function () {
            let check = addProductToCart();
            if (check != 1){
                toastr.success("Thêm sản phẩm thành công")
            }

        });
        $('#buyToCart').click(function () {
            let check =  addProductToCart();
            if (check != 1){
                window.location.href = '/cart';
            }
        });

        function addProductToCart(){
            let lstProduct = getProductFromCart()
            if (!productItemResult){
                toastr.error("Vui lòng chọn sản phẩm")
                return 1
            }
            let inputSoLuong =  $('#inputSoLuong').val()
            if (inputSoLuong < 1){
                toastr.error('Sản phẩm thành đã hết hàng');
                return 1;
            }
            let itemCart = lstProduct.find(item => item.id == productItemResult.id)
            if (itemCart){
                let soluong = Number(itemCart.soLuongMua) + Number(inputSoLuong)
                if (soluong  > productItemResult.soLuong){
                    toastr.error("Số lượng sản phẩm không đủ")
                    return 1
                }
                itemCart.soLuongMua = soluong; // Cập nhật số lượng
                // Cập nhật lại giỏ hàng với mảng mới
                let dataCart = [...lstProduct];  // Sao chép lại lstProduct
                console.log('Cập nhật giỏ hàng:', dataCart);
                setProductToCart(dataCart);
            }else {
                if (inputSoLuong > productItemResult.soLuong){
                    toastr.error("Số lượng sản phẩm không đủ")
                    return 1
                }
                let item= {
                    ...productItemResult,
                    soLuongMua: inputSoLuong,
                    tenSanPham: product.tenSanPham,
                    urlAnh: product.urlAnh,
                }
                let dataCart = [...lstProduct, item]
                console.log(dataCart)
                setProductToCart(dataCart)
            }

        }

    });


</script>

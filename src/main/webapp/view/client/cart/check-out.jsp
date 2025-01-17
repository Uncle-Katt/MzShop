<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container cart-container">
    <div class="cart-header mt-4 mb-2">
        <h5>Thanh toán</h5>
    </div>
    <div style="margin-bottom: 30px">
        <div class="row">
            <!-- Cart -->
            <div  class="my-4 col-8" id="cart-items-container">

            </div>
            <div class="col-4">
                <div>
<%--                    <div style="display: flex; align-items: flex-end; justify-content: space-between; margin-bottom: 10px">--%>
<%--                        <div>Phiếu giảm giá</div>--%>
<%--                        <button class="btn btn-danger" data-toggle="modal" data-target="#voucherModal"--%>
<%--                                style="background-color: #b85555; color: white; border: none;">--%>
<%--                            + Phiếu giảm giá--%>
<%--                        </button>--%>
<%--                    </div>--%>
                    <div class="alert alert-warning" role="alert" id="voucherInfo" style="display: none">
                        <div id="voucherInfoCode"></div>
                        <div id="voucherInfoName"></div>
                    </div>
                    <div class="modal fade" id="voucherModal" tabindex="-1" aria-labelledby="voucherModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" style="max-width: 70%">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="voucherModalLabel">Chọn phiếu giảm giá</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span>&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="searchVoucher" class="form-label">Tìm kiếm</label>
                                        <input type="text" class="form-control w-50"
                                               placeholder="Nhập mã phiếu giảm giá" id="searchVoucher">
                                    </div>
                                    <table class="table" id="voucherTable">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã</th>
                                            <th>Tên</th>
                                            <th>Giá trị tối thiểu</th>
                                            <th>Giá trị giảm</th>
                                            <th>Số lượng</th>
                                            <th>Ngày bắt đầu</th>
                                            <th>Ngày kết thúc</th>
                                            <th>Hành Động</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary btn-voucher-null">Bỏ Giảm Giá
                                    </button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <hr>
                <div class="row">
                    <div class="col-md-6">
                        <p>Tổng tiền</p>
                        <p>Phí vận chuyển</p>
                        <p>Giảm giá</p>
                        <p><strong>Thành tiền</strong></p>
                    </div>

                    <div class="col-md-6 text-right">
                        <p id="total-money">0 đ</p>
                        <p id="ship-money">0 đ</p>
                        <p id="voucher-money">0 đ</p>
                        <p><strong style="color: #b85555;" id="total-amount">0 đ</strong></p>


                    </div>
                </div>
                <!-- Cart Summary -->
                <div class="cart-summary my-4" style="display: flex; justify-content: center; align-items: center">
                    <button class="btn btn-primary"  id="checkOutPayment" style="background-color: #b85555; color: white; border: none;">Xác nhận đặt hàng</button>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div id="boxInfoGiaoHang" class="row mt-2" style="padding-top: 10px;">
                <div style="display: flex; justify-content: space-between; align-items: end; margin-bottom: 10px">
                    <strong>Địa chỉ giao hàng</strong>
                    <%--                <div>--%>
                    <%--                    <button class="btn btn-primary" id="selectAddressKhachHang" data-toggle="modal"--%>
                    <%--                            data-target="#addressTableModal" style="display: none">Chọn địa chỉ--%>
                    <%--                    </button>--%>
                    <%--                </div>--%>
                </div>
                <div>
                    <div class="mb-3">
                        <label for="nameAddress" class="form-label required">Họ và tên</label>
                        <input type="text" class="form-control" id="nameAddress"
                               placeholder="Nhập tên người nhận">
                    </div>
                    <div class="mb-3">
                        <label for="phoneAddress" class="form-label required">Số điện thoại</label>
                        <input type="text" class="form-control" id="phoneAddress"
                               placeholder="Nhập Số điện thoại">
                    </div>
                    <div class="mb-3 row">
                        <div class="col-4">
                            <label for="provinceAddress" class="form-label required">Tỉnh/Thành</label>
                            <select class="form-select" id="provinceAddress">
                                <option value="" selected disabled hidden>Chọn tỉnh</option>
                            </select>
                        </div>
                        <div class="col-4">
                            <label class="form-label required" for="districtAddress">Quận/Huyện</label>
                            <select class="form-select" id="districtAddress">
                                <option value="" selected disabled hidden>Chọn huyện</option>
                            </select>
                        </div>
                        <div class="col-4">
                            <label for="wardAddress" class="form-label required">Xã/Phường</label>
                            <select class="form-select" id="wardAddress">
                                <option value="" selected disabled hidden>Chọn xã</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="detailAddress" class="form-label required">Địa chỉ chi tiết</label>
                        <input type="text" class="form-control" id="detailAddress"
                               placeholder="Nhập địa chỉ chi tiết">
                    </div>
                    <div class="mt-2">
                        <label id="textTimeDhn"></label>
                    </div>
                </div>
                <div>
                    <div class="modal fade" id="addressTableModal" tabindex="-1"
                         aria-labelledby="addressTableLabel"
                         aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" style="max-width: 80%">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addressTableLabel">Địa chỉ khách hàng</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span>&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <table class="table" id="addressTable">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Địa chỉ mặc đinh</th>
                                            <th>Họ và tên</th>
                                            <th>Số điện thoại</th>
                                            <th>Tỉnh/Thành phố</th>
                                            <th>Quận/Huyện</th>
                                            <th>Xã/Phường</th>
                                            <th>Chi tiết</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>



</div>

<script>

    $(document).ready(function () {
        let totalMoney = 0;
        let totalAmount = 0;
        let voucherMoney = 0;
        let shipMoney = 0;

        let provinceId = null;
        let districtId = null;
        let wardId = null;
        let serviceId = null;

        let lstProvince = [];
        let lstDistrict = [];
        let lstWard = [];

        const GHN_API = "https://online-gateway.ghn.vn/shiip/public-api/master-data"
        const GHN_TOKEN = "dfe1e7cf-e582-11ee-b290-0e922fc774da"


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
                                '<span class="text-danger">'+formatCurrency(item.giaBan)+'</span>'+
                            '</div>'+
                            '<div class="col-md-1 text-center">'+
                                '<span>'+item.soLuongMua+'</span>'+
                            '</div>'+
                            '<div class="col-md-2 text-center">'+
                                '<span class="text-danger">'+formatCurrency(totalMoney)+'</span>'+
                            '</div>'+
                        '</div>'
                $('#cart-items-container').append(productHtml); // Gắn HTML vào phần tử container
            })
            totalMoney = lstProduct.reduce((total, item) => {
                let money = Number(item.giaBan) * Number(item.soLuongMua);
                return total + money;
            }, 0);

            // Hiển thị tổng tiền trong giỏ hàng
            let totalAmountFormatted = formatCurrency(totalMoney); // Giả sử bạn có hàm formatCurrency để định dạng tiền tệ
            $('#total-money').text(totalAmountFormatted);
            $('#total-amount').text(totalAmountFormatted);

        }

// call address api ghn start

        getDataProvince()
        //get data province
        async function getDataProvince() {
            $('#provinceAddress').empty();
            $('#provinceAddress').append('<option value="" selected disabled hidden>Chọn tỉnh</option>');
            await $.ajax({
                url: GHN_API + '/province',
                type: 'GET',
                headers: {
                    token: GHN_TOKEN
                },
                success: function (response) {
                    lstProvince = response.data.map((result) => {
                        return {
                            value: result.ProvinceID,
                            label: result.ProvinceName
                        };
                    });
                    lstProvince.forEach(function (province) {
                        $('#provinceAddress').append(
                            $('<option></option>').val(province.value).text(province.label)
                        );
                    });
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseJSON);
                }
            });
        }

        $('#provinceAddress').change(function () {
            provinceId = $(this).val();
            getDataDistrict()
            shipMoney = 0
            countTotalMoney()
            $("#textTimeDhn").text("")

        })

        async function getDataDistrict() {
            $('#districtAddress').empty();
            $('#districtAddress').append('<option value="" selected disabled hidden>Chọn huyện</option>');
            $('#wardAddress').empty();
            $('#wardAddress').append('<option value="" selected disabled hidden>Chọn xã</option>');
            if (provinceId != null && provinceId != "") {
                await $.ajax({
                    url: GHN_API + '/district',
                    type: 'GET',
                    headers: {
                        token: GHN_TOKEN
                    },
                    data: {
                        province_id: provinceId
                    },
                    success: function (response) {
                        lstDistrict = response.data.map((result) => {
                            return {
                                value: result.DistrictID,
                                label: result.DistrictName
                            };
                        });
                        lstDistrict.forEach(function (district) {
                            $('#districtAddress').append(
                                $('<option></option>').val(district.value).text(district.label)
                            );
                        });
                    },
                    error: function (xhr, status, error) {
                        console.log(xhr.responseJSON); // In ra thông báo lỗi
                    }
                });
            }
        }

        $('#districtAddress').change(function () {
            districtId = $(this).val();
            getDataWard()
            shipMoney = 0
            countTotalMoney()
            $("#textTimeDhn").text("")

        })

        async function getDataWard() {
            $('#wardAddress').empty();
            $('#wardAddress').append('<option value="" selected disabled>Chọn xã</option>');
            if (districtId != null && districtId != "") {
                await $.ajax({
                    url: GHN_API + '/ward',
                    type: 'GET',
                    headers: {
                        token: GHN_TOKEN
                    },
                    data: {
                        district_id: districtId
                    },
                    success: function (response) {
                        lstWard = response.data.map((result) => {
                            return {
                                value: result.WardCode,
                                label: result.WardName
                            };
                        });
                        lstWard.forEach(function (ward) {
                            $('#wardAddress').append(
                                $('<option></option>').val(ward.value).text(ward.label)
                            );
                        });
                    },
                    error: function (xhr, status, error) {
                        console.log(xhr.responseJSON); // In ra thông báo lỗi
                    }
                });
            }
        }

        $('#wardAddress').change(function () {
            wardId = $(this).val();
            calculateShippingToAddress()
        })


        async function fetchAvailableServices(valueDistrict) {
            if (valueDistrict != null) {
                await $.ajax({
                    url: 'https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/available-services',
                    method: 'GET',
                    headers: {
                        token: 'dfe1e7cf-e582-11ee-b290-0e922fc774da'
                    },
                    data: {
                        shop_id: 4962936,
                        from_district: 3440,
                        to_district: valueDistrict
                    },
                    success: function (response) {
                        serviceId = response.data[0].service_id;
                        console.log(serviceId + '-' + response.data[0].short_name);
                    },
                    error: function (error) {
                        console.log(error.responseJSON);
                    }
                });
            }
        }

        async function calculateShippingFee(lstBillDetails, valueDistrict, valueWard, serviceId) {
            console.log(lstBillDetails)
            if (lstBillDetails.length <= 0) {
                return;
            }
            const priceProduct = lstBillDetails.reduce((accumulator, currentProduct) => {
                return accumulator + (currentProduct.giaBan * currentProduct.soLuongMua);
            }, 0);

            const weightProduct = lstBillDetails.reduce((accumulator, currentProduct) => {
                return accumulator + (100 * currentProduct.soLuongMua);
            }, 0);

            console.log("Cân nặng: " + weightProduct);

            if (valueDistrict != null) {
                await $.ajax({
                    url: 'https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee',
                    method: 'GET',
                    headers: {
                        token: 'dfe1e7cf-e582-11ee-b290-0e922fc774da',
                        shop_id: 4962936
                    },
                    data: {
                        service_id: serviceId,
                        insurance_value: priceProduct,
                        coupon: null,
                        from_district_id: 3440,
                        to_district_id: valueDistrict,
                        to_ward_code: "",
                        weight: weightProduct
                    },
                    success: function (response) {
                        shipMoney = response.data.total
                        countTotalMoney()
                    },
                    error: function (error) {
                        console.log(error.responseJSON);
                    },
                    complete: function () {
                        setTimeout(() => {

                        }, 400);
                    }
                });
            }
        }

        function fetchLeadtime(valueDistrict, valueWard, serviceId) {
            if (valueDistrict != null && valueWard != null) {
                console.log(valueWard);
                $.ajax({
                    url: 'https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/leadtime',
                    method: 'GET',
                    headers: {
                        token: 'dfe1e7cf-e582-11ee-b290-0e922fc774da'
                    },
                    data: {
                        from_district_id: 3440,
                        from_ward_code: 13007,
                        to_district_id: valueDistrict,
                        to_ward_code: valueWard,
                        service_id: serviceId
                    },
                    success: function (response) {
                        const time = response.data.leadtime_order
                        const fromDateOnly = formatDate(time.from_estimate_date);
                        const toDateOnly = formatDate(time.to_estimate_date);
                        $("#textTimeDhn").text("Giao Hang Nhanh - Dự kiến giao hàng từ: " + fromDateOnly + " đến: " + toDateOnly)
                    },
                    error: function (error) {
                        console.log(error.responseJSON);
                    }
                });
            }
        }

        async function calculateShippingToAddress() {
            await fetchAvailableServices(districtId)
            let lstProductDetail = getProductFromCart();
            await calculateShippingFee(lstProductDetail, districtId, wardId, serviceId)
            await fetchLeadtime(districtId, wardId, serviceId)
        }

        // call address api ghn end

        function countTotalMoney() {
            $('#total-money').text(formatCurrency(totalMoney));
            $('#total-money2').text(formatCurrency(totalMoney));
            $('#voucher-money').text(formatCurrency(voucherMoney));
            $('#ship-money').text(formatCurrency(shipMoney));
            totalAmount = totalMoney + shipMoney - voucherMoney;
            if (totalAmount <= 0) {
                totalAmount = 0
            }
            $('#total-amount').text(formatCurrency(totalAmount));
        }


        $('#checkOutPayment').on('click', function () {
            let nameAddress = $('#nameAddress').val();
            let phoneAddress = $('#phoneAddress').val();
            let provinceAddress = $('#provinceAddress option:selected').text();
            let districtAddress = $('#districtAddress option:selected').text();
            let wardAddress = $('#wardAddress option:selected').text();

            let provinceAddressValue = $('#provinceAddress option:selected').val();
            let districtAddressValue = $('#districtAddress option:selected').val();
            let wardAddressValue = $('#wardAddress option:selected').val();

            let detailAddress = $('#detailAddress').val();
            let address =  detailAddress + ", " + wardAddress + ", " + districtAddress + ", " + provinceAddress
            // Kiểm tra nếu có bất kỳ trường nào bị bỏ trống
            if (!nameAddress || !phoneAddress || !provinceAddressValue ||
                !districtAddressValue || !wardAddressValue || !detailAddress) {
                toastr.error("Vui lòng nhập đầy đủ thông tin giao hàng");
                return;
            }
            let lstProduct = getProductFromCart();
            let lstProductDetail = lstProduct.map(item => {
                return {
                    id: item.id,
                    quantity: Number(item.soLuongMua),
                }
            })
            let req = {
                nameAddress: nameAddress,
                phoneAddress: phoneAddress,
                address: address,
                lstProductDetail: lstProductDetail,
                shipMoney: shipMoney,

            }
            Swal.fire({
                title: 'Xác nhận đặt hàng ?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Xác nhận',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#loading').show();
                    $.ajax({
                        url: '/payment-cart',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(req),
                        success: function (response) {
                            toastr.success('Đặt hàng thành công');

                            setTimeout(() => {
                                $('#loading').hide();
                                setProductToCart([])
                                window.location.href = '/show-bill/'+response.data.maHoaDon;
                            }, 1000);
                        },
                        error: function (err) {
                            // toastr.error('Đặt hàng thất bại!, số lượng không đủ hoặc không tìm thấy sản phẩm');
                            toastr.error(err.responseJSON.message)
                            toastr.error("Đẫ xóa toàn bộ giỏ hàng vui lòng thêm lại sản phẩm")
                            setProductToCart([])
                            setTimeout(() => {
                                window.location.href = '/cart';
                                $('#loading').hide();
                            }, 1500);


                        }
                    });
                }
            });
        })

    });


</script>



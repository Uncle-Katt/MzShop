<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <h3>Khách hàng</h3>
    <a href="/admin/customer" class="btn mb-2"><i class="fa-solid fa-arrow-left"></i></a>
    <div class="card">
        <div class="card-body">
            <div class="row  mt-4">
                <div class="col-4 d-flex">
                    <div class="">
                        Tên khách hàng:
                    </div>
                    <div class="ml-2">
                        Tên khách hàng
                    </div>
                </div>
                <div class="col-4 d-flex">
                    <div class="">
                        Ngày sinh:
                    </div>
                    <div class="ml-2">
                        Tên khách hàng
                    </div>
                </div>
                <div class="col-4 d-flex">
                    <div class="">
                        Giới Tính:
                    </div>
                    <div class="ml-2">
                        Tên khách hàng
                    </div>
                </div>
            </div>
            <div class="row mt-4 mb-4">
                <div class="col-4 d-flex">
                    <div class="">
                        Số điện thoại:
                    </div>
                    <div class="ml-2">
                        Tên khách hàng
                    </div>
                </div>
                <div class="col-4 d-flex">
                    <div class="">
                        Email:
                    </div>
                    <div class="ml-2">
                        Tên khách hàng
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-3">
                <h5 class="card-title">Địa Chỉ Nhận Hàng</h5>
                <button class="btn btn-primary" data-toggle="modal" data-target="#addressModal"><i class="fa-solid fa-plus"></i> Thêm Địa Chỉ</button>
                <div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="addressModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" style="max-width: 48%">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addressModalLabel">Địa Chỉ</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span>&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" >
                                <div class="mb-3">
                                    <label for="nameKh" class="form-label">Họ và tên</label>
                                    <input type="text" class="form-control" id="nameKh" placeholder="Nhập tên khách hàng">
                                </div>
                                <div class="mb-3">
                                    <label for="nameKh" class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" id="phoneKh" placeholder="Nhập Số điện thoại">
                                </div>
                                <div class="mb-3 row">
                                    <div class="col-4">
                                        <label class="form-label">Tỉnh/Thành</label>
                                        <select class="form-select" aria-label="Small select example">
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                        </select>
                                    </div>
                                    <div class="col-4">
                                        <label class="form-label">Quận/Huyện</label>
                                        <select class="form-select" >
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                        </select>
                                    </div>
                                    <div class="col-4">
                                        <label class="form-label">Xã/Phường</label>
                                        <select class="form-select" aria-label="Small select example">
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="nameKh" class="form-label">Địa chỉ</label>
                                    <input type="text" class="form-control" id="addressDetail" placeholder="Nhập Số điện thoại">
                                </div>
                                <div class="mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                                        <label class="form-check-label" for="flexCheckChecked">
                                            Đặt làm địa chỉ mặc định
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" id="searchCustomer">Hoàn Tất</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table" id="customerTable">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Địa chỉ mặc đinh</th>
                    <th>Địa chỉ mặc đinh</th>
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
    </div>
</div>

<script>

    let customer = ${customerId};

    $(document).ready(function () {
        let customerTable = $('#customerTable').DataTable({
            "paging": true,        // Bật phân trang
            "searching": false,     // Bật tìm kiếm
            "ordering": false,      // Bật sắp xếp
            "info": false,          // Bật thông tin tổng quan
            "lengthChange": false,  // Cho phép thay đổi số lượng bản ghi hiển thị
            "pageLength": 5,       // Số lượng bản ghi trên mỗi trang
            "columnDefs": [
                {"className": "text-center", "targets": "_all"}
            ],
        });

        function loadTableCustomer() {
            $.ajax({
                        url: '/admin/customer/list',
                        method: 'GET',
                        dataType: 'json',
                        data: {search: search},
                success: function (data) {

                },
                error: function (err) {
                    toastr.error('Lỗi khi lấy dữ liệu khách hàng', err);
                }
            });
        }
        function click(){
            console.log("123")
            console.log(customer)
        }

        $(document).on('click', '#searchCustomer', function () {
            click()
        });
        loadTableCustomer()
    })

</script>
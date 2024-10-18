formatter.setTimeZone(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));

function validateGiamGia() {
    const loaiGiam = document.getElementById('loaiGiam').value;
    const phanTramGiam = parseFloat(document.getElementById('phanTramGiam').value);
    const soLuong = parseFloat(document.getElementById('soLuong').value);

    // Nếu loại giảm là phần trăm (%)
    if (loaiGiam == '1') {
        if (phanTramGiam < 1 || phanTramGiam > 100) {
            document.getElementById('phanTramGiam').setCustomValidity("Giá trị giảm theo % phải nằm trong khoảng từ 1 đến 100.");
        } else {
            document.getElementById('phanTramGiam').setCustomValidity(""); // Xóa lỗi nếu giá trị hợp lệ
        }
    }

    // Nếu loại giảm là tiền ($)
    if (loaiGiam == '0') {
        if (phanTramGiam < 1) {
            document.getElementById('phanTramGiam').setCustomValidity("Giá trị giảm theo $ phải lớn hơn hoặc bằng 1.");
        } else if (phanTramGiam % 10000 !== 0 || phanTramGiam >0) {
            document.getElementById('phanTramGiam').setCustomValidity("Giá trị giảm theo $ phải là bội số của 10000 và lớn hơn 0.");
        } else {
            document.getElementById('phanTramGiam').setCustomValidity(""); // Xóa lỗi nếu giá trị hợp lệ
        }
    }
    // check so luong
    if (soLuong <= 0) {
        document.getElementById('soLuong').setCustomValidity("Số lượng phải lớn hơn hoặc bằng 1.");
    }
}

// Kiểm tra khi loại giảm giá thay đổi
document.getElementById('loaiGiam').addEventListener('keyup', function () {
    validateGiamGia(); // Kiểm tra ngay khi loại giảm thay đổi
});
document.getElementById('phanTramGiam').addEventListener('keyup', function () {
    validateGiamGia(); // Kiểm tra ngay khi người dùng nhập giá trị giảm
});


function edit(id) {


    fetch('/phieu-giam-gia/layTheoId/' + id)
        .then(response => response.json())
        .then(data => {

            document.getElementById('id').value = data.id;
            document.getElementById('maPhieuGiamGia').value = data.maPhieuGiamGia;
            document.getElementById('tenPhieuGiamGia').value = data.tenPhieuGiamGia;
            document.getElementById('loaiGiam').value = data.loaiGiam
            document.getElementById('phanTramGiam').value = data.phanTramGiam;
            document.getElementById('dieuKienToiThieu').value = data.dieuKienToiThieu;

            document.getElementById('ngayBatDau').value = data.ngayBatDau.slice(0, 10);
            document.getElementById('ngayKetThuc').value = data.ngayKetThuc.slice(0, 10);

            console.log(data.ngayBatDau);
            console.log(data.ngayKetThuc);

            document.getElementById('soLuong').value = data.soLuong;
            document.getElementById('moTa').value = data.moTa;
            document.getElementById('trangThai').value = data.trangThai;

            $('#maGiamGiaModal').modal('show');
        })
        .catch(error => console.error('Error fetching data:', error));
}

// Hàm tạo mã ngẫu nhiên
function generateRandomCode(length) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'; // Các ký tự có thể có
    let result = '';
    for (let i = 0; i < length; i++) {
        const randomIndex = Math.floor(Math.random() * characters.length);
        result += characters[randomIndex];
    }
    return result;
}

function resetModal() {
    document.getElementById('id').value = '';
    document.getElementById('maPhieuGiamGia').value = generateRandomCode(6);
    document.getElementById('tenPhieuGiamGia').value = '';
    document.getElementById('loaiGiam').value = '1'; // Mặc định chọn theo phần trăm
    document.getElementById('phanTramGiam').value = '';
    document.getElementById('dieuKienToiThieu').value = '';
    document.getElementById('ngayBatDau').value = '';
    document.getElementById('ngayKetThuc').value = '';
    document.getElementById('soLuong').value = '';
    document.getElementById('moTa').value = '';
    document.getElementById('trangThai').value = '1'; // Mặc định là Hoạt Động
}

function deleteById(id) {
    if (confirm('Bạn có chắc chắn muốn xóa?')) {
        window.location.href = '${pageContext.request.contextPath}/phieu-giam-gia/delete/' + id;
    }
}
// Đợi sau 5 giây (5000 ms) và ẩn thông báo
setTimeout(function() {
    var alertMessage = document.getElementById("alert-message");
    if (alertMessage) {
        alertMessage.style.display = 'none';
    }
}, 5000); // 5000 ms = 5 giây

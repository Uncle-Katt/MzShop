<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
    <h3>Nhân viên</h3>
    <a href="/admin/staff" class="btn mb-2"><i class="fa-solid fa-arrow-left"></i></a>
    <div class="card">
        <div class="card-body">
            <form id="staffForm" action="${action}" method="post" >
                <input type="hidden" class="form-control" name="id" id="id" value="${staff.id}">
                <div class="mb-3">
                    <label for="nameNv" class="form-label">Tên nhân viên</label>
                    <input type="text" class="form-control" name="tenNhanVien" id="nameNv" placeholder="Nhập tên nhân viên" value="${staff.tenNhanVien}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Giới tính</label>
                    <div class="d-flex">
                        <c:forEach var="entry" items="${gender}">
                            <div class="mr-4">
                                <input type="radio" id="gender${entry.key}" name="gioiTinh" value="${entry.key}"
                                       <c:if test="${staff.gioiTinh == entry.key}">checked</c:if> >
                                <label for="gender${entry.key}" class="form-check-label">${entry.value}</label>
                            </div>
                        </c:forEach>
                    </div>

                </div>
                <div class="mb-3">
                    <label for="dateKh" class="form-label">Ngày sinh</label>
                    <input type="date" style="width: 200px" class="form-control " id="dateKh" name="ngaySinh"
                           value="${staff.ngaySinh != null ? staff.ngaySinh : '1990-01-01'}" placeholder="Nhập Ngày sinh">
                </div>
                <div class="mb-3">
                    <label for="sdt" class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" id="sdt" name="sdt" value="${staff.sdt}" placeholder="Nhập Số điện thoại">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" id="email" value="${staff.email}" placeholder="Nhập email nhân viên">
                </div>
                <div class="mb-3">
                    <label for="diaChi" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" name="diaChi" id="diaChi" value="${staff.diaChi}" placeholder="Nhập địa chỉ nhân viên">
                </div>
                <div class="d-flex justify-content-end mt-4">
                    <button type="submit"  class="btn btn-primary">${btnText}</button>
                </div>
            </form>

        </div>
    </div>
</div>

<script>

</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
    <h3>Khách hàng</h3>
    <a href="/admin/customer" class="btn mb-2"><i class="fa-solid fa-arrow-left"></i></a>
    <div class="card">
        <div class="card-body">
            <form id="customerForm" action="${action}" method="post" >
                <input type="hidden" class="form-control" name="id" id="id" value="${customer.id}">
                <div class="mb-3">
                    <label for="nameKh" class="form-label">Tên khách hàng</label>
                    <input type="text" class="form-control" name="hoVaTen" id="nameKh" placeholder="Nhập tên khách hàng" value="${customer.hoVaTen}">
                </div>
                <div class="mb-3">
                    <label for="nameKh" class="form-label">Giới tính</label>
                    <div class="d-flex">
                        <c:forEach var="entry" items="${gender}">
                            <div class="mr-4">
                                <input type="radio" id="gender${entry.key}" name="gioiTinh" value="${entry.key}"
                                       <c:if test="${customer.gioiTinh == entry.key}">checked</c:if> >
                                <label for="gender${entry.key}" class="form-check-label">${entry.value}</label>
                            </div>
                        </c:forEach>
                    </div>

                </div>
                <div class="mb-3">
                    <label for="nameKh" class="form-label">Ngày sinh</label>
                    <input type="date" style="width: 200px" class="form-control " id="dateKh" name="ngaySinh"
                           value="${customer.ngaySinh}" placeholder="Nhập Ngày sinh">
                </div>
                <div class="mb-3">
                    <label for="nameKh" class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" id="phoneKh" name="soDienThoai" value="${customer.soDienThoai}" placeholder="Nhập Số điện thoại">
                </div>
                <div class="mb-3">
                    <label for="nameKh" class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" id="emailKh" value="${customer.email}" placeholder="Nhập email khách hàng">
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
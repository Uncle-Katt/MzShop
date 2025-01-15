<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container my-5">
    <div class="row">
        <div class="col-md-4 left-column">
            <div class="top-section">
                <h5 class="section-title mb-4">DANH MỤC</h5>
                <ul class="list-unstyled">
                    <li>
                        <input type="radio" name="category" id="category1" checked>
                        <label for="category1" class="ms-2">Son lì</label>
                    </li>
                </ul>
            </div>
            <div class="bottom-section">
                <h5 class="section-title">ĐỊA CHỈ</h5>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.699004540093!2d105.74995997495157!3d21.044726287230574!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345500459db50f%3A0x2af0a296afa85ba2!2zcDIga2nhu4F1IG1haQ!5e0!3m2!1svi!2s!4v1735914968132!5m2!1svi!2s"
                        width="385" height="550" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>


        <div class="col-md-8 right-column">
            <div class="container">
                <div id="product-list" style="display: flex; flex-wrap: wrap">


                </div>
<%--                <div class="d-flex justify-content-center mt-4">--%>
<%--                    <nav aria-label="Page navigation">--%>
<%--                        <ul class="pagination">--%>
<%--                            <li class="page-item">--%>
<%--                                <a class="page-link" href="#" aria-label="Previous">--%>
<%--                                    <span aria-hidden="true">&laquo;</span>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--                            <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                            <li class="page-item">--%>
<%--                                <a class="page-link" href="#" aria-label="Next">--%>
<%--                                    <span aria-hidden="true">&raquo;</span>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </nav>--%>
<%--                </div>--%>
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function () {
        function getDataProduct(){
            $.ajax({
                url: `/product/list`,
                method: 'GET',
                success: function (rep) {
                    let html = '';
                    rep.data.forEach(product => {
                        const priceText = product.giaBanMin == product.giaBanMax
                            ? formatCurrency(product.giaBanMin)
                            : formatCurrency(product.giaBanMin) + ' - '+ formatCurrency(product.giaBanMax);
                        html +=
                            '<div class="col-4 mb-4">'+
                            '<a href="/product/'+product.id+'" style="text-decoration: none; color: black">'+
                                '<div class="product-item text-center border rounded">'+
                                    '<img src="'+product.urlAnh+'" alt="img" class="img-fluid mb-2" style="height: 120px">'+
                                    '<h6 class="text-truncate">'+product.tenSanPham+'</h6>'+
                                    '<p class="text-danger fw-bold">'+priceText+'</p>'+
                                '</div>'+
                            '</a>'+
                            '</div>'
                    });

                    $('#product-list').html(html);
                },
                error: function () {

                },
            });
        }
        getDataProduct()

    });


</script>


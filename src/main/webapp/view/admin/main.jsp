<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="header.jsp" %>
<main style="width: 80%; padding-top: 20px">
    <jsp:include page="${page}.jsp" />
    <div id="loading" class="loading-overlay" style="display: none">
        <div style="width: 20%"></div>
        <div class="loader"></div>
    </div>
</main>
</div>
</div>

<script>

    $(document).ready(function () {
        function checkAuth(){
            let account = JSON.parse(localStorage.getItem("account"))
            console.log(account)
            if (!account) {
                console.log("Account found: " + account);
                localStorage.removeItem("account");
                window.location.href = "/admin/login";
            }
        }
        checkAuth()
    });


</script>
<%@ include file="footer.jsp" %>
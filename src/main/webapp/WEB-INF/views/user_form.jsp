<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="span" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 123456
  Date: 12/21/2023
  Time: 10:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        <%@include file="/WEB-INF/styles/style.css" %>
    </style>
</head>
<body>
<div class="container-form">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"
                    id="exampleModalLongTitle">${user.id != null ? 'EDIT USER' : 'CREATE NEW USER'}</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true" onclick="cancelForm()"><i class="fa-solid fa-xmark"></i></span>
                </button>
            </div>
            <div class="modal-body">
                <%--@elvariable id="Users" type="java"--%>
                    <form:form action="${pageContext.request.contextPath}/saveUser" method="post" modelAttribute="user">
                    <%--        kiểm tra xem có id không để cập nhật--%>
                    <form:hidden path="id" placeholder="Enter name"/>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <form:input type="text" class="form-control" path="name" placeholder="Enter name"/>
                        <span style="color: red;" id="nameError">

                    </span>
                        <form:errors path="name" cssClass="error"/>

                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <form:input type="email" class="form-control" path="email" placeholder="Enter email"/>
                        <c:if test="${not empty error}">
                            <p class="error text-danger">${error}</p>
                        </c:if>

                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <form:input type="text" class="form-control" path="address" placeholder="Enter address"/>
                    </div>
                        <button type="submit" class="btn btn-primary add"
                                onclick="showSuccessMessage()">${user.id != null ? 'Update' : 'Add'}</button>
                </form:form>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    function cancelForm() {
        window.location = "/";
    }


</script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/WEB-INF/styles/main.js"></script>--%>

</body>
</html>



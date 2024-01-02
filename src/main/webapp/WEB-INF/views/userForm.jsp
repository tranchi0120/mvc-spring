<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add User</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <style>
        <%@include file="/WEB-INF/styles/formUser.css" %>
    </style>


    <script>
        $(document).ready(function () {
            $("#saveButton").on("click", function () {
                var name = $("#nameInput").val();
                var email = $("#emailInput").val();
                var address = $("#addressInput").val();

                var user = {
                    "name": name,
                    "email": email,
                    "address": address
                };

                $.ajax({
                    type: "POST",
                        url: "${pageContext.request.contextPath}/users/addUser",
                    contentType: "application/json",
                    data: JSON.stringify(user),
                    success: function (data, textStatus, xhr) {
                        if (xhr.status === 201) {
                            var location = xhr.getResponseHeader("Location");
                            console.log("User added successfully.", location);

                            window.location.href = "${pageContext.request.contextPath}/view/listUser";
                        }
                    },
                    error: function () {
                        $("#message").html("Error: Email đã tồn tại!!!");
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="group-title">
        <h2 class="title">Add User</h2>
    </div>
    <form>
        <div class="form-group">
            <label for="nameInput">Name:</label>
            <input type="text" class="form-control" id="nameInput" name="name">
        </div>

        <div class="form-group">
            <label for="emailInput">Email:</label>
            <input type="text" class="form-control" id="emailInput" name="email">
        </div>

        <div class="form-group">
            <label for="addressInput">Address:</label>
            <input type="text" class="form-control" id="addressInput" name="address">
        </div>

        <button type="button" class="btn btn-primary" id="saveButton">Save</button>
    </form>

    <div id="message"></div>
</div>
</body>
</html>






















































<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<%@ taglib prefix="span" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <!-- Latest compiled and minified CSS -->--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">--%>

<%--    <!-- jQuery library -->--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>--%>

<%--    <!-- Popper JS -->--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>--%>

<%--    <!-- Latest compiled JavaScript -->--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"--%>
<%--          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="--%>
<%--          crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>

<%--    <style>--%>
<%--        <%@include file="/WEB-INF/styles/style.css" %>--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container-form">--%>
<%--    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title"--%>
<%--                    id="exampleModalLongTitle">${user.id != null ? 'EDIT USER' : 'CREATE NEW USER'}</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal"--%>
<%--                        aria-label="Close">--%>
<%--                    <span aria-hidden="true" onclick="cancelForm()"><i class="fa-solid fa-xmark"></i></span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--&lt;%&ndash;            <div class="modal-body">&ndash;%&gt;--%>

<%--&lt;%&ndash;                    <form:form action="${pageContext.request.contextPath}/saveUser" method="post" modelAttribute="user">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;   kiểm tra xem có id không để cập nhật&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <form:hidden path="id" placeholder="Enter name"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="form-group">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <label for="name">Name</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <form:input type="text" class="form-control" path="name" placeholder="Enter name" required = "true"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <span style="color: red;" id="nameError">&ndash;%&gt;--%>

<%--&lt;%&ndash;                    </span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <form:errors path="name" cssClass="error"/>&ndash;%&gt;--%>

<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="form-group">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <label for="email">Email</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <form:input type="email" class="form-control" path="email" placeholder="Enter email"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <c:if test="${not empty error}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p class="error text-danger">${error}</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </c:if>&ndash;%&gt;--%>

<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="form-group">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <label for="address">Address</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <form:input type="text" class="form-control" path="address" placeholder="Enter address" required = "true"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <button type="submit" class="btn btn-primary add"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                onclick="showSuccessMessage()">${user.id != null ? 'Update' : 'Add'}</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </form:form>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<script type="text/javascript">--%>
<%--    function cancelForm() {--%>
<%--        window.location = "/";--%>
<%--    }--%>


<%--</script>--%>
<%--&lt;%&ndash;<script type="text/javascript" src="${pageContext.request.contextPath}/WEB-INF/styles/main.js"></script>&ndash;%&gt;--%>

<%--</body>--%>
<%--</html>--%>



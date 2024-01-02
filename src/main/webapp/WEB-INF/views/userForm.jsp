<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            var urlParts = window.location.href.split('/');
            var userId = urlParts.slice(-1)[0];
            var longUserId = parseInt(userId, 10);
            console.log(longUserId)

            var isUpdate = !isNaN(longUserId);

            if (isUpdate) {

                $.ajax({
                    url: "${pageContext.request.contextPath}/users/" + longUserId,
                    type: "GET",
                    dataType: "json",
                    success: function (data) {
                        // Hiển thị dữ liệu lên form để người dùng có thể chỉnh sửa
                        $("#nameInput").val(data.name);
                        $("#emailInput").val(data.email);
                        $("#addressInput").val(data.address);
                    },
                    error: function () {
                        console.log("Error loading user data for update");
                    }
                });
            }

            $("#saveButton").on("click", function () {
                var name = $("#nameInput").val();
                var email = $("#emailInput").val();
                var address = $("#addressInput").val();

                var user = {
                    "name": name,
                    "email": email,
                    "address": address
                };

                var apiUrl = isUpdate ? "${pageContext.request.contextPath}/users/update/" + longUserId : "${pageContext.request.contextPath}/users/addUser";

                $.ajax({
                    type: isUpdate ? "PUT" : "POST",
                    url: apiUrl,
                    contentType: "application/json",
                    data: JSON.stringify(user),
                    success: function (data, textStatus, xhr) {
                        if (xhr.status === 201 || xhr.status === 200) {
                            console.log("User added/updated successfully.", data);

                            // Chuyển hướng sau khi thêm hoặc cập nhật
                            window.location.href = "${pageContext.request.contextPath}/view/listUser";
                        }
                    },
                    error: function (error) {
                        $("#message").html("Error: email đã tồn tại!!! ");
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="group-title">
        <h2 class="title">${longUserId ? "Edit User" : "Add User"}</h2>
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


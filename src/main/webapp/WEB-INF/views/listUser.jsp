<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List User</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        <%@include file="/WEB-INF/styles/style.css" %>
    </style>


    <script>
        $(document).ready(function loadUserList() {

            // get userList
            $.ajax({
                url: "/users",
                type: "GET",
                dataType: "json",
                success: function (data) {
                    disPlayUserList(data)
                }, error: function () {
                    console.log("error load data")
                }
            });


            $(".add a").on("click", function (e) {
                e.preventDefault();
                window.location.href = "${pageContext.request.contextPath}/view/addUser";
            });


            function disPlayUserList(users) {
                var userListElement = $("#listUser");
                userListElement.empty();

                if (users.length === 0) {
                    userListElement.append("<p>No users found</p>");
                } else {
                    var table = $("<table class='table table-striped table-responsive-md'>");
                    var headerRow = $("<tr>").append("" +
                        "<th>STT</th>" +
                        "<th>Name</th>" +
                        "<th>Email</th>" +
                        "<th>Address</th>" +
                        "<th>Action</th>");
                    table.append(headerRow);

                    $.each(users, (index, user) => {
                        var row = $("<tr>").append("<td>"
                            + (index + 1) + "</td><td>"
                            + user.name + "</td><td>"
                            + user.email + "</td><td>"
                            + user.address + "</td>");

                        var edit = $('<a href="#" class="edit-link"><i class="fa-solid fa-pen"></i></a>');
                        edit.on('click', function () {
                            window.location.href = "/view/editUser/" + user.id;
                        });

                        var deleted = $('<a href="#" class="delete-link" data-userid="' + user.id + '"><i class="icon-delete fa-solid fa-trash"></i></a>');
                        deleted.on('click', function () {
                            var userId = $(this).data("userid");
                            console.log("userId: ", userId)
                            deleteRow(userId);
                        });
                        var actionColumn = $("<td>").append(edit).append(deleted);
                        row.append(actionColumn);
                        table.append(row);
                    });

                    userListElement.append(table);
                }
            }

            // delete User
            function deleteUser(userId) {
                $.ajax({
                    url: "http://localhost:8080/users/delete/" + userId,
                    type: "DELETE",
                    success: function () {
                        loadUserList();
                    },
                    error: function () {
                        console.log("Lỗi khi xóa người dùng");
                    }
                });
            }
            function deleteRow(userId) {
                var confirmation = confirm("Bạn có chắc chắn muốn xóa người dùng này?");
                if (confirmation) {
                    deleteUser(userId);
                }
            }
        });
    </script>


</head>
<body>
<div class="container">

    <div class="group-title">
        <h2 class="title">LIST USERS</h2>

        <p class="add">
            <a href="${pageContext.request.contextPath}/view/addUser" class="btn btn-primary">
                <i class="fas fa-user-plus ml-2"></i>
            </a>
        </p>
    </div>
    <div id="listUser"></div>
</div>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>
</html>

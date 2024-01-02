<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List User</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
        <%@include file="/WEB-INF/styles/style.css" %>
    </style>



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
<script>
    $(document).ready(function () {

        $(".add a").on("click", function (e) {
            e.preventDefault();
            // Thực hiện chuyển hướng đến trang add
            window.location.href = "${pageContext.request.contextPath}/view/addUser";
        });

        function disPlayUserList(users) {
            var userListElement = $("#listUser");
            userListElement.empty();

            if (users.length === 0) {
                userListElement.append("<p>No users found</p>");
            } else {
                var table = $("<table class='table table-striped table-responsive-md'>");
                var headerRow = $("<tr>").append("<th>STT</th><th>Name</th><th>Email</th><th>Address</th><th>Action</th>");
                table.append(headerRow);

                $.each(users, (index, user) => {
                    var row = $("<tr>").append("<td>" + (index + 1) + "</td><td>" + user.name + "</td><td>" + user.email + "</td><td>" + user.address + "</td>");

                    var editLink = $('<a href="#" class="edit-link">Edit</a>');
                    editLink.on('click', function () {
                        window.location.href = "${pageContext.request.contextPath}/view/addUser";
                        console.log('Edit clicked for user with ID: ' + user.id);
                    });

                    var deleteLink = $('<a href="#" class="delete-link ml-2">Delete</a>');
                    deleteLink.on('click', function () {
                        console.log('Delete clicked for user with ID: ' + user.id);
                    });

                    var actionColumn = $("<td>").append(editLink).append(deleteLink);
                    row.append(actionColumn);

                    table.append(row);
                });

                userListElement.append(table);
            }
        }
        $.ajax({
            url: "/users",
            type: "GET",
            dataType: "json",
            success: function (data) {
                console.log(data)
                disPlayUserList(data)
            }, error: function () {
                console.log("error load data")
            }
        });
    });
</script>
</body>
</html>

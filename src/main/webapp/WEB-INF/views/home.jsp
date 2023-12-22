
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>All Students</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
</head>
<body>
<body>
<div class="container my-2">
    <div class="card">
        <div class="card-body">
            <div class="container my-5">
                <p class="my-5">
                    <a href="/addUser" class="btn btn-primary">
                        <i class="fas fa-user-plus ml-2">Add user </i>
                    </a>

                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                        Launch demo modal
                    </button>
                </p>
                <div class="col-md-10">
                    <div>
                        <table class="table table-striped table-responsive-md">
                            <thead>
                            <tr>

                                <th>Id</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.email}</td>
                                    <td>${user.address}</td>
                                    <td>
                                        <a href="/Spring_Boot_CRUD_With_JSP/user-update/${user.id}"
                                           class="btn btn-primary">
                                            <i class="fas fa-user-edit ml-2"></i></a>
                                    </td>
                                    <td>
                                        <a href="/Spring_Boot_CRUD_With_JSP/user-delete/${user.id}"
                                           class="btn btn-primary">
                                            <i class="fas fa-user-times ml-2"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</body>
</html>


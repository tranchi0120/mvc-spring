
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>All Users</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
        <%@include file="/WEB-INF/styles/style.css" %>
    </style>

</head>
<body>

<div class="container my-2">
    <div class=" ">
        <div>
            <div>
                <div class="group-title">
                    <h2 class="title">LIST USERS</h2>
                    <p class="add">

                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#exampleModalCenter">
                            <i class="fas fa-user-plus ml-2"></i>
                        </button>
                    </p>
                </div>


                <div>
                    <div>
                        <table class="table table-striped table-responsive-md">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${listUser}" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>${user.name}</td>
                                    <td>${user.email}</td>
                                    <td>${user.address}</td>
                                    <td>
                                        <a href="/editUser/${user.id}" class="btn btn-primary" data-toggle="modal"
                                           data-target="#exampleModalCenter${user.id} ">
                                            <i class="fas fa-user-edit ml-2"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a href='<c:url value='/delete/${user.id }'/>' type="submit"
                                           class="btn btn-danger">
                                            <i class="fas fa-user-times ml-2"></i>
                                        </a>
                                    </td>
                                </tr>
                                <div class="modal fade"
                                    <%--                                     id="${empty user.id ?  'exampleModalCenter'  :'exampleModalCenter' + user.id}"--%>
                                     id="exampleModalCenter${user.id}"
                                     tabindex="-1" role="dialog"
                                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form:form action="/saveUser" method="post" modelAttribute="Users">
                                                    <%--        kiểm tra xem có id không để cập nhật--%>
                                                    <form:hidden path="id" placeholder="Enter name"/>
                                                    <div class="form-group">
                                                        <label for="name">Name</label>
                                                        <form:input type="text" class="form-control" path="name"
                                                                    placeholder="Enter name" value="${user.name}"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="email">Email</label>
                                                        <form:input type="email" class="form-control" path="email"
                                                                    placeholder="Enter email" value="${user.email}"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="address">Address</label>
                                                        <form:input type="text" class="form-control" path="address"
                                                                    placeholder="Enter address"
                                                                    value="${user.address}"/>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-dismiss="modal">Close
                                                        </button>
                                                        <button type="submit" class="btn btn-primary">Update</button>
                                                    </div>
                                                </form:form>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>


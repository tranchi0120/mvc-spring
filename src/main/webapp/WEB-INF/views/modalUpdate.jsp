<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 123456
  Date: 12/24/2023
  Time: 1:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>

<form:form action="updateUserData" method="post" modelAttribute="update" name="formAdd">
    <form:hidden path="id" placeholder="Enter name"/>
    <div class="form-group">
        <label>Name</label>
        <form:input type="text" class="form-control name" path="name"
                    placeholder="Enter name" value="${user.name}"/>
    </div>
    <div class="form-group">
        <label>Email</label>
        <form:input type="email" class="form-control email" path="email"
                    placeholder="Enter email" value="${user.email}"/>
    </div>
    <div class="form-group">
        <label>Address</label>
        <form:input type="text" class="form-control address" path="address"
                    placeholder="Enter address" value="${user.address}"
        />
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary"
                data-dismiss="modal">Close
        </button>
        <button type="submit" class="btn btn-success">Save
        </button>
    </div>
</form:form>


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

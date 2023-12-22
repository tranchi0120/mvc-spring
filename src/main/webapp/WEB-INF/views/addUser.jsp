<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <link rel="stylesheet" href="../styles/style.css" />
</head>
<body>
<div class="container">
    <form:form action="/saveUser" method="post" >
        <div class="form-group">
            <label for="name">Name</label>
            <form:input type="text" class="form-control" path="name" placeholder="Enter name" />
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <form:input type="email" class="form-control" path="email" placeholder="Enter email" />
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <form:input type="text" class="form-control" path="address" placeholder="Enter address" />
        </div>
        <button type="submit" class="btn btn-primary">Add</button>
    </form:form>
</div>
</body>
</html>

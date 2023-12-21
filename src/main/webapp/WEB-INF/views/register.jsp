<%--<%@ taglib prefix="core" uri="http://www.springframework.org/tags" %>--%>

<%--
  Created by IntelliJ IDEA.
  User: MinhMaiMot
  Date: 8/15/2023
  Time: 2:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<section class="vh-100 bg-image"
         style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body p-5">
                            <h2 class="text-uppercase text-center mb-5">Create an account</h2>

                            <form   action='/register' method="POST">

                                <div class="form-outline mb-4">
                                    <input type="text" id="userName"  name="userName" class="form-control form-control-lg" />
                                    <label class="form-label" for=userName>Your Name</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="email" id="form3Example3cg" class="form-control form-control-lg" name="gmail" />
                                    <label class="form-label" for="form3Example3cg">Your Email</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="text" id="form3Example4cdga" class="form-control form-control-lg" name="phoneNumber" />
                                    <label class="form-label" for="form3Example4cdga">Số điện thoại</label>
                                </div>
                                <div class="form-outline mb-4">
                                    <input type="text"  class="form-control form-control-lg" name="address" />
                                    <label class="form-label" for="form3Example4cdga">Địa chỉ</label>
                                </div>
                                <div class="form-outline mb-4">
                                    <input type="password" id="form3Example4cg" class="form-control form-control-lg" name="passWord"/>
                                    <label class="form-label" for="form3Example4cg">Password</label>
                                </div>

                                <div class="d-flex justify-content-center">
                                    <input type="submit"
                                           class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</input>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>

</html>
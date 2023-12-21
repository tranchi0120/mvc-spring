<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>


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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='<core:url value="/resources/static/css/user.css"/>' />
    <script src="/templates/js/user.js"></script>
</head>

<script>
    $(document).ready(function(){
        // Activate tooltip
        $('[data-toggle="tooltip"]').tooltip();

        // Select/Deselect checkboxes
        var checkbox = $('table tbody input[type="checkbox"]');
        $("#selectAll").click(function(){
            if(this.checked){
                checkbox.each(function(){
                    this.checked = true;
                });
            } else{
                checkbox.each(function(){
                    this.checked = false;
                });
            }
        });
        checkbox.click(function(){
            if(!this.checked){
                $("#selectAll").prop("checked", false);
            }
        });
    });
     // editUser
    function editUser(userId) {

        $.ajax({
            url: `/listUser/` + userId,
            type: 'GET',
            success: function(response) {
                console.log(response)
                // Xử lý phản hồi từ máy chủ
                // Ví dụ: hiển thị thông tin người dùng trong một modal
                    showModal(response);
            },
            error: function(error) {
                console.log(error)
            }
        });
        console.log(userId);


    }
    function showModal(userData) {
        console.log(userData)
        // Hiển thị thông tin người dùng trong modal
        var userModal = $('#editEmployeeModal');
        // Hiển thị modal
        userModal.show();
        // Cập nhật các phần tử trong modal với dữ liệu người dùng
        userModal.find('.userName').val(userData.userName)
        userModal.find('.gmail').text(userData.gmail);
        // Các phần tử khác tương ứng với dữ liệu người dùng


    }
    // delete
    function deleteUser(userId){
        var href = window.location.href
        var newHref = href + "/delete/" +  userId
        window.location.href = newHref
    }
</script>
<body>
<div class="container">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-xs-6">
                        <h2>Manage <b>Employees</b></h2>
                    </div>
                    <div class="col-xs-6">
                        <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%-- Lặp qua danh sách người dùng và hiển thị thông tin --%>
                <core:forEach var="user" items="${listUser.content}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.userName}</td>
                        <td>${user.gmail}</td>
                        <td>${user.address}</td>
                        <td>${user.phoneNumber}</td>
                        <td>
                            <a  href="#editEmployeeModal${user.id}" class="edit" data-toggle="modal"   >
                                <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>

                            <a href='<core:url value='/listUser/delete/${user.id }'/>' class="delete" data-toggle="modal" ><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                    </tr>

                    <!-- Edit Modal HTML -->
                    <div id="editEmployeeModal${user.id}" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/listUser/${user.id}" method="post">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Edit Employee</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input  type="text" class="form-control " value='${user.userName}' required name="userName">
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control " name="gmail" value='${user.gmail}'  required>
                                        </div>
                                        <div class="form-group">
                                            <label>Address</label>
                                            <input class="form-control" required value='${user.address}' name="address">
                                        </div>
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <input type="text" class="form-control" value='${user.phoneNumber}' name="phoneNumber" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                        <input type="submit" class="btn btn-info" value="Save">
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </core:forEach>
                </tbody>
            </table>
            <div>
                <a  href="${pageContext.request.contextPath}/user?page=0">First</a>
                <core:if test="${listUser.number > 0}">
                    <a href="${pageContext.request.contextPath}/user?page=${listUser.number - 1}">Previous</a>
                </core:if>
                <a href="${pageContext.request.contextPath}/user?page=${listUser.number + 1}">Next</a>
            </div>

        </div>
    </div>
    <!-- add Modal HTML -->
    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <h4 class="modal-title">Add Employee</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <textarea class="form-control" required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Phone</label>
                            <input type="text" class="form-control" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Add">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Edit Modal HTML -->
</div>

</body>

</html>
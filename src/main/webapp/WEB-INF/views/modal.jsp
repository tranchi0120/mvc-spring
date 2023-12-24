<%--
  Created by IntelliJ IDEA.
  User: 123456
  Date: 12/23/2023
  Time: 1:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--model--%>
<div class="modal fade"
     id="exampleModalCenter"
     tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">CREATE NEW USER</h5>

            </div>
            <div class="modal-body">
                <form:form action="saveUser" method="post" modelAttribute="user" name="formAdd">
                    <%--        kiểm tra xem có id không để cập nhật--%>
                    <form:hidden path="id" placeholder="Enter name"/>
                    <div class="form-group">
                        <label>Name</label>
                        <form:input type="text" class="form-control name" path="name"
                                    placeholder="Enter name"/>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <form:input type="email" class="form-control email" path="email"
                                    placeholder="Enter email"/>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <form:input type="text" class="form-control address" path="address"
                                    placeholder="Enter address"
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
            </div>


        </div>
    </div>
</div>

</body>
</html>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<%--model update--%>

<div class="modalUpdate fade"
     id="exampleModalUpdate${getUser.id}"
         tabindex="-1" role="dialog"
         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">

                <div class="modal-body">
                    <%--@elvariable id="users" type=""--%>
                    <form:form action="updateUser" method="POST" modelAttribute="getUser" name="formAdd">
                        <form:hidden path="id" placeholder="Enter name"/>
                        <div class="form-group">
                            <label>Name</label>
                            <form:input type="text" class="form-control name" path="name"
                                        placeholder="Enter name" value="${getUser.name}"/>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <form:input type="text" class="form-control name" path="email"
                                        placeholder="Enter email" value="${getUser.email}"/>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <form:input type="text" class="form-control address" path="address"
                                        placeholder="Enter address" value="${getUser.address}"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                    data-dismiss="modal">Close
                            </button>
                            <button type="submit" class="btn btn-success">Update
                            </button>
                        </div>
                    </form:form>
                </div>

            </div>
        </div>
    </div>



</body>
</html>

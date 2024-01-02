$(document).ready(function () {
    function disPlayUserList(users) {
        var userListElement = $("#listUser");
        userListElement.empty()

        if (users.length === 0) {
            userListElement.append("<p>No users found<p>")
        } else {
            var table = $("<table>");
            var headerRow = $("<tr>").append("<th>ID<th><th>Name<th><th>Email<th>")

            table.append(headerRow);

            $.each(users, (index, user) => {
                var row = $("<tr>").append("<td>" + user.id + "</td><td>" + user.name + "</td><td>" + user.email + "</td><td>" + user.address + "</td>");
                table.append(row)
            })

            userListElement.append(table);
        }
    }

    $.ajax({
        url: "http://localhost:8080/users",
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
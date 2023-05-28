<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width-device-width, initial-scale=1.0">
    <title>User Management</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap"
          rel="stylesheet">
    <!--added a cdn link by searching font awesome4 cdn and getting this link from https://www.bootstrapcdn.com/fontawesome/ this url*/-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            text-align: center;
        }

        h1 {
            color: #ff523b;
        }

        th {
            text-align: center;
        }

        table {
            border: 2px solid #ff523b;
            margin-top: 15px;
            margin-bottom: 20px;
        }

        td {
            border: 2px solid #ff523b;
        }

        tr:nth-child(even) {
            background-color: #f1f1f1;
        }

        .ava {
            padding: 0;
            margin: auto;
        }
    </style>
</head>
<body>
<!--<div class ="header">-->
<jsp:include page="header.jsp"/>
<!--</div>-->

<h1>User Management</h1>
<div style="width: 95%; margin:  auto">
    <form style="width: 200px; display: inline-flex;">
        <input type="text" id="searchInput" placeholder="Keyword" style="margin-right: 5px;" oninput="searchUsers()">
        <button class="btn" type="button" onclick="searchUsers()"
                style="display: flex; align-items: center; justify-content: center; border: none; width: 30px;">
            <i class="fa fa-search"></i>
        </button>
    </form>

    <table cellpadding="5" align="center" width="95%">
        <tr>
            <th>Avatar</th>
            <th>ID</th>
            <th>Username</th>
            <th>Password</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Role</th>
            <th>Full Name</th>
            <th>Birthday</th>
            <th>Created At</th>
            <th>Status</th>
            <th colspan="2" style="text-align: center">Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td class="ava"><img src="${user.avatar_path}" style="margin: 0; width:100%; height: 80px;"
                                     alt="avatar"></td>
                <td>${user.user_id}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>${user.phone}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                <td>${user.full_name}</td>
                <td>${user.birthday}</td>
                <td>${user.created_at}</td>
                <td>${user.status}</td>
                <td>
                    <form action="#" method="post" class="edit-form">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="${user.user_id}">
                        <button class="btn edit" type="button">Edit</button>
                    </form>
                </td>
                <td>
                    <form action="#" method="post" class="delete-form">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="${user.user_id}">
                        <button class="btn delete" type="button"
                                onclick="return confirm('Are you sure you want to delete this user?')">Delete
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<!----------------------------------footer------------------------------------->
<jsp:include page="footer.jsp"/>


<!-----------------------------------js for toggle menu-------------------------------------->
<script>
    var menuItems = document.getElementById("MenuItems");

    MenuItems.style.maxHeight = "0px";

    function menutoggle() {
        if (MenuItems.style.maxHeight == "0px") {
            MenuItems.style.maxHeight = "200px";
        } else {
            MenuItems.style.maxHeight = "0px";
        }
    }
</script>

<script>
    function searchUsers() {
        var keyword = document.getElementById('searchInput').value.toLowerCase();
        var rows = document.getElementsByTagName('tr');

        for (var i = 1; i < rows.length; i++) {
            var rowData = rows[i].getElementsByTagName('td');
            var match = false;

            for (var j = 0; j < rowData.length; j++) {
                var cellData = rowData[j].innerText.toLowerCase();

                if (cellData.includes(keyword)) {
                    match = true;
                    break;
                }
            }

            if (match) {
                rows[i].style.display = '';
            } else {
                rows[i].style.display = 'none';
            }
        }
    }
</script>


</body>
</html>
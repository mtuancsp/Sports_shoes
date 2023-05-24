<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>User Management Application</title>
  <style>
    body {
      text-align: center;
    }

    .btn {
      background-color: #f2f2f2;
      border: 1px solid #ccc;
      text-decoration: none;
      padding: 1px 2px 1px 2px;
    }
    .edit {
      color: blue;
    }
    .edit:hover {
      background-color: blue;
      color: white;
      cursor: pointer;
    }
    .delete-form {
      margin: 0;
      padding: 0;
    }
    .delete {
      color: red;
      font-size: 16px;
      font-family: "Times New Roman", serif;
    }
    .delete:hover {
      background-color: red;
      color: white;
      cursor: pointer;
    }
    td {
      padding: 3px;
    }

  </style>
</head>
<body>
<h1>User Management</h1>
<div>
  <h2><a href="/users">List of Users</a></h2>
  <h2><label for="search">Search customer</label></h2>
  <form method="post">
    <input type="text" id="search" name="search" value="${keyword}" placeholder="Keyword" oninput="submit()">
    <input type="submit" value="Search">
  </form>
  <table border="1" cellpadding="5" align="center">
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Country</th>
      <th colspan="2">Actions</th>
    </tr>
    <c:forEach var="user" items="${listUser}">
      <tr>
        <td>${user.username}</td>
        <td>
          <a class="btn edit" href="/users?action=edit&id=${user.user_id}">Edit</a>
        </td>
        <td>
          <form action="/users" method="post" class="delete-form">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="id" value="${user.user_id}">
            <button class="btn delete" type="submit" onclick="return confirm('Are you sure you want to delete this user?')">Delete</button>
          </form>

        </td>
      </tr>
    </c:forEach>
  </table>
</div>

<h2><a href="/users?action=create">Add New User</a></h2>

<script>
  window.onload = function () {
    let input = document.getElementById('search');
    input.focus();
    input.setSelectionRange(input.value.length, input.value.length);
  }
</script>

</body>
</html>
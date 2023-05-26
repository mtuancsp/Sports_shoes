<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="test">List All Users</a>
    </h2>
</center>
<div align="center">
    <form method="post" action="/test">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New User</h2>
            </caption>
            <tr>
                <th>User Name:</th>
                <td>
                    <input type="text" name="username" id="username" size="45"/>
                </td>
            </tr>
            <tr>
                <th>User password:</th>
                <td>
                    <input type="text" name="password" id="password" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td>
                    <input type="text" name="phone" id="phone" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" id="email" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Full name:</th>
                <td>
                    <input type="text" name="full_name" id="full_name" size="15"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input  type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
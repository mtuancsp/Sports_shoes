<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form method="post" action="login.jsp">
    <input type="text" id="username" name="username " value="Username"><br><br>
    <input type="password" id="password" name="password" value="Password"><br><br>
    <input type="submit" value="Login"><br>
    <a href="/view/index.jsp">Forgot password</a>
</form>
</body>
</html>

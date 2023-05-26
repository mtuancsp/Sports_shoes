<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Register</title>
</head>
<body>
<form method="post" action="register.jsp">
  <input type="text" id="username" name="username " value="username"><br><br>
  <input type="text" id="email" name="email " value="email"><br><br>
  <input type="text" id="phone" name="phone " value="phone"><br><br>
  <input type="text" id="full_name" name="full_name " value="full name"><br><br>
  <input type="password" id="password" name="password" value="password"><br><br>
  <input type="submit" value="Register"><br>
</form>
</body>
</html>

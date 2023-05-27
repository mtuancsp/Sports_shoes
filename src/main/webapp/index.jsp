<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>JSP - Hello World</title>
  <style>
    body {
      font-family: 'Helvetica Neue', sans-serif;
      text-align: center;
      color: #333;
      background-color: #f1f1f1;
      margin: 0;
      padding: 0;
    }

    a {
      color: #007bff;
      text-decoration: none;
    }

    a:hover {
      color: #0056b3;
    }
    header {
      background-color: blue;
      padding: 20px;
      text-align: center;
    }

    h1 {
      font-size: 48px;
      color: #fff;
      margin: 0;
    }

    .container {
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }

    .container a {
      color: blue;
      font-size: 30px;
    }

    footer {
      background-color: blue;
      color: #fff;
      padding: 10px;
      text-align: center;
      position: fixed;
      bottom: 0;
      width: 100%;
    }

  </style>
</head>
<body>
<header>
  <h1>Hello World!</h1>
</header>
<div class="container">
  <a href="/view/index.jsp">Case study Module 3 - Team 2</a><br><br>
  <a href="/test">Test</a>
</div>
<footer>
  &copy; 2023 - CodeGym
</footer>
</body>
</html>
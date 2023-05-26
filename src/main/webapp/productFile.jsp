<%--
  Created by IntelliJ IDEA.
  User: ngoct
  Date: 5/26/2023
  Time: 5:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="POST" action="product" enctype="multipart/form-data">
  <label for="filePath">File path:</label>
  <input type="text" id="filePath" name="filePath" />
  <button type="submit">Import</button>
</form>
</body>
</html>

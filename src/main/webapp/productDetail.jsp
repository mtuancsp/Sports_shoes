<%--
  Created by IntelliJ IDEA.
  User: ngoct
  Date: 5/25/2023
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Thông tin sản phẩm</h3>
<table>
    <tr>
        <th>ID</th>
        <td>${product.id}</td>
    </tr>
    <tr>
        <th>Tên sản phẩm</th>
        <td>${product.name}</td>
    </tr>
    <tr>
        <th>Giá bán</th>
        <td>${product.price}</td>
    </tr>
    <tr>
        <th>Mô tả sản phẩm</th>
        <td>${product.description}</td>
    </tr>
</table>

</body>
</html>

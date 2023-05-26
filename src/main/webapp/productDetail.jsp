<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h2>Danh sách sản phẩm</h2>
<form action="${pageContext.request.contextPath}/search" method="get">
    Từ khóa tìm kiếm:<input type="text" name="keyword" value="${empty param.keyword ? '' : param.keyword}">
    <br>
    Giá tối thiểu: <input type="number" name="minPrice" value="${empty param.minPrice ? '' : param.minPrice}">
    <br>
    Giá tối đa: <input type="number" name="maxPrice" value="${empty param.maxPrice ? '' : param.maxPrice}">
    <br>
    <input type="submit" value="Tìm kiếm">
</form>
<hr>
<c:if test="${not empty productList}">
    <table>
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Giá bán</th>
            <th>Mô tả sản phẩm</th>
        </tr>
        <c:forEach items="${productList}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.description}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>

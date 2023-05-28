<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ngoct
  Date: 5/27/2023
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Giỏ Hàng</title>
</head>
<body>
<h1>Giỏ hàng</h1>
<table border="1">
  <thead>
  <tr>
    <th>Sản phẩm</th>
    <th>Đơn giá</th>
    <th>Số lượng</th>
    <th>Thành tiền</th>
    <th>Tác vụ</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="cartItem" items="${cartItems}">
    <tr>
      <td>${cartItem.product.name}</td>
      <td><fmt:formatNumber value="${cartItem.product.price}" type="currency"/></td>
      <td>
        <form action="${pageContext.request.contextPath}/cart" method="post">
          <input type="hidden" name="action" value="update_cart">
          <input type="hidden" name="cartItemId" value="${cartItem.id}">
          <input type="number" name="quantity" value="${cartItem.quantity}" min="1">
          &nbsp;<input type="submit" value="update">
        </form>
      </td>
      <td>${cartItem.product.price * cartItem.quantity}</td>
      <td>
        <form action="${pageContext.request.contextPath}/cart" method="post">
          <input type="hidden" name="action" value="delete_cart">
          <input type="hidden" name="cartItemId" value="${cartItem.id}">
          <input type="submit" value="Xóa">
        </form>
      </td>
    </tr>
  </c:forEach>
  </tbody>
  <tfoot>
  <tr>
    <td colspan="3" align="right"><strong>Tổng tiền:</strong></td>
    <td><strong><fmt:formatNumber value="${totalPrice}" type="currency"/></strong></td>
    <td></td>
  </tr>
  </tfoot>
</table>
<br>
<form action="${pageContext.request.contextPath}/cart" method="post">
  <input type="hidden" name="action" value="Xóa tất cả sản phẩm khỏi giỏ hàng">
  <input type="submit" value="Xóa tất cả sản phẩm khỏi giỏ hàng">
</form>
</body>
</html>

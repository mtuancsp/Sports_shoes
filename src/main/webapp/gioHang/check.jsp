<%@ page import="model.Cart" %><%--
  Created by IntelliJ IDEA.
  User: ngoct
  Date: 5/27/2023
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  HttpSession session1 = request.getSession();
  Cart cart = (Cart) session.getAttribute("cart");
%>
<html>
<head>
    <title>Thanh toan</title>
</head>
<body>
<%--<h1>Thanh toán</h1>--%>
<%--<table>--%>
<%--  <thead>--%>
<%--  <tr>--%>
<%--    <th>Mã sản phẩm</th>--%>
<%--    <th>Tên sản phẩm</th>--%>
<%--    <th>Giá tiền</th>--%>
<%--    <th>Số lượng</th>--%>
<%--    <th>Tổng cộng</th>--%>
<%--  </tr>--%>
<%--  thead>--%>
<%--  <tbody>--%>
<%--  <% for (CartItem item : cart.getItems()) { %>--%>
<%--  <tr>--%>
<%--    <td><%= item.getProduct().getProductId() %></td>--%>
<%--    <td><%= item.getProduct().getProductName() %></td>--%>
<%--    <td><%= item.getProduct().getPrice() %></td>--%>
<%--    <td><%= item.getQuantity() %></td>--%>
<%--    <td><%= item.getTotal() %></td>--%>
<%--  </tr>--%>
<%--  <% } %>--%>
<%--  </tbody>--%>
<%--  <tfoot>--%>
<%--  <tr>--%>
<%--    <td colspan="4">Tổng cộng:</td>--%>
<%--    <td><%= cart.getTotal() %></td>--%>
<%--  </tr>--%>
<%--  </tfoot>--%>
<%--</table>--%>
<%--<form action="OrderServlet" method="post">--%>
<%--  <label for="name">Họ tên:</label>--%>
<%--  <input type="text" name="name" required><br>--%>
<%--  <label for="email">Email:</label>--%>
<%--  <input type="email" name="email" required><br>--%>
<%--  <label for="phone">Số điện thoại:</label>--%>
<%--  <input type="tel" name="phone"/>--%>
<%--</form>--%>
</body>
</html>

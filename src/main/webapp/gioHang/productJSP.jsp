<%@ page import="java.util.List" %>
<%@ page import="model.Products" %>
<%@ page import="controller.ProductServlet" %>
<%@ page import="dao.cart.ProductServiceDao" %>
<%@ page import="controller.CartServlet" %>
<%@ page import="dao.ProductDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%%>
<html>
<head>
    <title>List Product </title>
</head>
<body>
<h1>List Product</h1>
<%--<table>--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>product_id</th>--%>
<%--        <th>product_name</th>--%>
<%--        <th>price</th>--%>
<%--        <th>quantity_in_stock</th>--%>
<%--        <th>add cart</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <% for(Products products: productsList) {%>--%>
<%--    <tr>--%>
<%--        <td><%=products.getProduct_id()%></td>--%>
<%--        <td><%=products.getProduct_name()%></td>--%>
<%--        <td><%=products.getPrice()%></td>--%>
<%--        <td><%=products.getQuantity_in_stock()%></td>--%>
<%--        <td><a href="CartServlet/action = add & product_id = <%= products.getProduct_id()%>">add cart</a></td>--%>
<%--    </tr>--%>
<%--    <% } %>--%>
<%--    </tbody>--%>
<%--</table>--%>
</body>
</html>

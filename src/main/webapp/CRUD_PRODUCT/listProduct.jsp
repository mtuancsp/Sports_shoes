<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Product Application</title>
</head>
<body>
<center>
  <h1>Product</h1>
  <h2>
  <a href="/products?action=create">Add new product</a>
  </h2>
</center>
<div align="center">
  <table border="1" cellpadding="5">
    <caption><h2>List of product</h2></caption>
    <tr>
      <th>ProductID</th>
      <th>ProductName</th>
      <th>Price</th>
      <th>Description</th>
      <th>Supplier</th>
      <th>Category</th>
      <th>QuantityInStock</th>
      <th>CreatedAt</th>
      <th>image</th>
      <th>Action</th>
    </tr>
    <c:forEach var="product" items="productList">
      <tr>
        <td><c:out value="${product.product_id}"/></td>
        <td><c:out value="${product.product_name}"/></td>
        <td><c:out value="${product.price}"/></td>
        <td><c:out value="${product.description}"/></td>
        <td><c:out value="${product.supplier}"/></td>
        <td><c:out value="${product.category}"/></td>
        <td><c:out value="${product.quantity_in_stock}"/></td>
        <td><c:out value="${product.created_at}"/></td>
        <td><c:out value="${product.image}"/></td>
        <td>
          <a href="/products?action = edit & id = ${product.product_id}">Edit</a>
          <a href="/products?action = delete & id = ${product.product_id}">Delete</a>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>

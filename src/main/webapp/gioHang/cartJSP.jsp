<%@ page import="model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

%>
<html>
<head>
    <title>Cart</title>
</head>
<body>
<h1>Cart</h1>
<table>
    <thead>
    <tr>
        <th>product_id</th>
        <th>product_name</th>
        <th>price</th>
        <th>quantity_in_stock</th>
        <th>total</th>
        <th>update</th>
        <th>delete</th>
    </tr>
    </thead>
    <tbody>
    <% for (CartItem item : cart.getItems()) { %>
    <tr>
        <td><%= item.getProduct().getProductId() %></td>
        <td><%= item.getProduct().getProductName() %></td>
        <td><%= item.getProduct().getPrice() %></td>
        <td>
            <form action="CartServlet?action=update" method="post">
                <input type="hidden" name="product_id" value="<%= item.getProduct().getProductId() %>">
                <input type="text" name="quantity" value="<%= item.getQuantity() %>">
                <button type="submit">Cập nhật</button>
            </form>
        </td>
        <td><%= item.getTotal() %></td>
        <td><a href="CartServlet?action=remove&product_id=<%= item.getProduct().getProductId() %>">Xóa</a></td>
    </tr>
    <% } %>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="4">Tổng cộng:</                <td><%= cart.getTotal() %></td>
        <td colspan="2">
            <form action="CheckoutServlet" method="post">
                <button type="submit">Thanh toán</button>
            </form>
        </td>
    </tr>
    </tfoot>
</table>
</body>
</html>

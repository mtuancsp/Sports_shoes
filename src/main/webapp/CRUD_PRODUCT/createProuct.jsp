<%--
  Created by IntelliJ IDEA.
  User: ngoct
  Date: 5/27/2023
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
</head>
<body>
<center>
    <h1>Product</h1>
    <h2 href="products?action = products ">List All Product</h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add new product</h2>
            </caption>
            <tr>
                <th>ProductName</th>
                <td>
                    <input type="text" name="productName" id="productName" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Price</th>
                <td>
                    <input type="number" name="price" id="price" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Description</th>
                <td>
                    <input type="text" name="description" id="description" size="45"/>
                </td>
            </tr>
            <tr>
                <th>SupplierID</th>
                <td>
                    <input type="number" name="supplierID" id="supplierID" size="45"/>
                </td>
            </tr>
            <tr>
                <th>CategoryID</th>
                <td>
                    <input type="number" name="categoryID" id="categoryID" size="45"/>
                </td>
            </tr>
            <tr>
                <th>QuantityInStock</th>
                <td>
                    <input type="text" name="quantityInStock" id="quantityInStock" size="45"/>
                </td>
            </tr>
            <tr>
                <th>CreatAt</th>
                <td>
                    <input type="text" name="creatAt" id="creatAt" size="45"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="save">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>

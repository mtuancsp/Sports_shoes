<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ngoct
  Date: 5/27/2023
  Time: 3:42 PM
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
    <h2>
     <a href="products?action = products">List All Product</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellspacing="5">
            <caption>
                <h2>Edit Product</h2>
            </caption>
            <c:if test="${product != null}">
                <input type="hidden" name="product_id" value="<c:out value='${product.product_id}'/>"/>

            </c:if>
            <tr>
                <th>ProductName</th>
                <td>
                    <input type="text" name="productName" id="productName" size="45"
                           value="<c:out value='${product.product_name}'/>"
                    />
                </td>
            </tr>
            <tr>
                <th>Price</th>
                <td>
                    <input type="number" name="price" id="price" size="45"
                           value="<c:out value='${product.price}'/>"
                    />
                </td>
            </tr>
            <tr>
                <th>Description</th>
                <td>
                    <input type="text" name="description" id="description" size="45"
                           value="<c:out value='${product.description}'/>"
                    />
                </td>
            </tr>
            <tr>
                <th>SupplierID</th>
                <td>
                    <input type="number" name="supplierID" id="supplierID" size="45"
                           value="<c:out value='${product.supplier_id}'/>"

                    />
                </td>
            </tr>
            <tr>
                <th>CategoryID</th>
                <td>
                    <input type="number" name="categoryID" id="categoryID" size="45"
                           value="<c:out value='${product.category_id}'/>"

                    />
                </td>
            </tr>
            <tr>
                <th>QuantityInStock</th>
                <td>
                    <input type="text" name="quantityInStock" id="quantityInStock" size="45"
                           value="<c:out value='${product.quantity_in_stock}'/>"

                    />
                </td>
            </tr>
            <tr>
                <th>CreatAt</th>
                <td>
                    <input type="text" name="creatAt" id="creatAt" size="45"
                           value="<c:out value='${product.create_at}'/>"

                    />
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

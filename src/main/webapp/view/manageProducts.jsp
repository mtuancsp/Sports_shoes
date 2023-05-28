<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 27/05/2023
  Time: 8:56 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width-device-width, initial-scale=1.0">
  <title>Manage Product</title>
  <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap"
          rel="stylesheet">
    <!--added a cdn link by searching font awesome4 cdn and getting this link from https://www.bootstrapcdn.com/fontawesome/ this url*/-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 10px;
            margin-bottom: 40px;
        }

        .pagination a,
        .pagination span {
            color: #000;
            text-decoration: none;
            padding: 5px 10px;
            border: 2px solid orangered;
            margin: 0 4px;
        }

        .pagination a.active {
            background-color: orangered;
            color: white;
            border: 2px solid orangered;
        }

        .pagination a:hover:not(.active),
        .pagination span.disabled {
            background-color: #ddd;
            border: 2px solid #ddd;
        }

        .pagination .disabled {
            pointer-events: none;
            cursor: default;
        }
        .edit:hover{
            background-color: green;
        }
        .delete:hover{
            background-color: red;
            font-weight: bold;
        }
    </style>


</head>
<body>
<!--<div class ="header">-->
    <jsp:include page="header.jsp"/>
<!--</div>-->

<div class="small-container">
    <h2 class="title" style="margin-bottom: 40px"><a href="/view/crudProduct.jsp">Manage Product</a></h2>
    <div class="row">
        <c:forEach var="product" items="${productList}">
            <div class="col-4 product" style="margin-bottom: 0">
                <a href="/view/product_detail?id=${product.product_id}"><img src="${product.image}"></a>
                <a href="/view/product_detail?id=${product.product_id}"><h4>${product.product_name}</h4></a>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </div>
                <p>$${product.price}</p>
                <div>
                    <a class="btn edit" href="/view/edit?id=${product.product_id}">Edit</a>
                    <a class="btn delete" href="/view/delete?id=${product.product_id}">Delete</a>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="pagination">
        <c:choose>
            <c:when test="${currentPage > 1}">
                <a href="/view/manageProducts?page=${currentPage - 1}">&laquo; Previous</a>
            </c:when>
            <c:otherwise>
                <span class="disabled">&laquo; Previous</span>
            </c:otherwise>
        </c:choose>

        <c:forEach var="pageNumber" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${pageNumber == currentPage}">
                    <a class="active" href="/view/manageProducts?page=${pageNumber}">${pageNumber}</a>
                </c:when>
                <c:otherwise>
                    <a href="/view/manageProducts?page=${pageNumber}">${pageNumber}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${currentPage < totalPages}">
                <a href="/view/manageProducts?page=${currentPage + 1}">Next &raquo;</a>
            </c:when>
            <c:otherwise>
                <span class="disabled">Next &raquo;</span>
            </c:otherwise>
        </c:choose>
    </div>
</div>




<!----------------------------------footer------------------------------------->
<jsp:include page="footer.jsp"/>


<!-----------------------------------js for toggle menu-------------------------------------->
<script>
    var menuItems = document.getElementById("MenuItems");

    MenuItems.style.maxHeight = "0px";

    function menutoggle() {
        if (MenuItems.style.maxHeight == "0px") {
            MenuItems.style.maxHeight = "200px";
        } else {
            MenuItems.style.maxHeight = "0px";
        }
    }
</script>

<!-----------------------------------js for toggle form-------------------------------------->
</body>
</html>

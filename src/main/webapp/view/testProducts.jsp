<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Products" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width-device-width, initial-scale=1.0">
    <title>All Products - Redstore</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap"
          rel="stylesheet">
    <!--added a cdn link by searching font awesome4 cdn and getting this link from https://www.bootstrapcdn.com/fontawesome/ this url*/-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .show-more-btn {
            background-color: #ff523b;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 0;
            cursor: pointer;
            border-radius: 20px;
        }

        #endMessage {
            display: none;
            text-align: center;
            margin-top: 0;
            color: #777;
        }
    </style>


</head>
<body>
<!--<div class ="header">-->
<jsp:include page="header.jsp" />
<!--</div>-->


<div class="small-container">
    <div class="row row-2" style="margin-top: 50px">
        <h2>All Products</h2>
        <select onchange="sortProducts(this.value)">
            <option value="default">Default sorting</option>
            <option value="name">Sort by name</option>
            <option value="price">Sort by price ascending </option>
            <option value="price-desc">Sort by price descending</option>
        </select>
    </div>

    <div class="row">
        <%
            List<Products> productList = (List<Products>) request.getAttribute("productList");
            String sortOption = request.getParameter("sort");
            if (sortOption == null) {
                sortOption = "default";
            }
            switch (sortOption) {
                case "name":
                    productList.sort((p1, p2) -> p1.getProduct_name().compareToIgnoreCase(p2.getProduct_name()));
                    break;
                case "price":
                    productList.sort(Comparator.comparingInt(Products::getPrice));
                    break;
                case "price-desc":
                    productList.sort(Comparator.comparingInt(Products::getPrice).reversed());
                    break;
                case "default":
                    productList.sort(Comparator.comparingInt(Products::getProduct_id));
                    break;
            }
        %>

        <c:forEach var="product" items="${productList}" varStatus="loop">
            <div class="col-4 product" style="display: ${loop.index < 4 ? 'block' : 'none'};">
                <a href="/view/product_detail?id=${product.product_id}"><img src="${product.image}"></a>
                <a href="/view/product_detail?id=${product.product_id}"><h4>${product.product_name}</h4></a>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-half-o" ></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>$${product.price}</p>
            </div>
        </c:forEach>
    </div>
</div>

<div id="endMessage" style="display: none; text-align: center">
    <p>Đã hiển thị toàn bộ sản phẩm</p>
</div>

<div class="page-btn" style="text-align: center">
        <button class="show-more-btn" onclick="showNextProducts()">Show More</button>
</div>

<!----------------------------------footer------------------------------------->
<jsp:include page="footer.jsp" />

<!-----------------------------------js for toggle menu----------------------------------------------->
<script>

    function menutoggle() {
        var menuItems = document.getElementById("MenuItems");
        MenuItems.style.maxHeight = "0px";
        if (MenuItems.style.maxHeight == "0px") {
            MenuItems.style.maxHeight = "200px";
        } else {
            MenuItems.style.maxHeight = "0px";
        }
    }

    function sortProducts(option) {
        let currentURL = new URL(window.location.href);
        let sortParam = (option === "default") ? "" : option;

        // Lưu giá trị của lựa chọn sắp xếp vào Local Storage
        localStorage.setItem("sortOption", sortParam);

        currentURL.searchParams.set("sort", sortParam);
        window.location.href = currentURL.href;
    }

    // Khôi phục lựa chọn sắp xếp sau khi trang được tải lại
    document.addEventListener("DOMContentLoaded", function() {
        let sortOption = localStorage.getItem("sortOption");
        if (sortOption) {
            let selectElement = document.querySelector('select');
            selectElement.value = sortOption;
        }
    });
</script>
<script>
    function showNextProducts() {
        let products = document.getElementsByClassName("product");
        let visibleCount = 0;

        for (let i = 0; i < products.length; i++) {
            if (products[i].style.display === "none") {
                products[i].style.display = "block";
                visibleCount++;
                if (visibleCount === 4) {
                    break;
                }
            }
            if (i === products.length - 1) {
                let messageElement = document.getElementById("endMessage");
                if (messageElement) {
                    messageElement.style.display = "block";
                }
            }
        }
    }

</script>

</body>
</html>

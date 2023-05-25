<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script>
        function showNextProducts() {
            var products = document.getElementsByClassName("product");
            var visibleCount = 0;
            var lastProductIndex = -1;

            for (var i = 0; i < products.length; i++) {
                if (products[i].style.display === "none") {
                    products[i].style.display = "block";
                    visibleCount++;
                    if (visibleCount === 4) {
                        break;
                    }
                }

                if (products[i].style.display === "block") {
                    lastProductIndex = i;
                }
            }

            if (lastProductIndex === products.length - 1) {
                var messageElement = document.getElementById("endMessage");
                if (messageElement) {
                    messageElement.style.display = "block";
                }
            }
        }

    </script>

</head>
<body>
<!--<div class ="header">-->
<div class="container">
    <div class="navbar">
        <div class="logo">
            <a href="index.jsp"><img src="images/logo.png" width="125px"></a>
        </div>
        <nav>
            <ul id="MenuItems">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="products.jsp">Products</a></li>
                <li><a href="">About</a></li>
                <li><a href="">Contact</a></li>
                <li><a href="account.jsp">Account</a></li>

            </ul>
        </nav>
        <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px"></a>
        <img src="images/menu.png" class="menu-icon" onClick="menutoggle()">
    </div>

</div>
<!--</div>-->


<div class="small-container">
    <div class="row row-2" style="margin-top: 50px">
        <h2>All Products</h2>
        <select>
            <option>Default sorting</option>
            <option>Short by price</option>
            <option>Short by popularity</option>
            <option>Short by rating</option>
            <option>Short by sale</option>
        </select>
    </div>

    <div class="row">
        <c:forEach var="product" items="${productList}" varStatus="loop">
            <div class="col-4 product" style="display: ${loop.index < 4 ? 'block' : 'none'};">
                <a href="products-details.jsp"><img src="${product.image}"></a>
                <a href="products-details.jsp"><h4>${product.product_name}</h4></a>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>${product.price}</p>
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
<div class="footer">
    <div class="container">

        <div class="row">
            <div class="footer-col-1">
                <h3>Download Our App</h3>
                <p>Download App for Android and ios mobile phone.</p>
                <div class="app-logo">
                    <img src="images/play-store.png" alt="">
                    <img src="images/app-store.png" alt="">
                </div>
            </div>
            <div class="footer-col-2">
                <img src="images/logo-white.png">
                <p>Our Purpose Is To Sustainably Make the Pleasure and Benefits of Sports Accessible to the Many.</p>
            </div>
            <div class="footer-col-3">
                <h3>Useful Links</h3>
                <ul>
                    <li>Coupons</li>
                    <li>Blog Post</li>
                    <li>Return Policy</li>
                    <li>Join Affiliate</li>
                </ul>
            </div>
            <div class="footer-col-4">
                <h3>Follow us</h3>
                <ul>
                    <li>Facebook</li>
                    <li>Twitter</li>
                    <li>Instagram</li>
                    <li>Youtube</li>
                </ul>
            </div>

        </div>

        <hr><!--horizontal line-->
        <p class="copyright">Copyright 2021 - Apurba Kr. Pramanik</p>

    </div>
</div>


<!-----------------------------------js for toggle menu----------------------------------------------->
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
</body>
</html>
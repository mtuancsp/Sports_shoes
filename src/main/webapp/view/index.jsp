<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Redstore | Ecommerce website</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width-device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap"
          rel="stylesheet">
    <!--added a cdn link by searching font awesome4 cdn and getting this link from https://www.bootstrapcdn.com/fontawesome/ this url*/-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            background: radial-gradient(#fff, #ffd6d6);
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<video muted="muted" loop="true" autoplay="true" width="100%" height="" src="./images/banner_video.mp4"></video>
<div class="container">
    <div class="row">
        <div class="col-2">
            <h1>Give your Workout <br>A New Style!</h1>
            <p>Success isn't always about greatness. It's about consistency. Consistent<br>hard work gains success.
                Greatness will come.</p>
            <a href="products.jsp" class="btn">Explore Now &#8594;</a>
        </div>
        <div class="col-2">
            <img src="images/image1.png">
        </div>
    </div>
</div>

<!------------------------------ featured categories------------------------------>
<div class="categories">
    <div class="small-container">
        <div class="row">
            <div class="col-3">
                <img src="images/category-1.jpg">
            </div>
            <div class="col-3">
                <img src="images/category-2.jpg">
            </div>
            <div class="col-3">
                <img src="images/category-3%20(2).jpg">
            </div>
        </div>
    </div>
</div>

<!------------------------------ featured Products------------------------------>
<div class="small-container">
    <h2 class="title">Featured Products</h2>
    <div class="row">
        <c:forEach var="product" items="${featuredProductList}">
            <div class="col-4 product">
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
            </div>
        </c:forEach>
    </div>


    <!--new row for the latest product-->
    <h2 class="title">Latest Products</h2>
    <div class="row">
        <c:forEach var="product" items="${productList}" begin="0" end="7">
            <div class="col-4 product">
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

<!--------------------------`   offer   --------------------------------->
<div class="offer">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <img src="images/image1.png" class="offer-img">
            </div>
            <div class="col-2">
                <p>Exclusively Available on RedStore</p>
                <h1>Sports Shoes</h1>
                <small> Buy latest collections of sports shoes online on Redstore at best prices from top brands such as
                    Adidas, Nike, Puma, Asics, and Sparx at your leisure at best prices. </small><br>
                <a href="products.jsp" class="btn">Buy Now &#8594;</a>
            </div>
        </div>
    </div>
</div>


<!------------------------------Testimonial---------------------------------->
<div class="testimonial">
    <div class="small-container">
        <div class="row">
            <div class="col-3">
                <i class="fa fa-quote-left"></i>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                    industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type
                    and scrambled it to make a type specimen book. </p>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <img src="images/user-1.png">
                <h3>Sean Parkar</h3>
            </div>
            <div class="col-3">
                <i class="fa fa-quote-left"></i>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when
                    looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal
                    distribution of letters, as opposed to using 'Content here, content here', making it look like
                    readable English.</p>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <img src="images/user-2.png">
                <h3>Mike Smith</h3>
            </div>
            <div class="col-3">
                <i class="fa fa-quote-left"></i>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                    industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type
                    and scrambled it to make a type specimen book. </p>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <img src="images/user-3.png">
                <h3>Mabel Joe</h3>
            </div>
        </div>
    </div>
</div>

<!----------------------------------Brands------------------------------------>
<div class="brands">
    <div class="small-container">
        <div class="row">
            <div class="col-5">
                <img src="images/logo-godrej.png" alt="">
            </div>
            <div class="col-5">
                <img src="images/logo-oppo.png" alt="">
            </div>
            <div class="col-5">
                <img src="images/logo-coca-cola.png" alt="">
            </div>
            <div class="col-5">
                <img src="images/logo-paypal.png" alt="">
            </div>
            <div class="col-5">
                <img src="images/logo-philips.png" alt="">
            </div>
        </div>
    </div>
</div>


<!----------------------------------footer------------------------------------->
<jsp:include page="footer.jsp" />
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

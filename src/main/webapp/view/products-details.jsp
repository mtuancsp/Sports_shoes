<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Products" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">
        <title>All Products - Redstore</title>
        <link rel="stylesheet" href="style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
        <!--added a cdn link by searching font awesome4 cdn and getting this link from https://www.bootstrapcdn.com/fontawesome/ this url*/-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <!--<div class ="header">-->
        <jsp:include page="header.jsp" />
    <!--</div>-->
    
        
        <!------------------------------ Single product details------------------------------>
        <div class="small-container single-product">
            <%
            Products product = (Products) request.getAttribute("product");
            %>
            
            <!--<h2 class="title" >Featured Products</h2>-->
            <div class="row">
                    <div class="col-2">
                        <img src="${product.image}" width="100%" id="productImg">

                        <div class="small-img-row">
                            <c:forEach items="${productImgList}" var="image">
                            <div class="small-img-col">
                                <img src="${image}" alt="" width="100%" class="small-img">
                            </div>
                            </c:forEach>
                        </div>

                    </div>
                
                    <div class="col-2">
                        <h1>${product.getProduct_name()}</h1>
                        <p>${product.category}</p>
                        <h4>$${product.price}</h4>
                        <select>
                            <option>Select Size</option>
                            <option>6<!--Small (s)--></option>
                            <option>7<!--Medium (M)--></option>
                            <option>8<!--Large (L)--></option>
                            <option>9<!--XL--></option>
                            <option>10<!--XXL--></option>
                        </select>
                        <p>Stock: ${product.getQuantity_in_stock()}</p>
                        <input type="number" value="1" min="1">
                        <a href="cart.jsp" class="btn">Add to Cart</a>
                        <h3>Product Description <i class="fa fa-indent" ></i></h3>
                        <br>
                        <p>${product.description}</p>
                    </div>
                </div>
            </div>
        
        
        <!----------------------------------Title------------------------------------->
        <div class="small-container">
            <div class="row row-2">
                <h2>Related Products</h2>
                <a href="products.jsp"><p>View More</p></a>
            </div>
        </div>
                
        <!----------------------------------products------------------------------------->
        <div class="small-container">
             <div class="row">
                 <c:forEach items="${relatedProductList}" var="product">
                     <div class="col-4">
                        <a href="/view/product_detail?id=${product.product_id}"><img src="${product.image}" alt="img"></a>
                        <a href="/view/product_detail?id=${product.product_id}"><h4>${product.getProduct_name()}</h4></a>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-half-o" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p>$${product.price}</p>
                    </div>
                 </c:forEach>
                </div>
        </div>

        <!----------------------------------footer------------------------------------->
        <jsp:include page="footer.jsp" />
        
        
        <!-----------------------------------js for toggle menu----------------------------------------------->
        <script>
            var menuItems=document.getElementById("MenuItems");
            
            MenuItems.style.maxHeight="0px";
            function menutoggle(){
                if(MenuItems.style.maxHeight == "0px"){
                    MenuItems.style.maxHeight="200px";
                }
                else{
                    MenuItems.style.maxHeight="0px";
                }
            }
        </script>
        
        <!-----------------------js for product gallery-------------------->
        
        <script>
            var productImg=document.getElementById("productImg");
            var smallImg=document.getElementsByClassName("small-img");
            
            smallImg[0].onclick=function(){
                productImg.src=smallImg[0].src;
            }
             smallImg[1].onclick=function(){
                productImg.src=smallImg[1].src;
            }
              smallImg[2].onclick=function(){
                productImg.src=smallImg[2].src;
            }
               smallImg[3].onclick=function(){
                productImg.src=smallImg[3].src;
            }
            
            
        </script>
    </body>
</html>
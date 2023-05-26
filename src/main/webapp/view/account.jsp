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
    
        
        <!------------------------------ account-page details------------------------------>

        <div class="account-page">
            <div class="container">
                <div class="row">
                    <div class="col-2">
                        <img src="images/image1.png" width="100%">
                    </div>
                    <div class="col-2">
                        <div class="form-container">
                            <div class="form-btn">
                                <span onclick="login()">Register</span>
                                <span onclick="register()">Login</span>
                                <hr id="Indicator">
                            </div>
                            <form id="LoginForm"  style="top: 80px">
                                <input type="text" name="username" placeholder="Username">
                                <input type="password" name="password" placeholder="Password">
                                <input type="email" name="email" placeholder="Email">
                                <input type="text" name="phone" placeholder="Phone">

                                <button type="submit" class="btn">Register</button>
                            </form>

                            <form id="RegForm" action="login" method="post" style="top: 100px">
                                <p style="color: red" class="message">${message}</p>
                                <br>
                                <input name="username" type="text" placeholder="Username">
                                <input name="password" type="password" placeholder="Password">
                                <button type="submit" class="btn">Login</button>
                                <a href=""><p>Forgot password</p></a>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        
       
        <!----------------------------------footer------------------------------------->
        <jsp:include page="footer.jsp" />
        
        
        <!-----------------------------------js for toggle menu-------------------------------------->
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
        
                <!-----------------------------------js for toggle form-------------------------------------->
        <script>
            var LoginForm=document.getElementById("LoginForm");
            var RegForm=document.getElementById("RegForm");
            var Indicator=document.getElementById("Indicator");
            
            function register(){
                RegForm.style.transform="translateX(0px)";
                LoginForm.style.transform="translateX(0px)";
                Indicator.style.transform="translateX(100px)"
            }
            function login(){
                RegForm.style.transform="translateX(300px)";
                LoginForm.style.transform="translateX(300px)";
                Indicator.style.transform="translateX(0px)";
            }
        </script>

    </body>
</html>
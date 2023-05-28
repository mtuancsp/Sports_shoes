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
    <style>
        .abc {
            margin: 50px auto 100px;
        }

        #contact div {
            height: 60px;
            width: 300px;
        }
        #contact input {
            background-color: #ffaf96;
        }
        .map_container {
            width: 450px;
            height: 443px;
        }
        body {
            background: radial-gradient(#fff, #ffd6d6);
            text-align: center;
            font-family: 'Poppins', sans-serif;
            color: #ff523b;
        }
        h2 {
            color: #ff523b;
            font-size: 36px;
        }
    </style>
</head>
<body>
<!--<div class ="header">-->
<jsp:include page="header.jsp" />
<!--</div>-->


<!------------------------------ cart items details------------------------------>
<h2>CodeGym - C0223G1</h2>
<h2>Team 2</h2>
<div class="container abc">
    <div class="row">
        <div class="col-md-6">
            <form id="contact" action="" style="font-size: 20px; padding: 20px; border: 2px solid #ff523b; border-radius: 10px; display: flex; flex-direction: column; align-items: center;">
                <h2 style="color: #ff523b;height: 60px;font-size: 36px">Contact Us</h2>
                <div style="height: 60px; width: 300px;">
                    <input type="text" placeholder="Name" />
                </div>
                <div style="height: 60px; width: 300px;">
                    <input type="text" placeholder="Age" />
                </div>
                <div style="height: 60px; width: 300px;">
                    <input type="email" placeholder="Email" />
                </div>
                <div style="height: 60px; width: 300px;">
                    <input type="text" placeholder="Phone" />
                </div>
                <div style="height: 60px; width: 300px;">
                    <input type="text" class="message-box" placeholder="Message" />
                </div>
                <button style="height: 40px; width: 100px; color: white;border:none; background-color: #ff523b; border-radius: 10px;">SEND</button>
            </form>
        </div>
        <div class="map_container">
            <div class="map-responsive" style="height: 444px">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.6210838701665!2d105.7660288!3d21.035710099999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454b9444c676b%3A0xe713200541b7456d!2sCodeGym!5e0!3m2!1sen!2suk!4v1622058671683!5m2!1sen!2suk" width="600" height="600" frameborder="0" style="border:0; width: 100%; height:100%"
                        allowfullscreen></iframe>
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

</body>
</html>
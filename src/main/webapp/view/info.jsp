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
    body {
      height: 100%;
    }

    .col-md-6 {
      height: 450px;
      width: 450px;
    }
    .footer {
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      padding: 20px 0;
    }
    #contact div {
      height: 60px;
      width: 300px;
    }
    #contact input {
      background-color: #ffaf96;
    }
  </style>
</head>
<body>
<!--<div class ="header">-->
<jsp:include page="header.jsp" />
<!--</div>-->


<!------------------------------ cart items details------------------------------>
<section class="contact_section layout_padding" style="margin-top: 50px">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <form id="contact" action="" style="font-size: 20px; padding: 20px; border: 2px solid #ff523b; border-radius: 10px; display: flex; flex-direction: column; align-items: center;">
          <h2 style="color: #ff523b;height: 60px;font-size: 36px">INFORMATION</h2>
          <div style="height: 60px; width: 300px;">
            <input type="text" placeholder="Full name" />
          </div>
          <div style="height: 60px; width: 300px;">
            <input type="text" placeholder="Birthday" />
          </div>
          <div style="height: 60px; width: 300px;">
            <input type="email" placeholder="Email" />
          </div>
          <div style="height: 60px; width: 300px;">
            <input type="text" placeholder="Phone" />
          </div>
          <div style="height: 60px; width: 300px;">
            <input type="text" class="message-box" placeholder="Password" />
          </div>
          <button style="height: 40px; width: 100px; color: white; background-color: #ff523b; border-radius: 10px;">update</button>
        </form>
      </div>
    </div>
  </div>
</section>


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
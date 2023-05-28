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
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
  <!--added a cdn link by searching font awesome4 cdn and getting this link from https://www.bootstrapcdn.com/fontawesome/ this url*/-->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
    body {
    }

    .col-md-6 {
        text-align: center;
    }

    #contact div {
      height: 60px;
      width: 300px;
    }
    #contact input {
      background-color: #ffaf96;
    }
    #test{
        text-align: center;
        border:3px solid #ff523b;
        width:400px;
        height:400px;
        overflow-x:hidden;
        overflow-y:auto;
        border-radius: 10px;
    }
    button {
        height: 40px; width: 100px; color: white; background-color: #ff523b; border-radius: 10px; border: none; font-size: 18px; cursor: pointer;
    }
  </style>
</head>
<body>
<!--<div class ="header">-->
<jsp:include page="header.jsp" />
<!--</div>-->

<!------------------------------ cart items details------------------------------>
<section class="contact_section layout_padding" style="margin-top: 50px; margin-bottom: 50px">
  <div></div>
  <div class="container">
    <div class="row">

        <form style="text-align: center" action="changeAvatar" method="post" enctype="multipart/form-data" onsubmit="return confirm('Are you sure you want to change the avatar?');">
            <div>
                <img id="avatar" src="${user.avatar_path}" alt="Cannot find avatar" style="height: 240px;width: 240px" /><br>
                <input type="file" name="avatar" id="avatarInput" style="display: none;">
                <button type="button" onclick="chooseFile()">Change</button>
                <button type="submit">Submit</button>
                <br>
                <p style="color: red" class="message">${message}</p>
            </div>
        </form>

        <div class="col-md-6">
          <form method="post">
          <h2 style="color: #ff523b;height: 60px;font-size: 36px">INFORMATION</h2>
              <c:if test="${user != null}">
                  <input type="hidden" name="id" value="<c:out value='${user.user_id}' />"/>
              </c:if>
          <div style="height: 60px; width: 300px;">
            <input type="text" value="<c:out value='${user.full_name}'/>" />
          </div>
          <div style="height: 60px; width: 300px;">
            <input type="text" value="<c:out value='${user.birthday}'/>" />
          </div>
          <div style="height: 60px; width: 300px;">
            <input type="email"value="<c:out value='${user.email}'/>" />
          </div>
          <div style="height: 60px; width: 300px;">
            <input type="text" value="<c:out value='${user.phone}'/>" />
          </div>
          <div style="height: 60px; width: 300px;">
            <input type="text" value="<c:out value='${user.password}'/>" />
          </div>
          <button style="">Update</button>
          </form>
      </div>

        <div id="test">
            <h2><a href="" style="color: #ff523b">Order History</a></h2>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>
            <a href="#">a</a><br>


<%--           <c:forEach items="${products}" var = "item">--%>
<%--               <p>${item.getProduct_id}</p>--%>
<%--               <p>${item.getProduct_name}</p>--%>
<%--               <p>${item.getPrice}</p>--%>
<%--               <p>${item.getDescription}</p>--%>
<%--               <p>${item.getSupplier}</p>--%>
<%--               <p>${item.getCategory}</p>--%>
<%--               <p>${item.getQuantity_in_stock}</p>--%>
<%--               <p>${item.getCreated_at}</p>--%>
<%--               <img src="${item.getImage}">--%>
<%--           </c:forEach>--%>
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

<script>
    function chooseFile() {
        document.getElementById("avatarInput").click();
    }

    document.getElementById("avatarInput").addEventListener("change", function(event) {
        var file = event.target.files[0];
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById("avatar").src = e.target.result;
        };
        reader.readAsDataURL(file);
    });
</script>

</body>
</html>
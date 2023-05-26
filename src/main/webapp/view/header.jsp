<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class ="header">
  <div class="container">
    <div class="navbar">
      <div class="logo">
        <a href="index.jsp"><img src="images/logo.png" width="125px"></a>
      </div>
      <nav>
        <ul id="MenuItems">
          <li><a href="index.jsp">Home</a></li>
          <li><a href="listProduct">Products</a></li>
          <li><a href="contact.jsp">Contact</a></li>
          <c:if test="${sessionScope.user == null}">
            <li><a href="account.jsp">Login</a></li>
          </c:if>
          <c:if test="${sessionScope.user!= null}">
            <li><a href="/logout" style="color: red;">Logout &nbsp;<img style="padding-top: 3px" src="images/logout.png" alt="exit" width="20px" height="20px"></a></li>
            <li><a style="color: red;" href=""><b>${sessionScope.user.getUsername()}</b></a></li>
          </c:if>
        </ul>
      </nav>
      <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px"></a>
      <img src="images/menu.png" class="menu-icon" onClick="menutoggle()" >
    </div>
  </div>
</div>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    nav ul li a{
        padding-bottom: 10px;
    }

</style>
<div class="header" style="position: sticky; top: 0; width: 100%; z-index: 1;">
    <div class="container">
        <div class="navbar" style="padding: 5px;">
            <div class="logo">
                <a href="view/home" style="position: relative; top: 5px"><img src="images/c02team2.png" width="120px"></a>
            </div>
            <nav>
                <ul id="MenuItems">
                    <li><a href="home">Home</a></li>
                    <li><a href="listProduct">Products</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <c:if test="${sessionScope.user == null}">
                        <li><a href="account.jsp">Login</a></li>
                    </c:if>
                    <c:if test="${sessionScope.user!= null}">
                        <li><a href="logout" style="color: red;">Logout&nbsp;<img style="padding-top: 0px"
                                                                                    src="images/logout.png" alt="exit"
                                                                                    width="20px" height="20px"></a></li>
                        <li><a style="color: red; font-weight: bold;" href="">${sessionScope.user.getUsername()}<img style="padding: 0;position: relative; top: 4px; border-radius: 50%;"
                                                                                                         src="${sessionScope.user.getAvatar_path()}" alt="ava"
                                                                                                         width="24px" height="24px"></a></li>
                    </c:if>
                </ul>
            </nav>
            <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px"></a>
            <img src="images/menu.png" class="menu-icon" onClick="menutoggle()">
        </div>
    </div>
</div>

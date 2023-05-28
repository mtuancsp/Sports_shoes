<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    .header {
        background: radial-gradient(#fff, #ffd6d6);
    }
    .dropdown {
        position: relative;
    }

    .dropdown:hover .dropdown-menu {
        display: block;
    }

    .dropdown-menu {
        display: none;
        position: absolute;
        top: 100%;
        left: 0;
        text-align: left;
    }

    .dropdown-menu li:hover {
        font-weight: bold;
    }
</style>

<div class="header" style="position: sticky; top: 0; width: 100%; z-index: 1;">
    <div class="container">
        <div class="navbar" style="padding: 5px;">
            <div class="logo">
                <a href="view/home" style="position: relative; top: 5px"><img src="images/c02team2.png" width="120px"></a>
            </div>
            <nav style="">
                <ul id="MenuItems">
                    <li><a href="home">Home</a></li>
                    <li><a href="listProduct">Products</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <c:if test="${sessionScope.user.role == 'admin'}">
                        <li class="dropdown">
                            <a href="#">Manage</a>
                            <ul class="dropdown-menu">
                                <li><a href="/view/manageProducts">Products</a></li>
                                <li><a href="#">Accounts</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.user == null}">
                        <li><a href="account.jsp">Login</a></li>
                    </c:if>
                    <c:if test="${sessionScope.user!= null}">
                        <li><a href="logout" style="color: red;">Logout&nbsp;<img style="position: relative; top: 3px;"
                                                                                    src="images/logout.png" alt="exit"
                                                                                    width="20px" height="20px"></a></li>
                        <li><a style="color: red; font-weight: bold;" href="info.jsp">${sessionScope.user.getUsername()}<img style="padding: 0;position: relative; top: 4px; border-radius: 50%;"
                                                                                                         src="${sessionScope.user.getAvatar_path()}" alt="ava"
                                                                                                         width="20px" height="20px"></a></li>

                    </c:if>
                </ul>
            </nav>
            <a href="cart"><img src="images/cart.png" width="30px" height="30px"></a>
            <img src="images/menu.png" class="menu-icon" onClick="menutoggle()">
        </div>
    </div>
</div>

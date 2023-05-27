<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

</head>
<body>
<!--<div class ="header">-->
<jsp:include page="header.jsp"/>
<!--</div>-->


<!------------------------------ cart items details------------------------------>

<div class="small-container cart-page">
    <table>
        <tr>
            <th>Product</th>
            <th>Quantity</th>
            <th>Subtotal</th>
        </tr>
        <c:forEach items="${cartItems}" var="item">
            <tr>
                <td>
                    <div class="cart-info">
                        <img src="${item.getProduct().getImage()}" alt="">
                        <div>
                            <p>${item.getProduct().getProduct_name()}</p>
                            <small class="price">$${item.getProduct().getPrice()}</small><br>
                            <a href="">Remove</a>
                        </div>
                    </div>
                </td>
                <td><input type="number" min="0" value="${item.getQuantity()}" name="quantity" class="quantity-input"></td>
                <td class="subtotal">$${item.getProduct().getPrice() * item.getQuantity()}</td>
            </tr>
        </c:forEach>
    </table>

    <div class="total-price">
        <table>
            <tr>
                <td>Subtotal</td>
                <td id="subtotal">$0</td>
            </tr>
            <tr>
                <td>Tax</td>
                <td id="tax">$0</td>
            </tr>
            <tr>
                <td>Total</td>
                <td id="total">$0</td>
            </tr>
            <tr>
                <td colspan="2"><a style="color: white; padding: 10px 20px; background-color: #ff523b; border-radius: 5px" href="">Pay</a></td>
            </tr>
        </table>
    </div>
</div>

<script>
    const quantityInputs = document.querySelectorAll('.quantity-input');
    quantityInputs.forEach(input => {
        input.addEventListener('input', updateSubtotal);
    });

    updateTotalPrice(); // Tính toán và hiển thị tổng giá ban đầu

    function updateSubtotal(event) {
        const quantityInput = event.target;
        const row = quantityInput.parentNode.parentNode;
        const priceElement = row.querySelector('.price');
        const subtotalElement = row.querySelector('.subtotal');
        const price = parseFloat(priceElement.textContent.replace("$", ""));
        const quantity = parseInt(quantityInput.value);
        const subtotal = price * quantity;

        subtotalElement.textContent = "$" + subtotal.toFixed(2);

        updateTotalPrice();
    }

    function updateTotalPrice() {
        let subtotal = 0;

        const subtotalElements = document.querySelectorAll('.subtotal');
        subtotalElements.forEach(element => {
            subtotal += parseFloat(element.textContent.replace("$", ""));
        });

        const tax = subtotal * 0.1;
        const total = subtotal + tax;

        document.getElementById('subtotal').innerHTML = "$" + subtotal.toFixed(2);
        document.getElementById('tax').textContent = "$" + tax.toFixed(2);
        document.getElementById('total').textContent = "$" + total.toFixed(2);
    }
</script>





<!----------------------------------footer------------------------------------->
<jsp:include page="footer.jsp"/>

<!-----------------------------------js for toggle menu-------------------------------------->
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
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
        <tr data-price="50.00" data-subtotal="50.00">
            <td>
                <div class="cart-info">
                    <img src="images/buy-1.jpg">
                    <div>
                        <p>Red Printed T-Shirt</p>
                        <small>Price: $50.00</small><br>
                        <a href="">Remove</a>
                    </div>
                </div>
            </td>
            <td><input type="number" min="0" value="1" oninput="updateSubtotal(this)"></td>
            <td class="sum">$50.00</td>
        </tr>
        <tr data-price="50.00" data-subtotal="50.00">
            <td>
                <div class="cart-info">
                    <img src="images/buy-2.jpg">
                    <div>
                        <p>Red Printed T-Shirt</p>
                        <small>Price: $50.00</small><br>
                        <a href="">Remove</a>
                    </div>
                </div>
            </td>
            <td><input type="number" min="0" value="1" oninput="updateSubtotal(this)"></td>
            <td class="sum">$50.00</td>
        </tr>
        <tr data-price="50.00" data-subtotal="50.00">
            <td>
                <div class="cart-info">
                    <img src="images/buy-3.jpg">
                    <div>
                        <p>Red Printed T-Shirt</p>
                        <small>Price: $50.00</small><br>
                        <a href="">Remove</a>
                    </div>
                </div>
            </td>
            <td><input type="number" min="0" value="1" oninput="updateSubtotal(this)"></td>
            <td class="sum">$50.00</td>
        </tr>
    </table>

    <div class="total-price">
        <table >
            <tr>
                <td>Subtotal</td>
                <td>$0</td>
            </tr>
            <tr>
                <td>Tax</td>
                <td>$0</td>
            </tr>
            <tr>
                <td>Total</td>
                <td>$0</td>
            </tr>
            <tr><td colspan="2"><a style="color: white; padding: 10px 20px; background-color: #ff523b; border-radius: 5px" href="">Pay</a></td></tr>
        </table>
    </div>
</div>


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

<script>
    document.addEventListener("DOMContentLoaded", function () {
        calculateTotal();
    });

    function updateSubtotal(input) {
        var row = input.parentNode.parentNode;
        var price = parseFloat(row.getAttribute("data-price"));
        var quantity = parseInt(input.value);
        var subtotal = price * quantity;

        row.setAttribute("data-subtotal", subtotal.toFixed(2));
        calculateTotal();
    }

    function calculateTotal() {
        var rows = document.querySelectorAll(".cart-page table tr[data-subtotal]");
        var subtotal = 0;

        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];
            var price = parseFloat(row.getAttribute("data-price"));
            var quantity = parseInt(row.querySelector("input[type='number']").value);
            var itemSubtotal = price * quantity;
            subtotal += itemSubtotal;

            // Cập nhật giá trị trong ô sum
            var sumElement = row.querySelector(".sum");
            sumElement.textContent = "$" + itemSubtotal.toFixed(2);
        }

        var tax = subtotal * 0.1; // Tính thuế (10% của tổng giá trị)
        var total = subtotal + tax;

        var subtotalElement = document.querySelector(".total-price table tr:first-child td:last-child");
        var taxElement = document.querySelector(".total-price table tr:nth-child(2) td:last-child");
        var totalElement = document.querySelector(".total-price table tr:nth-child(3) td:last-child");

        subtotalElement.textContent = "$" + subtotal.toFixed(2);
        taxElement.textContent = "$" + tax.toFixed(2);
        totalElement.textContent = "$" + total.toFixed(2);
    }


</script>


</body>
</html>
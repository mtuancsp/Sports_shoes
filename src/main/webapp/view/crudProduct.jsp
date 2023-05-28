<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width-device-width, initial-scale=1.0">
    <title>Product</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
    <!--added a cdn link by searching font awesome4 cdn and getting this link from https://www.bootstrapcdn.com/fontawesome/ this url*/-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .form-container {
            height: 647px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid orangered;
        }

        .form-container .left-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: orangered;
        }

        .form-container .right-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .form-container .right-container label {
        font-weight: bold;
        }

        .form-container .right-container input,
        .form-container .right-container textarea {
            width: 100%;
        }

        .form-container .actions {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

    </style>
</head>
<body>
<!--<div class ="header">-->
<jsp:include page="header.jsp" />
<!--</div>-->

<div class="form-container" style="width: auto">
    <div class="left-container">
        <img id="preview" style="max-width: 300px; max-height: 300px;">
        <br>
        <label for="image">Avatar</label>
        <input type="file" id="image" name="image" accept="image/*" onchange="displayImage(event)" required>
    </div>
    <div class="right-container">
        <form action="/view/listProduct?action=create" method="post" enctype="multipart/form-data">
            <label for="name">Product Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>

            <label for="supplier">Supplier:</label>
            <input type="text" id="supplier" name="supplier" required>

            <label for="category">Category:</label>
            <input type="text" id="category" name="category" required>

            <label for="quantity">Quantity in Stock:</label>
            <input type="number" id="quantity" name="quantity" required>

            <div class="actions">
                <button class="btn" type="submit">Add Product</button>
            </div>
        </form>
    </div>
</div>

<!----------------------------------footer------------------------------------->
<div style="padding: 0; clear: both"><jsp:include page="footer.jsp"  />
</div>


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
    function displayImage(event) {
        var preview = document.getElementById('preview');
        var file = event.target.files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
            preview.src = e.target.result;
        };

        reader.readAsDataURL(file);
    }
</script>
</body>
</html>
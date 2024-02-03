<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Smeet_BookStore.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smeet BookStore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg bg-info  fs-5 fw-bold text-dark ">
                <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                    <ul class="navbar-nav text-center">
                        <li class="nav-item mx-2">
                            <a class="nav-link" href="index.aspx">Home</a>
                        </li>
                        <li class="nav-item mx-2">
                            <a class="nav-link" href="products.aspx">Products</a>
                        </li>
                        <li class="nav-item mx-2">
                            <a class="nav-link" href="cart.aspx">Cart</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <h1>Index</h1>
        </div>
    </form>
</body>
</html>

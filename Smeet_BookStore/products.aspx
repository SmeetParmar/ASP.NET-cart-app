<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="Smeet_BookStore.products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smeet BookStore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg bg-info fs-5 fw-bold text-dark ">
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

        <div class="container my-5">
            <h1 class="text-center">Our Products</h1>
            <div class="row justify-content-center mt-4">
                <div class="col-md-6">
                    <p class="fs-4 fw-bold">
                        Genre :
                        <asp:DropDownList ID="genreName" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="genreName_SelectedIndexChanged"></asp:DropDownList>
                    </p>
                </div>
                <div class="col-md-6">
                    <p class="fs-4 fw-bold">
                        Books :
                        <asp:DropDownList ID="bookName" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="bookName_SelectedIndexChanged"></asp:DropDownList>
                    </p>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-6">
                        <asp:Label class="fs-4" ID="bookNameLable" runat="server" Text=""></asp:Label> <br />
                        <asp:Label class="fs-4 mt-3" ID="bookAuthorNameLable" runat="server" Text=""></asp:Label> <br />
                        <asp:Label class="fs-4 mt-3" ID="bookDescriptionLable" runat="server" Text=""></asp:Label> <br />
                        <asp:Label class="fs-4 mt-3" ID="bookPriceLable" runat="server" Text=""></asp:Label>
                    
                        <br />
                        
                    
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-6">
                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Add To Cart" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" class="btn btn-success ms-3" runat="server" Text="Go To Cart" OnClick="Button2_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>

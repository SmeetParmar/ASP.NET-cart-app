<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Smeet_BookStore.cart" %>

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
    <div class="container">
    <main>
        <form id="form1" runat="server" class="form-horizontal">
       
            <div class="row"><%-- row 1 --%>
                <div class="col-sm-12"><h1>Your Cart</h1></div>
                <asp:Label runat="server" ID="errorMessageCart" Text=""></asp:Label>
                <div class="col-sm-6"><%-- cart display column --%>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:ListBox ID="cartListBox" runat="server" class="form-control"></asp:ListBox></div>
                        </div>
                    </div>
                <div class="col-sm-6"><%-- cart edit buttons column --%>
                    <div class="form-group">
                        <div class="col-sm-12"><asp:Button ID="btnRemove" runat="server" 
                            Text="Remove Item" class="btn btn-warning" OnClick="btnRemove_Click" /></div> <br />
                        <div class="col-sm-12"><asp:Button ID="btnEmpty" runat="server" 
                            Text="Empty Cart" class="btn btn-danger" OnClick="btnEmpty_Click" /></div>
                    </div>
                </div>
            </div><%-- end of row 1 --%>

            <div class="row"><%-- row 2 --%>
                <div class="col-sm-12">
                    <div class="form-group"><%-- message label --%>
                        <asp:Label ID="lblMessage" runat="server" EnableViewState="False"
                            CssClass="text-info col-sm-12"></asp:Label>
                    </div>
                    <div class="form-group mt-3"><%-- buttons --%>
                        <div class="col-sm-12">
                            <asp:Button ID="btnContinue" runat="server"
                                PostBackUrl="~/products.aspx" Text="Continue Shopping" class="btn btn-success" OnClick="btnContinue_Click" />
                            <asp:Button ID="btnCheckOut" runat="server" Text="Check Out"  
                               class="btn btn-primary" OnClick="btnCheckOut_Click" />
                        </div>
                    </div>
                </div>
            </div><%-- end of row 2 --%>

        </form>
        
    </main></div>
</body>
</html>

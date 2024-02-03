<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Smeet_BookStore.checkout" %>

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
        <div>
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
        </div>  
    <form id="form2" runat="server" class="container my-5">
        <h1 class="text-center mb-4">Checkout Form</h1>

        <!-- Personal Info Section -->
        <div class="border border-1 border-dark rounded p-3">
         <h3 class="text-center my-3">Contact Information</h3>
         <div class="row mb-3">
            <div class="col">
                <label for="firstName" class="form-label">First Name</label>
                <asp:TextBox runat="server"  ID="firstName" class="form-control" />
                <asp:RequiredFieldValidator ControlToValidate="firstName" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter First Name!" CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator> <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="firstName" runat="server" ErrorMessage="First Name Contain Digits Or Special Characters!" ValidationExpression="^[A-Za-z\s]+$" CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </div>
             
            <div class="col">
                <label for="lastName" class="form-label">Last Name</label>
                <asp:TextBox runat="server" ID="lastName" class="form-control" />
                <asp:RequiredFieldValidator ControlToValidate="lastName" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Last Name!" CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator> <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="lastName" runat="server" ErrorMessage="Last Name Contain Digits Or Special Characters!" ValidationExpression="^[A-Za-z\s]+$" CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label for="mobileNumber" class="form-label">Mobile Number</label>
                <asp:TextBox runat="server" ID="mobileNumber" class="form-control" />
                <asp:RequiredFieldValidator ControlToValidate="mobileNumber" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Your Mobile Number!" CssClass="text-danger fw-bold"></asp:RequiredFieldValidator> <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="mobileNumber" runat="server" ErrorMessage="Please Enter A Valid 10 Digit Mobile Number in XXXXXXXXXX Format!" ValidationExpression="^\d{10}$" CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </div>
            <div class="col">
                <label for="email" class="form-label">Email</label>
                <asp:TextBox runat="server" ID="email" class="form-control" />
                <asp:RequiredFieldValidator ControlToValidate="email" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Your Email!" CssClass="text-danger fw-bold"></asp:RequiredFieldValidator> <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="email" runat="server" ErrorMessage="Please Enter A Valid Email!" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row mb-3">
            <h3 class="text-center my-3">Billing Address</h3>
            <div class="col">
                <label class="form-label">Address</label>
                <asp:TextBox runat="server" ID="address" class="form-control" />
                <asp:RequiredFieldValidator ControlToValidate="address" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Your Address!" CssClass="text-danger fw-bold"></asp:RequiredFieldValidator> <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="address" ValidationExpression="^\d+\s[A-Za-z]+\s[A-Za-z]+$"  runat="server" ErrorMessage="Please Enter A Valid Email!"  CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </div>
            <div class="col">
                <label class="form-label">City</label>
                <asp:TextBox runat="server" ID="city" class="form-control" />
                <asp:RequiredFieldValidator ControlToValidate="city" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Your City!" CssClass="text-danger fw-bold"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="city" ValidationExpression="^[A-Za-z\s]+$"  runat="server" ErrorMessage="Please Enter A Valid City Name!"  CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </div>
        </div>
            <div class="row mb-3">
                <div class="col">
                    <label class="form-label">Province</label>
                    <asp:TextBox runat="server" ID="province" class="form-control" />
                    <asp:RequiredFieldValidator ControlToValidate="province" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter Your Province!" CssClass="text-danger fw-bold"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="province" ValidationExpression="^[A-Za-z\s]+$"  runat="server" ErrorMessage="Please Enter A Valid Province Name!"  CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </div>
                <div class="col">
                    <label class="form-label">Country</label>
                    <asp:TextBox runat="server" ID="country" class="form-control" />
                    <asp:RequiredFieldValidator ControlToValidate="country" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Enter Your Country!" CssClass="text-danger fw-bold"></asp:RequiredFieldValidator> <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="country" ValidationExpression="^[A-Za-z\s]+$"  runat="server" ErrorMessage="Please Enter A Valid Country Name!"  CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </div>
                <div class="col">
                    <label class="form-label">Postal Code</label>
                    <asp:TextBox runat="server" ID="postalCode" class="form-control" />
                    <asp:RequiredFieldValidator ControlToValidate="postalCode" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please Enter Your Postal Code!" CssClass="text-danger fw-bold"></asp:RequiredFieldValidator> <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="postalCode" ValidationExpression="^[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d$"  runat="server" ErrorMessage="Please Enter A Valid Canadian Postal Code!"  CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </div>
            </div>
        
            <div class="row mb-3">
                <h3 class="text-center my-3">Payment Details</h3>
                <div class="col">
                    <label class="form-label">Card Number</label>
                    <asp:TextBox runat="server" ID="cardNumber" class="form-control" />
                    <asp:RequiredFieldValidator ControlToValidate="cardNumber" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please Enter Your Card Number!" CssClass="text-danger fw-bold"></asp:RequiredFieldValidator> <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ControlToValidate="cardNumber" ValidationExpression="^\d{4}-?\d{4}-?\d{4}-?\d{4}$"  runat="server" ErrorMessage="Please Enter A Valid 16 Digit Card Number!"  CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </div>
                <div class="col">
                    <label class="form-label">Card Holder Name</label>
                    <asp:TextBox runat="server" ID="cardHolderName" class="form-control" />
                    <asp:RequiredFieldValidator ControlToValidate="cardHolderName" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Please Enter Card Holder Name!" CssClass="text-danger fw-bold"></asp:RequiredFieldValidator> <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" ControlToValidate="cardHolderName" runat="server" ErrorMessage="Please Enter Valid Card Holder Name!" ValidationExpression="^[A-Za-z\s]+$" CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label class="form-label">Expiry Date</label>
                    <asp:TextBox runat="server" ID="expiryDate" class="form-control" />
                    <asp:RequiredFieldValidator ControlToValidate="expiryDate" ID="RequiredFieldValidator12" runat="server" ErrorMessage="Please Enter The Expiry Date Of Card!" CssClass="text-danger fw-bold"></asp:RequiredFieldValidator> <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" ControlToValidate="expiryDate" runat="server" ErrorMessage="Please Enter Valid Expiry Date in MM/YY Format!" ValidationExpression="^(0[1-9]|1[0-2])\/\d{2}$" CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </div>
                <div class="col">
                    <label class="form-label">CVV</label>
                    <asp:TextBox runat="server" ID="cvv" class="form-control" />
                    <asp:RequiredFieldValidator ControlToValidate="cvv" ID="RequiredFieldValidator13" runat="server" ErrorMessage="Please Enter The CVV!" CssClass="text-danger fw-bold"></asp:RequiredFieldValidator> <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator13" ControlToValidate="cvv" runat="server" ErrorMessage="Please Enter A Valid 3 Digit CVV!" ValidationExpression="^\d{3}$" CssClass="text-danger fw-bold" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </div>
            </div>
        
        <div class="mb-3">
            <asp:CheckBox runat="server" ID="termsNConditions"  />
            <label class="form-label ms-1">Agree Terms and Conditions</label>
        </div>
        
        <!-- Buttons Section -->
        <div class="mb-3 d-flex justify-content-center">
            <asp:Button runat="server" ID="btnCheckout" Text="Checkout" class="btn btn-primary" OnClick="btnCheckout_Click" />
            <asp:Button runat="server" ID="btnToCart" Text="Go To Cart" class="btn btn-danger mx-3" OnClick="btnGoToCart_Click" CausesValidation="false" />
            <asp:Button runat="server" ID="btnContinueShoping" Text="Continue Shoping" class="btn btn-success" OnClick="btnContinueShoping_Click" CausesValidation="false" />
        </div>
            </div>

    </form>
</body>
</html>
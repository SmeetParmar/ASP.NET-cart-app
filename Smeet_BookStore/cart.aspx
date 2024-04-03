<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="cart.aspx.cs" Inherits="Smeet_BookStore.cart" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">


        <form id="form1" runat="server" class="form-horizontal">
        <div class="container">
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
            </div>
        </form>
        
</asp:Content>
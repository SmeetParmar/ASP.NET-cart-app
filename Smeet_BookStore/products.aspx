<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="products.aspx.cs" Inherits="Smeet_BookStore.products" %>

      <asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <form id="form1" runat="server">
        <div class="container my-5">
            <asp:Label ID="welcomeMsg" CssClass="text-primary text-center fs-1 fw-bold" runat="server" Text="Label"></asp:Label>
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
                <div class="col">
                        <asp:Label class="fs-4" ID="bookNameLable" runat="server" Text=""></asp:Label> <br />
                        <asp:Label class="fs-4 mt-3" ID="bookAuthorNameLable" runat="server" Text=""></asp:Label> <br />
                        <asp:Label class="fs-4 mt-3" ID="bookDescriptionLable" runat="server" Text=""></asp:Label> <br />
                        <asp:Label class="fs-4 mt-3" ID="bookPriceLable" runat="server" Text=""></asp:Label><br />
                        <asp:Label class="fs-4 mt-3" ID="quan" runat="server" Text="Quantity" Visible="false"></asp:Label>
                        <asp:TextBox runat="server" ID="quantity" CssClass=" " Visible="false"></asp:TextBox>
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
    </asp:Content>

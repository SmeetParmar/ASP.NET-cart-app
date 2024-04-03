<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="login.aspx.cs" Inherits="Smeet_BookStore.login" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <form id="form1" runat="server">
        <div class="container mt-5" style="margin-bottom: 200px;">
            <div class="row justify-content-center">
                <div class="col-md-4 border border-2 p-5 border-dark">
                    <div class="text-center fs-1 fw-bold">
                        Login
                    </div>
                    <div class="form-group mt-3">
                        <label for="firstName">First Name</label>
                        <asp:TextBox runat="server" ID="firstName" CssClass="form-control border border-1 border-dark"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="firstName" ID="RequiredFieldValidator1" runat="server" CssClass="text-danger fw-bold" ErrorMessage="First name is required..."></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group mt-3">
                        <label for="lastName">Last Name</label>
                        <asp:TextBox runat="server" ID="lastName" CssClass="form-control border border-1 border-dark"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="lastName" runat="server" CssClass="text-danger fw-bold" ErrorMessage="First name is required..."></asp:RequiredFieldValidator>
                    </div>
                    <div class="text-center">
                    <asp:Button runat="server" ID="loginButton" Text="Login" CssClass="mt-5 py-1 px-3 btn btn-primary" OnClick="loginButton_Click" />
                    <asp:Button runat="server" ID="cancleButton" Text="Cancel" CssClass="mt-5 py-1 px-3 btn btn-danger" CausesValidation="false" OnClick="cancleButton_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
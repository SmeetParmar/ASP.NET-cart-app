<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="admin.aspx.cs" Inherits="Smeet_BookStore.admin" %>


<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h5>Choose Genre : 
            <asp:DropDownList CssClass="px-2 my-3 py-1" AutoPostBack="True" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="genreName" DataValueField="ID">
            </asp:DropDownList></h5>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [genre]"></asp:SqlDataSource>
            <div class="col-12">
                <asp:DataList
                    ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource2"
                    CssClass="table table-bordered text-center border border-3" ShowFooter="False">
                    <HeaderTemplate>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Author Name</th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="IdLabel" CssClass="col-xs-3" runat="server" Text='<%# Eval("Id") %>' /></td>

                            <td>
                                <asp:Label CssClass="col-xs-3" ID="bookNameLabel" runat="server" Text='<%# Eval("bookName") %>' /></td>

                            <td>
                                <asp:Label CssClass="col-xs-3" ID="bookDescriptionLabel" runat="server" Text='<%# Eval("bookDescription") %>' /></td>

                            <td>
                                <asp:Label CssClass="col-xs-3" ID="bookPriceLabel" runat="server" Text='<%# Eval("bookPrice") %>' /></td>

                            <td>
                                <asp:Label CssClass="col-xs-3" ID="authorNameLabel" runat="server" Text='<%# Eval("authorName") %>' /></td>
                        </tr>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [books] WHERE ([genreID] = @genreID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="genreID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <h3>Genre Control</h3>
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSource3" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" DataKeyNames="Id"
                            GridLines="Vertical" CssClass="text-center" Width="590px" BorderStyle="None">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="genreName" HeaderText="Name" SortExpression="genreName" />
                                <asp:CommandField ShowEditButton="True" HeaderText="Edit" ControlStyle-CssClass="text-white btn btn-info px-2"></asp:CommandField>
                                <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" ControlStyle-CssClass="text-white btn btn-danger px-2"></asp:CommandField>
                            </Columns>
                            <EditRowStyle BorderColor="Black" BorderStyle="Solid" />
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" BorderColor="Black" BorderStyle="Solid" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" ForeColor="White" Font-Bold="True" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                    </div>
                    <div class="col">
                        <h3>Add New Genre</h3>
                        <br />
                        <asp:Label CssClass="fw-bold my-2" ID="Label2" runat="server" Text="Genre Id"></asp:Label>
                        :  
                        <asp:Label ID="newLabel" runat="server" Text="ID will be generated automatically..."></asp:Label><br />
                        <asp:Label ID="Label1" CssClass="mb-2 fw-bold" runat="server" Text="Genre Name"></asp:Label>
                        : 
           
          
                        <asp:TextBox runat="server" ID="genreName" name="genreName" CssClass="form-input"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="genreValidations" ControlToValidate="genreName" ID="RequiredFieldValidator1" runat="server"
                            CssClass="text-danger fw-bold" ErrorMessage="Genre Name is required..."></asp:RequiredFieldValidator>
                        <br />
                        <asp:Button ID="btnAdd" runat="server" ValidationGroup="genreValidations" Text="Add Genre"
                            CssClass="btn btn-outline-primary my-4" OnClick="GenreAdd" />
                    </div>
                </div>

                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [genre]"
                    DeleteCommand="DELETE FROM [genre] WHERE [Id] = @Id"
                    InsertCommand="INSERT INTO [genre] ([genreName]) VALUES (@genreName)"
                    UpdateCommand="UPDATE [genre] SET [genreName] = @genreName WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="genreName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="genreName" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>


                <br />
                <br />
                <h3>Product Control</h3>
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView2" CssClass="text-center" runat="server" BackColor="White"
                            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" DataKeyNames="Id" CellPadding="3"
                            DataSourceID="SqlDataSource4" GridLines="Vertical" AllowPaging="True" AutoGenerateColumns="False" AllowSorting="True">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" SortExpression="Id" />
                                <asp:BoundField DataField="bookName" HeaderText="Name" SortExpression="bookName" />
                                <asp:BoundField DataField="bookPrice" HeaderText="Price" SortExpression="bookPrice" />
                                <asp:CommandField ShowSelectButton="True" ButtonType="Button" HeaderText="Select">
                                    <ControlStyle CssClass="btn btn-warning text-white mx-2" />
                                </asp:CommandField>
                            </Columns>
                            <FooterStyle BackColor="#000099" ForeColor="White" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#000099" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                    </div>
                    <div class="col">
                        <h3>Product Details</h3>
                        <asp:DetailsView ID="DetailsView1" CssClass="table table-bordered" runat="server" AutoGenerateRows="False"
                            DataSourceID="SqlDataSource5" Height="50px" Width="900px">
                            <Fields>
                                <asp:TemplateField HeaderText="Book ID">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="bookID"
                                            Text='<%# Bind("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:Label runat="server" ID="bookID"
                                                Text='<%# Bind("Id") %>'></asp:Label>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:Label runat="server" ID="bookID"
                                                Text='ID will be generated automatically!!!'></asp:Label>
                                        </div>
                                    </InsertItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Genre">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:DropDownList ID="DropDownList2" runat="server"
                                                DataSourceID="SqlDataSource6" SelectedValue='<%# Bind("genreID") %>' DataTextField="genreName"
                                                DataValueField="Id">
                                            </asp:DropDownList>

                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:DropDownList ID="genreID" runat="server"
                                                DataSourceID="SqlDataSource6" SelectedValue='<%# Bind("genreID") %>' DataTextField="genreName"
                                                DataValueField="Id">
                                            </asp:DropDownList>

                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblCategory"
                                            Text='<%# Bind("genreId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="bName"
                                                Text='<%# Bind("bookName") %>' MaxLength="30"
                                                CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="bookValidations" ControlToValidate="bName" ID="RequiredFieldValidator6" runat="server"
                                                CssClass="text-danger fw-bold" ErrorMessage="Book Name is required..."></asp:RequiredFieldValidator>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="bName"
                                                Text='<%# Bind("bookName") %>' MaxLength="30"
                                                CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="bookValidations" ControlToValidate="bName" ID="RequiredFieldValidator2" runat="server"
                                                CssClass="text-danger fw-bold" ErrorMessage="Book Name is required..."></asp:RequiredFieldValidator>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="bookName"
                                            Text='<%# Bind("bookName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Description">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="bDesc" TextMode="MultiLine" Rows="4"
                                                Text='<%# Bind("bookDescription") %>'
                                                CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="bookValidations" ControlToValidate="bDesc" ID="RequiredFieldValidator7" runat="server"
                                                CssClass="text-danger fw-bold" ErrorMessage="Book Description is required..."></asp:RequiredFieldValidator>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="bDesc" TextMode="MultiLine" Rows="4"
                                                Text='<%# Bind("bookDescription") %>'
                                                CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="bookValidations" ControlToValidate="bDesc" ID="RequiredFieldValidator3" runat="server"
                                                CssClass="text-danger fw-bold" ErrorMessage="Book Description is required..."></asp:RequiredFieldValidator>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="bookDesc"
                                            Text='<%# Bind("bookDescription") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Price">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="bprice"
                                                Text='<%# Bind("bookPrice") %>'
                                                CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="bookValidations" ControlToValidate="bprice" ID="RequiredFieldValidator4" runat="server"
                                                CssClass="text-danger fw-bold" ErrorMessage="Book Price is required..."></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="bookValidations" ControlToValidate="bprice" runat="server"
                                                ErrorMessage="Enter Valid Price in X.XX or XX.XX format!" ValidationExpression="^\d+(\.\d{1,2})?$"
                                                CssClass="text-danger fw-bold"></asp:RegularExpressionValidator>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="bprice"
                                                Text='<%# Bind("bookPrice") %>'
                                                CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="bookValidations" ControlToValidate="bprice" ID="RequiredFieldValidator8" runat="server"
                                                CssClass="text-danger fw-bold" ErrorMessage="Book Price is required..."></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="bookValidations" ControlToValidate="bprice" runat="server"
                                                ErrorMessage="Enter Valid Price in X.XX or XX.XX format!" ValidationExpression="^\d+(\.\d{1,2})?$"
                                                CssClass="text-danger fw-bold"></asp:RegularExpressionValidator>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="bookPrice"
                                            Text='<%# Bind("bookPrice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Author Name">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="aname"
                                                Text='<%# Bind("authorName") %>'
                                                CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="bookValidations" ControlToValidate="aname" ID="RequiredFieldValidator9" runat="server"
                                                CssClass="text-danger fw-bold" ErrorMessage="Author Name is required..."></asp:RequiredFieldValidator>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="aname"
                                                Text='<%# Bind("authorName") %>'
                                                CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="bookValidations" ControlToValidate="aname" ID="RequiredFieldValidator5" runat="server"
                                                CssClass="text-danger fw-bold" ErrorMessage="Author Name is required..."></asp:RequiredFieldValidator>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="AName"
                                            Text='<%# Bind("authorName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" ValidationGroup="bookValidations" ShowEditButton="True" ShowInsertButton="True" ButtonType="Button" HeaderText="Action">
                                    <ControlStyle CssClass="text-center btn btn-outline-primary my-2 me-3 ms-1" />
                                </asp:CommandField>
                            </Fields>
                        </asp:DetailsView>
                    </div>
                </div>

                <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM [books] WHERE [Id] = @original_Id AND [genreID] = @original_genreID AND [bookName] = @original_bookName AND [bookDescription] = @original_bookDescription AND [bookPrice] = @original_bookPrice AND [authorName] = @original_authorName"
                    InsertCommand="INSERT INTO [books] ([genreID], [bookName], [bookDescription], [bookPrice], [authorName]) VALUES (@genreID, @bookName, @bookDescription, @bookPrice, @authorName)"
                    SelectCommand="SELECT * FROM [books] WHERE ([Id] = @Id)"
                    UpdateCommand="UPDATE [books] SET [genreID] = @genreID, [bookName] = @bookName, [bookDescription] = @bookDescription, [bookPrice] = @bookPrice, [authorName] = @authorName WHERE [Id] = @original_Id AND [genreID] = @original_genreID AND [bookName] = @original_bookName AND [bookDescription] = @original_bookDescription AND [bookPrice] = @original_bookPrice AND [authorName] = @original_authorName"
                    ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">

                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_genreID" Type="Int32" />
                        <asp:Parameter Name="original_bookName" Type="String" />
                        <asp:Parameter Name="original_bookDescription" Type="String" />
                        <asp:Parameter Name="original_bookPrice" Type="Double" />
                        <asp:Parameter Name="original_authorName" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                        <asp:Parameter Name="bookName" Type="String" />
                        <asp:Parameter Name="bookDescription" Type="String" />
                        <asp:Parameter Name="bookPrice" Type="Double" />
                        <asp:Parameter Name="authorName" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView2" DefaultValue="1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="genreID" Type="Int32" />
                        <asp:Parameter Name="bookName" Type="String" />
                        <asp:Parameter Name="bookDescription" Type="String" />
                        <asp:Parameter Name="bookPrice" Type="Double" />
                        <asp:Parameter Name="authorName" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_genreID" Type="Int32" />
                        <asp:Parameter Name="original_bookName" Type="String" />
                        <asp:Parameter Name="original_bookDescription" Type="String" />
                        <asp:Parameter Name="original_bookPrice" Type="Double" />
                        <asp:Parameter Name="original_authorName" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [bookName], [bookPrice] FROM [books]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [genre]" DeleteCommand="DELETE FROM [genre] WHERE [Id] = @Id" InsertCommand="INSERT INTO [genre] ([genreName]) VALUES (@genreName)" UpdateCommand="UPDATE [genre] SET [genreName] = @genreName WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="genreName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="genreName" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <br />




            </div>
        </div>


    </form>
</asp:Content>

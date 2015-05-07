<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="favorites.aspx.cs" Inherits="BackOffice_favorites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvFavorites" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        DataKeyNames="ID" EnableModelValidation="True" 
        ForeColor="Black" GridLines="Vertical" PageSize="50" Width="100%" DataSourceID="ldsFavorites">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" InsertVisible="False" />
            <asp:BoundField DataField="ArticleID" HeaderText="ماقالە نۇمۇرى" 
                SortExpression="ArticleID" />
            <asp:BoundField DataField="UserID" HeaderText="ئەزا نۇمۇرى" 
                SortExpression="UserID" />
            <asp:BoundField DataField="AddTime" HeaderText="ۋاقتى" 
                SortExpression="AddTime" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CancelText="بىكار قىلىش" DeleteText="ئۆچۈرۈش" EditText="تەھرىرلەش" HeaderText="تەھرىرلەش" UpdateText="يېڭىلاش" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:LinqDataSource ID="ldsFavorites" runat="server" 
        ContextTypeName="LibraryDataContext" OrderBy="AddTime" TableName="Favorites" EnableDelete="True" EnableUpdate="True">
    </asp:LinqDataSource>
</asp:Content>


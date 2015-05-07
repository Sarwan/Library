<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="Articles.aspx.cs" Inherits="BackOffice_Articles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvArticles" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="cpTable" DataSourceID="odsArticles" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" PageSize="30">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
            <asp:BoundField DataField="Title" HeaderText="تېمىسى" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="ئاپتورى" SortExpression="Author" />
            <asp:BoundField DataField="Language" HeaderText="تىلى" SortExpression="Language" />
            <asp:BoundField DataField="DownCount" HeaderText="چۈشۈرۈلىشى" SortExpression="DownCount" />
            <asp:BoundField DataField="VisitCount" HeaderText="زىيارەت" SortExpression="VisitCount" />
            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="~/ArticleInfo.aspx?id={0}" HeaderText="كۆرۈش" Text="كۆرۈش" Target="_blank" />
            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="SendArticle.aspx?ArticleID={0}" HeaderText="تەھرىرلەش" Text="تەھرىرلەش" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsArticles" runat="server" SelectMethod="getAllArticles" TypeName="net.UyghurDev.Library.ArticleHelper"></asp:ObjectDataSource>
    <asp:LinqDataSource ID="ldsArticles" runat="server" ContextTypeName="LibraryDataContext" TableName="Articles" OrderBy="ID desc">
    </asp:LinqDataSource>
</asp:Content>


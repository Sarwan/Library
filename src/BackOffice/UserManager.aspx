<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="UserManager.aspx.cs" Inherits="BackOffice_UserManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvUsers" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        DataKeyNames="ID" DataSourceID="ldsUsers" EnableModelValidation="True" 
        ForeColor="Black" GridLines="Vertical" Width="100%">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" />
            <asp:BoundField DataField="Name" HeaderText="نامى" SortExpression="Name" />
            <asp:BoundField DataField="Email" HeaderText="ئېلخەت" SortExpression="Email" />
            <asp:BoundField DataField="Tel" HeaderText="تېلېفۇن نۇمۇرى" SortExpression="Tel" />
            <asp:BoundField DataField="RegisteredTime" HeaderText="تىزىملاتقان ۋاقتى" 
                SortExpression="RegisteredTime" />
            <asp:CheckBoxField DataField="Admin" HeaderText="باشقۇرغۇچى" 
                SortExpression="Admin" />
            <asp:CheckBoxField DataField="Enable" HeaderText="ئوچۇق" 
                SortExpression="Enable" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CancelText="بىكار قىلىش" DeleteText="ئۆچۈرۈش" EditText="تەھرىرلەش" UpdateText="يېڭىلاش" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:LinqDataSource ID="ldsUsers" runat="server" 
        ContextTypeName="LibraryDataContext" EnableDelete="True" EnableInsert="True" 
        EnableUpdate="True" TableName="Ezas">
    </asp:LinqDataSource>
    <hr />
    a
    
</asp:Content>


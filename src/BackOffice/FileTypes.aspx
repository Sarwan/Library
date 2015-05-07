<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="FileTypes.aspx.cs" Inherits="BackOffice_FileTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="3" DataSourceID="ldsFileTypes" EnableModelValidation="True" 
        ForeColor="Black" GridLines="Vertical" DataKeyNames="ID" CssClass="cpTable">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowEditButton="True" CancelText="بىكار قىلىش" EditText="تەھرىرلەش" UpdateText="يېڭىلاش" />
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" />
            <asp:BoundField DataField="Extension" HeaderText="كەڭەيتىلگەن نامى" 
                SortExpression="Extension" />
            <asp:BoundField DataField="MimeType" HeaderText="MimeType" 
                SortExpression="MimeType" />
            <asp:BoundField DataField="Icon" HeaderText="ئايكون" 
                SortExpression="Icon" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:LinqDataSource ID="ldsFileTypes" runat="server" 
        ContextTypeName="LibraryDataContext" EnableDelete="True" EnableInsert="True" 
        EnableUpdate="True" 
        TableName="FileTypes">
    </asp:LinqDataSource>
</asp:Content>


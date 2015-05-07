<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="classifications.aspx.cs" Inherits="BackOffice_classifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="ation" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        DataSourceID="ldfClassification" EnableModelValidation="True" ForeColor="Black" 
        GridLines="Vertical" PageSize="100" CssClass="cpTable">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="NameEn" HeaderText="ئىنگىلىزچە نامى" ReadOnly="True" 
                SortExpression="NameEn" />
            <asp:BoundField DataField="NameUy" HeaderText="ئۇيغۇرچە نامى" ReadOnly="True" 
                SortExpression="NameUy" />
            <asp:BoundField DataField="ID" HeaderText="نۇمۇرى" ReadOnly="True" 
                SortExpression="ID" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:LinqDataSource ID="ldfClassification" runat="server" 
        ContextTypeName="LibraryDataContext" Select="new (NameEn, NameUy, ID)" 
        TableName="Classifications">
    </asp:LinqDataSource>
</asp:Content>


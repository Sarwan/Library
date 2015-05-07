<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="Logs.aspx.cs" Inherits="BackOffice_Logs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvLogs" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="ID" 
        DataSourceID="ldsLogs" EnableModelValidation="True" ForeColor="Black" 
        GridLines="Vertical" PageSize="100" Width="100%">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" 
                SortExpression="UserID" />
            <asp:BoundField DataField="Message" HeaderText="Message" 
                SortExpression="Message" />
            <asp:BoundField DataField="AddDate" HeaderText="AddDate" 
                SortExpression="AddDate" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:LinqDataSource ID="ldsLogs" runat="server" 
        ContextTypeName="LibraryDataContext" OrderBy="AddDate desc" TableName="Logs">
    </asp:LinqDataSource>
</asp:Content>


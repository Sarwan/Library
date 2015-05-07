<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="RoleManager.aspx.cs" Inherits="BackOffice_RoleManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvRole" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        DataKeyNames="ID" DataSourceID="ldsRoles" EnableModelValidation="True" 
        ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" />
            <asp:BoundField DataField="PageID" HeaderText="PageID" 
                SortExpression="PageID" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" 
                SortExpression="UserID" />
            <asp:CheckBoxField DataField="Enable" HeaderText="Enable" 
                SortExpression="Enable" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:LinqDataSource ID="ldsRoles" runat="server" 
        ContextTypeName="LibraryDataContext" EnableDelete="True" EnableInsert="True" 
        EnableUpdate="True" TableName="UserRoles">
    </asp:LinqDataSource>
    <hr />
    <table>
    <tr>
    <td>ئەزا:</td>
    <td><asp:DropDownList ID="ddlUser" runat="server" DataSourceID="ldsUser" 
            DataTextField="Name" DataValueField="ID">
        </asp:DropDownList>
        <asp:LinqDataSource ID="ldsUser" runat="server" 
            ContextTypeName="LibraryDataContext" Select="new (ID, Name, Enable)" 
            TableName="Ezas" Where="Enable == @Enable">
            <whereparameters>
                <asp:Parameter DefaultValue="True" Name="Enable" Type="Boolean" />
            </whereparameters>
        </asp:LinqDataSource>
        </td>
        <td>&nbsp;بەت:</td>
    <td><asp:DropDownList ID="ddlWebPage" runat="server" DataSourceID="ldsWebPages" 
            DataTextField="PageTitle" DataValueField="ID">
        </asp:DropDownList>
        <asp:LinqDataSource ID="ldsWebPages" runat="server" 
            ContextTypeName="LibraryDataContext" Select="new (ID, PageTitle, PageFile)" 
            TableName="WebPages">
        </asp:LinqDataSource>
        </td>
        <td><asp:Button ID="btnAddRole" runat="server" onclick="btnAddRole_Click" 
                Text="Button" />
        </td>
    
    </tr>
    </table>
</asp:Content>


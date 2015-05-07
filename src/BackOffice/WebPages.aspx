<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="WebPages.aspx.cs" Inherits="BackOffice_WebPages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvWebPages" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        DataKeyNames="ID" DataSourceID="ldsWebPages" EnableModelValidation="True" 
        ForeColor="Black" GridLines="Vertical" Width="100%" PageSize="20">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" />
            <asp:BoundField DataField="PageTitle" HeaderText="بەت تېمىسى" 
                SortExpression="PageTitle" />
            <asp:BoundField DataField="PageFile" HeaderText="ھۆججەت نامى" 
                SortExpression="PageFile" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" CancelText="بىكار قىلىش" DeleteText="ئۆچۈرۈش" EditText="تەھرىرلەش" HeaderText="تەھرىرلەش" UpdateText="ئۆزگەرتىش" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:LinqDataSource ID="ldsWebPages" runat="server" 
        ContextTypeName="LibraryDataContext" EnableDelete="True" EnableInsert="True" 
        EnableUpdate="True" TableName="WebPages">
    </asp:LinqDataSource>
     <hr />
    <table>
    <tr>
    <td>بەت تېمىسى:</td>
    <td>
        <asp:TextBox ID="txtPageTitle" runat="server" ValidationGroup="AddPage"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtPageTitle" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddPage">*</asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;ھۆججەت نامى:</td>
    <td>
        <asp:TextBox ID="txtPageFileName" runat="server" ValidationGroup="AddPage"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvFileName" runat="server" ControlToValidate="txtPageFileName" ErrorMessage="RequiredFieldValidator" ValidationGroup="AddPage">*</asp:RequiredFieldValidator>
        </td>
        <td><asp:Button ID="btnAddPage" runat="server" onclick="btnAddRole_Click" 
                Text="بەت قوش" ValidationGroup="AddPage" />
        </td>
    
    </tr>
    </table>
</asp:Content>


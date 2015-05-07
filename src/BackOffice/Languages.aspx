<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="Languages.aspx.cs" Inherits="BackOffice_Languages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        DataSourceID="ldsLangs" EnableModelValidation="True" ForeColor="Black" 
        GridLines="Vertical" DataKeyNames="ID" Width="100%">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="NameEn" HeaderText="ئىنگىلىزچە نامى" SortExpression="NameEn" />
            <asp:BoundField DataField="NameUy" HeaderText="ئۇيغۇرچە نامى" SortExpression="NameUy" />
            <asp:BoundField DataField="NameNative" HeaderText="ئەسلى تىلدىكى نامى" SortExpression="NameNative" />
            <asp:BoundField DataField="IsoCode" HeaderText="IsoCode" SortExpression="IsoCode" />
            <asp:CommandField CancelText="بىكار قىلىش" EditText="تەھرىرلەش" HeaderText="تەھىرلەش" ShowEditButton="True" UpdateText="ئۆزگەرتىش" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:LinqDataSource ID="ldsLangs" runat="server" 
        ContextTypeName="LibraryDataContext" EnableDelete="True" EnableInsert="True" 
        EnableUpdate="True" OrderBy="ID" TableName="Languages">
    </asp:LinqDataSource>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="BackOffice_AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="dvEza" runat="server" AutoGenerateRows="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="3" DataKeyNames="ID" DataSourceID="ldsEza" DefaultMode="Insert" 
        EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" 
        Height="50px" oniteminserting="dvEza_ItemInserting" Width="480px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="Name" HeaderText="نامى" SortExpression="Name" />
            <asp:TemplateField HeaderText="پارول">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtPass" runat="server" Text='<%# Bind("Password") %>' TextMode="Password" ValidationGroup="pass"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPass" ErrorMessage="RequiredFieldValidator" ValidationGroup="pass">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Email" HeaderText="ئېلخەت:" 
                SortExpression="Email" />
            <asp:BoundField DataField="Tel" HeaderText="تېلېفۇن" SortExpression="Tel" />
            <asp:CheckBoxField DataField="Admin" HeaderText="باشقۇرغۇچىمۇ؟" 
                SortExpression="Admin" />
            <asp:CheckBoxField DataField="Enable" HeaderText="ئوچۇقمۇ؟" 
                SortExpression="Enable" />
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" CancelText="بىكار قىلىش" InsertText="قوشۇش">
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
        </Fields>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:LinqDataSource ID="ldsEza" runat="server" 
        ContextTypeName="LibraryDataContext" TableName="Ezas" EnableInsert="True">
    </asp:LinqDataSource>
</asp:Content>


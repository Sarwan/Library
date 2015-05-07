<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="BackOffice_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 480px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="auto-style1">
        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="ChangePass" />
            </td>
        </tr>
        <tr>
            <td>ئەزا:</td>
            <td>
                <asp:DropDownList ID="ddlEza" runat="server" DataSourceID="ldsEza" DataTextField="Name" DataValueField="ID">
                </asp:DropDownList>
                <asp:LinqDataSource ID="ldsEza" runat="server" ContextTypeName="LibraryDataContext" Select="new (ID, Name)" TableName="Ezas">
                </asp:LinqDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>يېڭى پارول:</td>
            <td>
                <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" ValidationGroup="ChagePass"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvNewPass" runat="server" ControlToValidate="txtNewPass" ErrorMessage="يېڭى پارولنى كىرگۈزۈڭ" ValidationGroup="ChagePass">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>يېڭى پارول(قايتا):</td>
            <td>
                <asp:TextBox ID="txtNewPassR" runat="server" TextMode="Password" ValidationGroup="ChagePass"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="rfvNewPassR" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtNewPassR" ErrorMessage="ئىككى پارول ئوخشاش ئەمەس" ValidationGroup="ChagePass">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnChangePass" runat="server" OnClick="btnChangePass_Click" Text="ئۆزگەرتىش" ValidationGroup="ChagePass" />
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="بىكار قىلىش" />
            </td>
        </tr>
    </table>
</asp:Content>


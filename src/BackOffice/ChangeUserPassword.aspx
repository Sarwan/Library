<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="ChangeUserPassword.aspx.cs" Inherits="BackOffice_ChangeUserPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 480px;
            margin-left:auto;
            margin-right:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <table class="auto-style1">
        <tr>
            <td>كونا پارول:</td>
            <td>
                <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password" ValidationGroup="ChangePass" Width="220px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvOldPass" runat="server" ControlToValidate="txtOldPass" ErrorMessage="RequiredFieldValidator" ValidationGroup="ChangePass">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>يېڭى پارول:</td>
            <td>
                <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" ValidationGroup="ChangePass" Width="220px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNewPass" runat="server" ControlToValidate="txtNewPass" ErrorMessage="RequiredFieldValidator" ValidationGroup="ChangePass">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>يېڭى پارول تەكرار:</td>
            <td>
                <asp:TextBox ID="txtNewPassR" runat="server" TextMode="Password" ValidationGroup="ChangePass" Width="220px"></asp:TextBox>
                <asp:CompareValidator ID="cvOldPassR" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtNewPassR" ErrorMessage="CompareValidator" ValidationGroup="ChangePass">*</asp:CompareValidator>
                <asp:RequiredFieldValidator ID="rfvNewPassR" runat="server" ControlToValidate="txtNewPassR" ErrorMessage="RequiredFieldValidator" ValidationGroup="ChangePass">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                <asp:Button ID="btnChangePass" runat="server" Text="ئۆزگەرتىش" ValidationGroup="ChangePass" OnClick="btnChangePass_Click" />
&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" Text="بىكار قىلىش" ValidationGroup="ChangePass" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
    </div>
</asp:Content>


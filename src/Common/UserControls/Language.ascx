<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Language.ascx.cs" Inherits="Common_UserControls_Language" %>
<table>
    <tr>
        <td>تىل تاللاڭ:</td>
        <td>
            <asp:DropDownList ID="ddlLang" runat="server" DataSourceID="ldsLang" DataTextField="NameEn" DataValueField="ID"></asp:DropDownList>
            <asp:LinqDataSource ID="ldsLang" runat="server" ContextTypeName="LibraryDataContext" Select="new (ID, NameEn, NameUy, NameNative, IsoCode)" TableName="Languages">
            </asp:LinqDataSource>
        </td>
    </tr>
</table>

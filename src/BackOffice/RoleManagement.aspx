<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="RoleManagement.aspx.cs" Inherits="BackOffice_RoleManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 200px;
        }
        .style3
        {
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="lblTitle" runat="server" Text="ھوقۇق بىكىتىش" CssClass="Title"></asp:Label>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Text="ئەزالار:"></asp:Label>
                <asp:DropDownList ID="ddlUser" runat="server" DataSourceID="ldsUser" 
                    DataTextField="Name" DataValueField="ID" AutoPostBack="True" 
                    onselectedindexchanged="ddlUser_SelectedIndexChanged" 
                    ondatabound="ddlUser_DataBound">
                </asp:DropDownList>
                <asp:LinqDataSource ID="ldsUser" runat="server" 
                    ContextTypeName="LibraryDataContext" 
                    TableName="Ezas" Where="Admin == @Admin">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="True" Name="Admin" Type="Boolean" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
            <td class="style3"></td><td></td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                <asp:Label ID="Label2" runat="server" Text="بارلىق بەتلەر:"></asp:Label><br />
                <asp:ListBox ID="lbAllPAges" runat="server" DataSourceID="ldsPages" 
                    DataTextField="PageTitle" DataValueField="ID" Height="480px" Width="320px"></asp:ListBox>
                <asp:LinqDataSource ID="ldsPages" runat="server" 
                    ContextTypeName="LibraryDataContext" 
                    TableName="WebPages">
                </asp:LinqDataSource>
            </td>
            <td style="text-align: center" class="style3">
                <asp:Button ID="btnAdd" runat="server" Text="قوشۇش&gt;&gt;" 
                    onclick="btnAdd_Click" />
                <br />
                <asp:Button ID="btnRemove" runat="server" Text="&lt;&lt;چىقىرۋىتىش" 
                    onclick="btnRemove_Click" />
            </td>
            <td valign="top">
                <asp:Label ID="Label3" runat="server" 
                    Text="نۆۋەتتىكى ئەزا زىيارەت قىلالايدىغان بەتلەر:"></asp:Label><br />
                <asp:ListBox ID="lbUserPages" runat="server" Height="480px" Width="320px"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
   
</asp:Content>


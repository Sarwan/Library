<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Replys.ascx.cs" Inherits="Common_UserControls_Replys" %>
<div id="Replays">

    <h2>ئىنكاسلار:</h2>
        <asp:DataList ID="dlReplays" runat="server" CellPadding="4" DataKeyField="ID" DataMember="DefaultView" DataSourceID="ldsReplays" ForeColor="#333333" Width="100%">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#EFF3FB" />
            <ItemTemplate>
                <asp:Label ID="UserIDLabel" runat="server" Text='<%# getUserName(Convert.ToInt32(Eval("UserID")))%>' />
                :&nbsp;<asp:Label ID="TitleLabel" runat="server" Font-Bold="True" Text='<%# Eval("Title") %>' />
                
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="ReplayContentLabel" runat="server" Text='<%#  replaceBr( Eval("ReplayContent").ToString()) %>' />
                <br />
                &nbsp;<asp:Label ID="ReplayDateLabel" runat="server" Text='<%# string.Format("{0:d -M -yyyy}", Eval("ReplayDate")) %>' />

                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
        <asp:LinqDataSource ID="ldsReplays" runat="server" ContextTypeName="LibraryDataContext"  OrderBy="ID desc" TableName="Replays" Where="Enable == @Enable &amp;&amp; Deleted == @Deleted &amp;&amp; ArticleID == @ArticleID1">
            <WhereParameters>
                <asp:Parameter DefaultValue="True" Name="Enable" Type="Boolean" />
                <asp:Parameter DefaultValue="False" Name="Deleted" Type="Boolean" />
                <asp:ControlParameter ControlID="hfArticleID" DefaultValue="0" Name="ArticleID1" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <div id="ReplayIt">
        <h2>ئىنكاس يېزىش</h2>
<table>
    <tr>
        <td>تېمىسى:</td>
        <td>
            <asp:TextBox ID="txtReplayTitle" runat="server" Width="480px" ValidationGroup="Replay"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvReplayTitle" runat="server" ControlToValidate="txtReplayTitle" ErrorMessage="RequiredFieldValidator" ValidationGroup="Replay">*</asp:RequiredFieldValidator>
        </td>
    </tr>
        <tr>
        <td>مەزمۇنى:</td>
        <td>
            <asp:TextBox ID="txtReplayContent" runat="server" Height="200px" TextMode="MultiLine" Width="480px" ValidationGroup="Replay"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvReplayContent" runat="server" ControlToValidate="txtReplayContent" ErrorMessage="RequiredFieldValidator" ValidationGroup="Replay">*</asp:RequiredFieldValidator>
            </td>
    </tr>
        <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="btnSendReplay" runat="server" OnClick="btnSendReplay_Click" Text="يوللاش" ValidationGroup="Replay" CssClass="SideSearchButton" />
            </td>
    </tr>
</table>
    </div>
<asp:HiddenField ID="hfArticleID" runat="server" Value="0" />

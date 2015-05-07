<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="Replay.aspx.cs" Inherits="BackOffice_Replay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CheckBox ID="cbUnValidated" runat="server" Text="تەستىقلانمىغانلىرى" />
<hr />
    <asp:GridView ID="gvReplaies" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        DataKeyNames="ID" DataSourceID="ldsReplay" EnableModelValidation="True" 
        ForeColor="Black" GridLines="Vertical" OnRowCommand="gvReplaies_RowCommand">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowEditButton="True" CancelText="بىكار قىلىش" EditText="تەھرىر" HeaderText="تەھرىرلەش" UpdateText="يېڭىلاش" />
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" />
            <asp:HyperLinkField DataNavigateUrlFields="ArticleID" DataNavigateUrlFormatString="~/ArticleInfo.aspx?id={0}" HeaderText="ماقالە" Text="ماقالە" />
            <asp:TemplateField HeaderText="مەزمۇن">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                    <br />
                    <asp:TextBox ID="TextBox2" runat="server" Height="83px" Width="333px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Font-Italic="True" Text='<%# Eval("ReplayDate", "{0:t}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Bind("Title") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ReplayContent") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Font-Italic="True" Text='<%# Eval("ReplayDate", "{0:t}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserID" HeaderText="ئەزا" 
                SortExpression="UserID" />
            <asp:TemplateField HeaderText="ھالىتى">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Deleted") %>' Text="ئۆچۈرۈلگەن" />
                    <br />
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Enable") %>' Text="ئوچۇق" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Deleted") %>'  Enabled="False" Text="ئۆچۈرۈلگەن" />
                    <br />
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Enable") %>' Enabled="False" Text="ئوچۇق" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField ButtonType="Button" CommandName="confrim" HeaderText="تەستىقلاش" Text="تەستىقلاش" />
            <asp:ButtonField ButtonType="Button" CommandName="delete" HeaderText="ئۆچۈرۈش" Text="ئۆچۈرۈش" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:LinqDataSource ID="ldsReplay" runat="server" 
        ContextTypeName="LibraryDataContext" EnableDelete="True" EnableUpdate="True" 
        TableName="Replays">
    </asp:LinqDataSource>
</asp:Content>


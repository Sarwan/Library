<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="ArticlesManager.aspx.cs" Inherits="BackOffice_ArticlesManager" %>

<%@ Register Src="~/Common/UserControls/Catalog.ascx" TagPrefix="uc1" TagName="Catalog" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Catalog runat="server" ID="Catalog" />
    <asp:Button ID="btnCatalog" runat="server" OnClick="btnCatalog_Click" Text="سۈزۈش" />
    <asp:HiddenField ID="hfClassification" runat="server" Value="0" />
    <br />
    <asp:GridView ID="gvArticles" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" DataKeyNames="ID" DataSourceID="ldsArticles" EnableModelValidation="True" ForeColor="Black" Width="100%" CellSpacing="2" OnDataBinding="gvArticles_DataBinding" PageSize="30">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="تېمىسى">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# getTitle(Convert.ToInt32( Eval("ID")))  %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تىلى">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# (Eval("Language1") as Language).NameUy %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Source" HeaderText="مەنبەسى" SortExpression="Source" />
            <asp:TemplateField HeaderText="تاللاش">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Enable") %>' Text="ئوچۇق" />
                    <br />
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Deleted") %>' Text="ئۆچۈرۈش" />
                    <br />
                    <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Recommend") %>' Text="تەۋىسسىيە" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Enable") %>' Enabled="False" Text="ئوچۇق" />
                    <br />
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Deleted") %>' Enabled="False" Text="ئۆچۈرۈش" />
                    <br />
                    <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Recommend") %>' Enabled="False" Text="تەۋىسسىيە" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ساناق">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Enabled="False" Text='<%# Eval("DownCount", "چۈشۈرلىشى: {0}") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" Enabled="False" Text='<%# Eval("VisitCount", "زىيارەت: {0}") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" Enabled="False" Text='<%# Eval("ReadCount", "ئوقۇلىشى: {0}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="AddTime" HeaderText="ۋاقتى" SortExpression="AddTime" DataFormatString="{0:d}" ReadOnly="True" />
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" HeaderText="تەھرىرلەش" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:LinqDataSource ID="ldsArticles" runat="server" ContextTypeName="LibraryDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="ID desc" TableName="Articles" Where="Classification == @Classification1">
        <WhereParameters>
            <asp:ControlParameter ControlID="hfClassification" DefaultValue="0" Name="Classification1" PropertyName="Value" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>


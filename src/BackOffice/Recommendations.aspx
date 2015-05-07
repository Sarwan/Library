<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="Recommendations.aspx.cs" Inherits="BackOffice_Recommendations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvArticles" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" DataKeyNames="ID" DataSourceID="ldsRecommendation" EnableModelValidation="True" ForeColor="Black" Width="100%" CellSpacing="2" PageSize="30">
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
                    <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Enable") %>' Enabled="False" Text="ئوچۇق" />
                    <br />
                    <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("Deleted") %>' Enabled="False" Text="ئۆچۈرۈش" />
                    <br />
                    <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Bind("Recommend") %>' Enabled="False" Text="تەۋىسسىيە" />
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
    <asp:LinqDataSource ID="ldsRecommendation" runat="server" ContextTypeName="LibraryDataContext" EnableDelete="True" EnableUpdate="True" OrderBy="ID desc" TableName="Articles" Where="Recommend == @Recommend &amp;&amp; Enable == @Enable &amp;&amp; Deleted == @Deleted">
        <WhereParameters>
            <asp:Parameter DefaultValue="True" Name="Recommend" Type="Boolean" />
            <asp:Parameter DefaultValue="True" Name="Enable" Type="Boolean" />
            <asp:Parameter DefaultValue="False" Name="Deleted" Type="Boolean" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>


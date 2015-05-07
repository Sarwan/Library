<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="ArticleInfo.aspx.cs" Inherits="ArticleInfo" %>

<%@ Register Src="~/Common/UserControls/Replys.ascx" TagPrefix="uc1" TagName="Replys" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="ArticlePageHeader">

        <asp:Label ID="lblTitle" runat="server" Font-Size="Medium"></asp:Label>

    </div>
    <div id="ArticlePageBody">
        <table width="100%" >
            <tr>
                <td width="100px" >

                     <asp:Image ID="imgThumb" runat="server" Height="128px" ImageUrl="~/_images/pdfIcon.png" Width="128px" />
                </td>
                <td style="vertical-align:top;">
                           <table cellpadding="0" cellspacing="0" class="ReplayHr" width="100%">
                            <tr>
                                <td >
                                    <asp:Label ID="lblAuthorLabel" runat="server" Text="ئاپتورى:" Font-Bold="True"></asp:Label>
                                    <asp:Label ID="lblAuthors" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCategory" runat="server" Text="سەھىپە:" Font-Bold="True"></asp:Label>
                                    <asp:Literal ID="ltrlCategory" runat="server"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblAbstractionLabel" runat="server" Text="قىسقىچە مەزمۇنى:" Font-Bold="True"></asp:Label>
                                    <asp:Label ID="lblAbstraction" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblKeywordLabel" runat="server" Text="ئاچقۇچلۇق سۆزلەر:" Font-Bold="True"></asp:Label>
                                    <asp:Literal ID="ltrlKeyWords" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </table>

                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:GridView ID="gvFiles" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="odsFiles" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" Width="100%" ShowHeader="False">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:ImageField DataImageUrlField="Icon" ControlStyle-Width="64px" ControlStyle-Height="64px" DataImageUrlFormatString="~/_images/filetypes/{0}">
                    <ItemStyle />
<ControlStyle Height="64px" Width="64px"></ControlStyle>
                </asp:ImageField>
                <asp:TemplateField HeaderText="Down">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Download.aspx?id="+ Eval("ID") %>' DataFormatString="~/Download.aspx?id={0}" ><h3 class="greenLink">چۈشۈرۈش</h3></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Read">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server"  NavigateUrl='<%# "~/Reading.aspx?id="+ Eval("ID") %>'  ><h3 class="greenLink">ئوقۇش</h3></asp:HyperLink>
                     </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="odsFiles" runat="server" SelectMethod="getFiles" TypeName="DocumentFiles">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="nArticleID" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <div id="Replys">
        <uc1:Replys runat="server" id="Replys1" />
    </div>
</asp:Content>


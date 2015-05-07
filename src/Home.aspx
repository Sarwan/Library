<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>
<%@ Register Src="~/common/usercontrols/toparticles.ascx" TagPrefix="uc" TagName="TopArticles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="_css/TopArticles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="direction:rtl; text-decoration:none;">
    <asp:Panel ID="pnlGridView" runat="server">
    <asp:GridView ID="gvSearchResult" runat="server" EnableModelValidation="True" 
        AutoGenerateColumns="False" BackColor="#F3F3F3" BorderColor="#E5E5E5" 
        CellPadding="4">
        <Columns>
            <asp:HyperLinkField HeaderText="تېما" DataNavigateUrlFields="ID" 
                DataTextField="Title" DataNavigateUrlFormatString="ArticleInfo.aspx?id={0}" Target="_blank" >
            <ItemStyle Width="60%" />
            </asp:HyperLinkField>
            <asp:BoundField HeaderText="ئاپتور" DataField="Author" >
            <ItemStyle Width="20%" />
            </asp:BoundField>
            <asp:BoundField HeaderText="تىلى" DataField="Language" >
            <ItemStyle Width="10%" />
            </asp:BoundField>
            <asp:BoundField HeaderText="چۈشۈرلىشى" DataField="DownCount" >
            <ItemStyle Width="5%" />
            </asp:BoundField>
            <asp:BoundField HeaderText="كۆرۈلۈشى" DataField="VisitCount" >
            <ItemStyle Width="5%" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    </asp:Panel>
<asp:Panel ID="pnlDefault" runat="server">
        <uc:TopArticles runat="server" ID="ucRecomendation" Title="تەۋىسسىيە ماقالىلەر" ArticleType="Recomended" />
        <uc:TopArticles runat="server" ID="ucTopVisited" Title="كۆپ كۆرۈلگەن ماقالىلەر" ArticleType="MostVisited" />
        <uc:TopArticles runat="server" ID="ucTopDownloaded" Title="كۆپ چۈشۈرۈلگەن ماقالىلەر" ArticleType="MostDownloaded" />
    <uc:TopArticles runat="server" ID="ucNewst" Title=" يېڭى ماقالىلەر" ArticleType="Newst" />
</asp:Panel>
    </div>

</asp:Content>


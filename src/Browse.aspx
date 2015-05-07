<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="Browse.aspx.cs" Inherits="Browse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style="direction:rtl; text-decoration:none;">
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
    </div>

</asp:Content>


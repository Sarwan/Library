<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopArticles.ascx.cs" Inherits="Common_UserControls_TopArticles" %>

<asp:ObjectDataSource ID="odcTop" runat="server" SelectMethod="getArticleForHome" TypeName="net.UyghurDev.Library.ArticleHelper">
    <SelectParameters>
        <asp:ControlParameter ControlID="hfArticleType" DefaultValue="0" Name="ArticleType" PropertyName="Value" Type="Object" />
    </SelectParameters>
</asp:ObjectDataSource>


<asp:HiddenField ID="hfArticleType" runat="server" Value="0" />

        <div class="GFAVCA-KD" style="" aria-hidden="false">
            <div class="GFAVCA-NC">
                <asp:DataPager ID="dpPager" runat="server" PagedControlID="lvArticles" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Image" NextPageImageUrl="~/_images/UI/preButtonBg.png" NextPageText="" PreviousPageImageUrl="~/_images/UI/nextButtonBg.png" PreviousPageText="" ButtonCssClass="GFAVCA-NE" />
                    </Fields>
                </asp:DataPager>
                <div class="gwt-Label GFAVCA-MC" style="" aria-hidden="false">
                           <%-- <%=_PagerText %>--%>
                </div>
                <div class="gwt-Label GFAVCA-OC">
                            <%=Title %>
             </div>
             </div>


 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                   <ContentTemplate>
<asp:ListView ID="lvArticles" runat="server" EnableModelValidation="True" DataSourceID="odcTop">
    <LayoutTemplate>


                <div style="position: relative; overflow: hidden; height: 206px; width: auto;">
                    <div style="position: absolute; overflow: hidden; right: 5px; top: 0px; height: 206px;
            width: auto;" runat="server" id="itemPlaceholder">

                    </div>
                </div>
    


    </LayoutTemplate>
    <ItemTemplate>
         <div class="GFAVCA-AE" >
                            <a class="gwt-Anchor" target="_blank" href="ArticleInfo.aspx?id=<%# DataBinder.Eval(Container.DataItem, "ID")%>">
                            <img src="_images/pdficon.png"
                        class="gwt-Image GFAVCA-OD"></a><div class="GFAVCA-CE GFAVCA-FE" style="line-height: 14px;
                            max-height: 52px; margin-bottom: 4px;">
                            <a class="gwt-Anchor" target="_blank" href="ArticleInfo.aspx?id=<%# DataBinder.Eval(Container.DataItem, "ID")%>">
                                <%# DataBinder.Eval(Container.DataItem, "Title")%></a>

                             
                                                        </div>
                    </div>
    </ItemTemplate>
</asp:ListView>
              
                       
                   </ContentTemplate>
                  
                   <Triggers>
                       
                   </Triggers>
                  
            </asp:UpdatePanel>
            
         
            </div>



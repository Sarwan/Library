<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Cpanel.master" AutoEventWireup="true" CodeFile="SendArticle.aspx.cs" Inherits="BackOffice_SendArticle" %>

<%@ Register Src="~/Common/UserControls/Language.ascx" TagPrefix="uc1" TagName="Language" %>
<%@ Register Src="~/Common/UserControls/Catalog.ascx" TagPrefix="uc1" TagName="Catalog" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type='text/javascript'>//<![CDATA[ 
        $(window).load(function () {

            $('#articleContent').click(function () {
                $('#ArticleContentContiner').slideToggle('slow');
            });
        });//]]>  

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hfArticleID" runat="server" Value="0" />
        <span class="ArticleLables">تۈرى</span>
    <hr class="LabelLine"/>
    <div class="ArticlePartContiner">
        <uc1:Catalog runat="server" ID="ucCatalog" />
    </div>

        <span class="ArticleLables">تىلى</span>
    <hr class="LabelLine"/>
    <div class="ArticlePartContiner">
        <uc1:Language runat="server" ID="ucLanguage" />
    </div>

    <span class="ArticleLables">تېمىسى</span>
    <hr class="LabelLine"/>
    <div class="ArticlePartContiner">
      <table>
          <tr>
              <td>
              <asp:TextBox ID="txtTitle" runat="server" ValidationGroup="vgTitle" Width="420px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle" ErrorMessage="*" ValidationGroup="vgTitle">*</asp:RequiredFieldValidator>
                  </td>
              <td>
        <uc1:Language runat="server" ID="ucLangForTitle" />
                  </td>
              <td>
        <asp:Button ID="btnAddTitle" runat="server" Text="قوشوش" OnClick="btnAddTitle_Click" ValidationGroup="vgTitle" />
        </td>
       
          </tr>
      </table>  
         <asp:GridView ID="gvTitles" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="ldsTitle" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="ArticleID" HeaderText="ArticleID" ReadOnly="True" SortExpression="ArticleID" />
                <asp:BoundField DataField="Title1" HeaderText="Title1" ReadOnly="True" SortExpression="Title1" />
                <asp:BoundField DataField="Language" HeaderText="Language" ReadOnly="True" SortExpression="Language" />
                <asp:CommandField ShowDeleteButton="True" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:LinqDataSource ID="ldsTitle" runat="server" 
            ContextTypeName="LibraryDataContext" TableName="Titles" 
            Where="ArticleID == @ArticleID" EnableDelete="True" EnableUpdate="True" 
            EnableInsert="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="hfArticleID" DefaultValue="0" Name="ArticleID" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    

    
        <span class="ArticleLables">ئاپتورى</span>
    <hr class="LabelLine"/>
    <div class="ArticlePartContiner">
        <table>
            <tr>
                <td>
                    <asp:TextBox ID="txtAuthor" runat="server" ValidationGroup="vgAuthor" Width="240px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvAuthor" runat="server" ErrorMessage="*" ValidationGroup="vgAuthor" ControlToValidate="txtAuthor">*</asp:RequiredFieldValidator>
                    <asp:Button ID="btnAddAuthor" runat="server" Text="قوشۇش" ValidationGroup="vgAuthor" OnClick="btnAddAuthor_Click" /></td>
                <td>ئەسەرنىڭ ئاپتورى كۆپ ئادەم بولسا، بىر-بىرلەپ قوشۇڭ!</td>
            </tr>
        </table>
        <asp:GridView ID="gvAuthor" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="ID" DataSourceID="ldsAuthors" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="ArticleID" HeaderText="ArticleID" SortExpression="ArticleID" ReadOnly="True" />
                <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:LinqDataSource ID="ldsAuthors" runat="server" ContextTypeName="LibraryDataContext" TableName="Authors" Where="ArticleID == @ArticleID" EnableDelete="True" EnableUpdate="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="hfArticleID" DefaultValue="0" Name="ArticleID" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    
         <span class="ArticleLables">قىسقىچە مەزمۇنى</span>
    <hr class="LabelLine"/>
    <div class="ArticlePartContiner">
      <table>
          <tr>
              <td>
              <asp:TextBox ID="txtAbstraction" runat="server" Height="120px" TextMode="MultiLine" ValidationGroup="vgAbstraction" Width="420px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvAbstraction" runat="server" ControlToValidate="txtAbstraction" ErrorMessage="*" ValidationGroup="vgAbstraction">*</asp:RequiredFieldValidator>
                  </td>
              <td>
        <uc1:Language runat="server" ID="usAbstractionLang" />
                  </td>
              <td>
        <asp:Button ID="btnAddSubject" runat="server" Text="قوشوش" OnClick="btnAddSubject_Click" ValidationGroup="vgAbstraction" />
        </td>
       
          </tr>
      </table>  
        <asp:GridView ID="gvAbstraction" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ldsSubject">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="ArticleID" HeaderText="ArticleID" SortExpression="ArticleID" ReadOnly="True" />
                <asp:BoundField DataField="Language" HeaderText="Language" SortExpression="Language" />
                <asp:BoundField DataField="Abstract" HeaderText="Abstract" SortExpression="Abstract" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:GridView>

         <asp:LinqDataSource ID="ldsSubject" runat="server" ContextTypeName="LibraryDataContext" TableName="Abstractions" Where="ArticleID == @ArticleID" EnableDelete="True" EnableUpdate="True">
             <WhereParameters>
                 <asp:ControlParameter ControlID="hfArticleID" Name="ArticleID" PropertyName="Value" Type="Int32" />
             </WhereParameters>
        </asp:LinqDataSource>

         </div>

        <span class="ArticleLables">ئاچقۇچلۇق سۆز</span>
    <hr class="LabelLine"/>
    <div class="ArticlePartContiner">
         <table>
          <tr>
              <td>
              <asp:TextBox ID="txtKeyword" runat="server" ValidationGroup="vgKeyword" Width="240px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvKeyword" runat="server" ControlToValidate="txtKeyword" ErrorMessage="*" ValidationGroup="vgKeyword">*</asp:RequiredFieldValidator>
                  </td>
              <td>
        <uc1:Language runat="server" ID="ucKeywordLanguage" />
                  </td>
              <td>
        <asp:Button ID="btnKeyword" runat="server" Text="قوشوش" OnClick="btnKeyword_Click" ValidationGroup="vgKeyword" />
        </td>
       
          </tr>
      </table>  
        <asp:GridView ID="gvKeyWords" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ldsKeyWords">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="ArticleID" HeaderText="ArticleID" SortExpression="ArticleID" ReadOnly="True" />
                <asp:BoundField DataField="KeyWord1" HeaderText="KeyWord1" SortExpression="KeyWord1" />
                <asp:BoundField DataField="Language" HeaderText="Language" SortExpression="Language" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:GridView>

         <asp:LinqDataSource ID="ldsKeyWords" runat="server" ContextTypeName="LibraryDataContext" TableName="KeyWords" Where="ArticleID == @ArticleID" EnableDelete="True" EnableUpdate="True">
             <WhereParameters>
                 <asp:ControlParameter ControlID="hfArticleID" DefaultValue="0" Name="ArticleID" PropertyName="Value" Type="Int32" />
             </WhereParameters>
         </asp:LinqDataSource>

    </div>

        <span class="ArticleLables">ھۆججەت</span>
    <hr class="LabelLine"/>
    <div class="ArticlePartContiner">
        <table>
            <tr>
                <td>
                    <asp:FileUpload ID="fuFile" runat="server" /></td>
                <td>
                    <asp:Button ID="btnUploadFile" runat="server" Text="ھۆججەت يۈكلەش" OnClick="btnUploadFile_Click" /></td>
            </tr>
        </table>
        <asp:GridView ID="gvFiles" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="ID" DataSourceID="ldsFiles" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="ArticleID" HeaderText="ArticleID" SortExpression="ArticleID" ReadOnly="True" />
                <asp:BoundField DataField="FileType" HeaderText="FileType" SortExpression="FileType" />
                <asp:BoundField DataField="FileName" HeaderText="FileName" SortExpression="FileName" />
                <asp:BoundField DataField="FilePath" HeaderText="FilePath" SortExpression="FilePath" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:LinqDataSource ID="ldsFiles" runat="server" ContextTypeName="LibraryDataContext" TableName="Files" Where="ArticleID == @ArticleID" EnableDelete="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="hfArticleID" DefaultValue="0" Name="ArticleID" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>

    <span class="ArticleLables">مەنبەسى</span>
    <hr class="LabelLine"/>
    <div class="ArticlePartContiner">
        <asp:TextBox ID="txtSource" runat="server" Width="395px"></asp:TextBox>
    </div>

    <span class="ArticleLables" id="articleContent">ماقالە مەزمۇنى</span>
    <hr class="LabelLine"/>
    <div class="ArticlePartContiner" id="ArticleContentContiner" style="display:none;">
        <asp:TextBox ID="txtContent" runat="server" Height="480px" TextMode="MultiLine" Width="90%"></asp:TextBox>

    </div>


      <%--  <span class="ArticleLables"></span>
    <hr class="LabelLine"/>
    <div class="ArticlePartContiner"></div>--%>

    <asp:Button ID="btnSend" runat="server" Text="ماقالە يوللاش" CssClass="SideSearchButton" OnClick="btnSend_Click" Width="100px" />
      
</asp:Content>


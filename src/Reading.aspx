<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="Reading.aspx.cs" Inherits="Reading" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="_js/compatibility.js"></script>
    <script src="_js/pdf.js"></script>
    <script src="_js/jquery-1.10.1.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div>
    <asp:Literal ID="ltrlScript" runat="server"></asp:Literal>
  <script type="text/javascript">


      var pagecount = 0;
      var currentpage = 1;
      var pdf = null;
      // Specify the main script used to create a new PDF.JS web worker.
      // In production, change this to point to the combined `pdf.js` file.
      //PDFJS.workerSrc = '../lib/worker_loader.js';
      PDFJS.disableWorker = true;


      PDFJS.getDocument(fileurl).then(function (_pdf) {
          // Using promise to fetch the page
          pdf = _pdf;
          pagecount = pdf.numPages;
          $("#PageCountNumber").text(pagecount);
          renderPage(currentpage);

      });

      function calculateScale(page)
      {
          var viewport = page.getViewport(1.0);
          var width = viewport.width;
          return (768-10) / width;
      }

      function renderPage(_currentpage) {
          pdf.getPage(_currentpage).then(function (page) {
              var scale = calculateScale(page);
              var viewport = page.getViewport(scale);

              //
              // Prepare canvas using PDF page dimensions
              //
              var canvas = document.getElementById('the-canvas');
              var context = canvas.getContext('2d');
              canvas.height = viewport.height;
              canvas.width = viewport.width;

              //
              // Render PDF page into canvas context
              //
              var renderContext = {
                  canvasContext: context,
                  viewport: viewport
              };
              page.render(renderContext);

          });
          $("#CurrentPageNumber").text(currentpage);
      }

      //
      // Go to previous page
      //
      function goPrevious() {
          // alert(currentpage);
          if (currentpage <= 1) {
              return;
          }

          currentpage--;
          //alert(currentpage);
          renderPage(currentpage);
      }

      //
      // Go to next page
      //
      function goNext() {
          // alert(currentpage);
          if (currentpage >= pagecount) {
              return;
          }
          currentpage++;
          // alert(currentpage);
          renderPage(currentpage);
      }
  </script>
    
    <div>
    <div id="pager">
        <img class="PagerControl" id="pgPre" src="_images/UI/preButtonBg.png" onclick="goPrevious()"></img>
        <div class="PagerControl" id="PageCountNumber" ">0</div>
        <div class="PagerControl">/</div>
        <div class="PagerControl" id="CurrentPageNumber">0</div>
        
        <img class="PagerControl" id="pgNext" src="_images/UI/nextButtonBg.png" onclick="goNext()"></img>
    </div>
        <center>
    <canvas id="the-canvas" style="border:1px solid black; direction:ltr; margin:4px; display:initial;  text-align:center;"/>
            </center>
    </div>
    
        
    </div>
    <div id="ArticlePageHeader">
        
        <asp:Button ID="btnFavrote" runat="server" Text="خەتكۈچ" class="greenLink btnFaverote" BorderStyle="None" OnClick="btnFavrote_Click"/>
        <%--<asp:Button ID="btnDownload" runat="server" Text="" class="greenLink btnDown" BorderStyle="None" OnClick="btnDownload_Click"/>--%>
        <asp:HyperLink ID="lnkDown" runat="server" class="greenLink btnDown">چۈشۈرۈش</asp:HyperLink>
    </div>
    <asp:HiddenField ID="hfFileID" runat="server" Value="0" />
    <asp:HiddenField ID="hfArticleID" runat="server" Value="0" />
</asp:Content>


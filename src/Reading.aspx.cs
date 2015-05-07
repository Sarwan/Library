using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reading : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                int nFileID = Convert.ToInt32(Request.QueryString["id"]);
                readFile(nFileID);
            }
            else
            {
                string strMessage = "<h4>"+"بىۋاستە توردا ئوقۇشقا بولىدىغان ھۆججەت تېپىلمىدى"+"</h4>";
                ltrlScript.Text = strMessage;
            }
        }
    }

    private void readFile(int nFileID)
    {
        LibraryDataContext lib = new LibraryDataContext();
        File fl = (from f in lib.Files
                  where f.ID == nFileID
                  select f).SingleOrDefault();
        
        fl.Article.ReadCount++;
        lib.SubmitChanges();

        string strUrl = "http://library.uycl.net/Files/Docs/" + fl.FilePath.Trim();
        renderScript(strUrl);

        hfFileID.Value = nFileID.ToString();
        hfArticleID.Value = fl.ArticleID.ToString();
        lnkDown.NavigateUrl = "~/Download.aspx?id=" + nFileID.ToString();
        chekFavorite(fl.ArticleID);
    }

    private void chekFavorite(int p)
    {
         LibraryDataContext lib = new LibraryDataContext();
        int fvCount = (from f in lib.Favorites
                  where f.ArticleID == Convert.ToInt32(hfArticleID.Value) && f.UserID == 1
                  select f.ID).Count();
        if (fvCount >0)
        {
            
            btnFavrote.ToolTip= "بۇ ماقالىنى سىز خەتكۈچلەپ بولغان";
            btnFavrote.Enabled = false;
            btnFavrote.ForeColor=System.Drawing.Color.DarkGray;
        }
    }

    private void renderScript(string fileUrl)
    {
        StringBuilder sbScript = new StringBuilder();
        sbScript.AppendLine("<script type=\"text/javascript\">");
        sbScript.AppendFormat("var fileurl = \"{0}\";", fileUrl);
        sbScript.AppendLine("</script>");
        ltrlScript.Text = sbScript.ToString();
    }
    protected void btnFavrote_Click(object sender, EventArgs e)
    {
        addFavorite();
    }

    private void addFavorite()
    {
        //LibraryDataContext lib = new LibraryDataContext();
        //var fv = (from f in lib.Favorites
        //          where f.ArticleID == Convert.ToInt32(hfArticleID.Value) && f.UserID == 1
        //          select f.ID).SingleOrDefault();

         LibraryDataContext lib = new LibraryDataContext();
        int fvCount = (from f in lib.Favorites
                  where f.ArticleID == Convert.ToInt32(hfArticleID.Value) && f.UserID == 1
                  select f.ID).Count();
        if (fvCount < 1)
        {
        
            Favorite f = new Favorite();
            f.ArticleID = Convert.ToInt32(hfArticleID.Value);
            f.UserID = 1;
            f.AddTime = DateTime.Now;
            lib.Favorites.InsertOnSubmit(f);
            lib.SubmitChanges();
        }
    }
    
}
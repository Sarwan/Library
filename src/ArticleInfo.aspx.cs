using net.UyghurDev.Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ArticleInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                int nArticleID = Convert.ToInt32(Request.QueryString["id"]);
                ShowArticleInfo(nArticleID);

            }
        }
    }
     private void ShowArticleInfo(int nArticleID)
    {
        ArticleHelper ah=new ArticleHelper();
        Article art = ah.getArticle(nArticleID);
        lblTitle.Text = art.Titles.OrderBy(t=>t.Language).Select(t=>t.Title1).FirstOrDefault();
        lblAbstraction.Text = art.Abstractions.OrderBy(a=>a.Language).Select(a => a.Abstract).FirstOrDefault();
        ltrlKeyWords.Text = makeKeyWordLink(art.KeyWords.Select(k => k.KeyWord1).ToList<string>());
        lblAuthors.Text = makeAuthorLink(art.Authors.Select(a => a).ToList<Author>());
        ltrlCategory.Text = makeCategoryLink(art.Classification1);

        ah.addVisitCount(nArticleID);
         
         //test
        LibraryDataContext lib = new LibraryDataContext();
        var rply = from r in lib.Replays
                   where r.ArticleID==nArticleID
                   select r;
        Response.Write(rply.Count().ToString());

    }

     private string makeCategoryLink(Classification cls)
     {
         StringBuilder sb = new StringBuilder();
         
             int n1st = cls.ID-(cls.ID % 100);
             int n3rd=cls.ID % 10;
             int n2nd = cls.ID - n3rd;
         CategoryHelper ch=new CategoryHelper();
         Classification cls1=ch.getCategory(n1st);
        sb.AppendFormat("<a href='Browse.aspx?cid={0}'>{1}</>",cls1.ID,cls1.NameUy.Trim());
        if (n2nd != n1st)
        {
            sb.Append("/");
            Classification cls2 = ch.getCategory(n2nd);
            sb.AppendFormat("<a href='Browse.aspx?cid={0}'>{1}</>", cls2.ID, cls2.NameUy.Trim());
        }
        //if (n3rd != n2nd)
        //{
            sb.Append("/");
           // Classification cls3 = ch.getCategory(n3rd);
            sb.AppendFormat("<a href='Browse.aspx?cid={0}'>{1}</>", cls.ID, cls.NameUy.Trim());
        //}

        return sb.ToString();
     }

     private string makeAuthorLink(List<Author> list)
     {
         StringBuilder sb = new StringBuilder();
         foreach (Author auth in list)
         {
             sb.AppendFormat("<a href='Search.aspx?a={0}'>{1}</a>", auth.ID,auth.AuthorName);
             sb.Append("،");
         }
         if (list.Count > 0)
         {
             sb.Remove(sb.Length-1, 1);
         }
         return sb.ToString();
     }

     private string makeKeyWordLink(List<string> list)
     {
         StringBuilder sb = new StringBuilder();
         foreach (string str in list)
         {
             sb.AppendFormat("<a href='Search.aspx?q={0}'>{0}</a>", str.Trim());
             sb.Append("،");
         }
         if (list.Count > 0)
         {
             sb.Remove(sb.Length - 1, 1);
         }
         return sb.ToString();
     }


     public string getUserName(Int32 nID)
     {
         return String.Format("ئوقۇرمەن({0})", nID.ToString());
     }
}
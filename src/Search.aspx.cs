using net.UyghurDev.Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["q"]))
            {
                getResult(Request.QueryString["q"]);
            }
        }
    }

    private void tempResult()
    {
        List<TempClass> lstTemp = new List<TempClass>();
        for (int n = 1; n < 13; n++)
        {
            TempClass tc = new TempClass();
            tc.ID = n;
            tc.Title = "ئۇيغۇر تىلىدىكى پېئىل رايلىرىنىڭ كېلىش شەكلى توغرىسىدا سېلىشتۇرما تەتقىقات";
            tc.Author = "پالنى پۇكۇنى";
            tc.Language = "ئۇيغۇرچە";
            tc.DownCount = n;
            tc.VisitCount = n * 3 - 3;
            lstTemp.Add(tc);
        }

        gvSearchResult.DataSource = lstTemp;
        gvSearchResult.DataBind();
    }

    private void getResult(string strQ)
    {
        ArticleHelper ah = new ArticleHelper();
        gvSearchResult.DataSource = ah.search(strQ);
        gvSearchResult.DataBind();
    }
}
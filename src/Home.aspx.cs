using net.UyghurDev.Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["action"]))
            {
                getAction(Request.QueryString["action"].ToLower());
            }
        }
    }

    private void getAction(string strAction)
    {
        ArticleHelper ah = new ArticleHelper();
        
        
        pnlGridView.Visible = false;
        pnlDefault.Visible = false;
        if (strAction == "recommendation")
        {
            gvSearchResult.DataSource = ah.getRecomendedArticles();
            pnlGridView.Visible = true;
        }
        else if(strAction == "newst")
        {
            gvSearchResult.DataSource = ah.getNewsArticles();
            pnlGridView.Visible = true;
        }
        else if (strAction == "topviewed")
        {
            gvSearchResult.DataSource = ah.getTopViewdArticles();
            pnlGridView.Visible = true;
        }
        else
        {
            pnlDefault.Visible = true;
            pnlGridView.Visible = false;
        }
        if (pnlGridView.Visible)
        {
            gvSearchResult.DataBind();
        }
    }
}
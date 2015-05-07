using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_ArticlesManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //getClassification();
    }

    public string getTitle(int nArticleID)
    {
        LibraryDataContext dcLib = new LibraryDataContext();
        Title ttl = (from t in dcLib.Titles
                     where t.ArticleID == nArticleID
                     select t).FirstOrDefault();
        if (ttl != null)
        {
            return ttl.Title1.Trim();
        }
        return "نامسىز";
    }

    private void getClassification()
    {
        if (!String.IsNullOrEmpty(Request.Cookies["SelectedClassification"].Value))
        {
            hfClassification.Value = Request.Cookies["SelectedClassification"].Value;
        }
        else
        {
            hfClassification.Value="0";
        }

       
    }
    protected void gvArticles_DataBinding(object sender, EventArgs e)
    {
        //Response.Write(hfClassification.Value + "/" + Request.Cookies["SelectedClassification"].Value);
        //hfClassification.Value = Request.Cookies["SelectedClassification"].Value;
    }
    protected void btnCatalog_Click(object sender, EventArgs e)
    {
        getClassification();
        gvArticles.DataBind();
    }
}
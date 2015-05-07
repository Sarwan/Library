using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_Recommendations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
}
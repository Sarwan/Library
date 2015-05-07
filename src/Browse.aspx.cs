using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using net.UyghurDev.Library;

public partial class Browse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        { 
            ArticleHelper ah=new ArticleHelper();
            gvSearchResult.DataSource = ah.getArticlesByCategory(getClassificationValue());
            gvSearchResult.DataBind();
        }
    }

    private int getClassificationValue()
    {
        
        if(getQsValue("t")!=0)
        {
        return getQsValue("t");
        }
        else if (getQsValue("s") != 0)
        { 
        return getQsValue("s");
        }
        else
        {
        return getQsValue("f");;
        }
          
    }

    private int getQsValue(string strQsParam)
    { 
        int n=0;
        if(!String.IsNullOrEmpty(Request.QueryString[strQsParam]))
        {
            Int32.TryParse(Request.QueryString[strQsParam], out n);
        }
        return n;
    }
}
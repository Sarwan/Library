using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Common_UserControls_Language : System.Web.UI.UserControl
{
    public Language selectedLanguage
    {
        get { return getSelectedValue(); }
    }

   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private Language getSelectedValue()
    {
        LibraryDataContext dcLib = new LibraryDataContext();
        int nLangID = 0;
        if (ddlLang.SelectedValue != null)
        {
             nLangID = Convert.ToInt16(ddlLang.SelectedValue);
        }
        Language lang = (from l in dcLib.Languages
                         where l.ID == nLangID
                         select l).SingleOrDefault();
        return lang;
    }
}
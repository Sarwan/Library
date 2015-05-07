using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_favorites : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Request.QueryString["UserID"]))
        {
            int nUserID = Convert.ToInt32(Request.QueryString["UserID"]);
            showFavorites(nUserID);
        }
    }

    private void showFavorites(int nUserID)
    {
        LibraryDataContext dcLib = new LibraryDataContext();
        var fav = from f in dcLib.Favorites
                  where f.UserID == nUserID
                  select f;
        gvFavorites.DataSource = fav;
        gvFavorites.DataBind();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdminPage
/// </summary>
public class AdminPage:System.Web.UI.Page
{
	public AdminPage()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    protected  void Page_Load(object sender, EventArgs e)
    {
        checkUser();
        Eza objEza = (Eza)Session["CurrentUser"];
        if (objEza == null)
        { Response.Redirect("cplogin.aspx"); }
        else if (objEza.Admin == false)
        { Response.Redirect("~/default.aspx"); }
    }
    private void checkUser()
    {
        if (Session["CurrentUser"] != null)
        {
            //lblCurrentUser.Text = ((Manager)Session["CurrentUser"]).Name;
            if (!Request.Url.AbsoluteUri.ToLower().Contains("default.aspx"))
            {
                Int64 nUserID = ((Eza)Session["CurrentUser"]).ID;
                LibraryDataContext dc = new LibraryDataContext();
                var pages = from p in dc.WebPages
                            join r in dc.UserRoles
                                on p.ID equals r.PageID
                            where r.UserID == nUserID
                            select p.PageFile;
                int nStartIndex = Request.Url.AbsoluteUri.ToLower().LastIndexOf('/') + 1;
                int nEndIndex = Request.Url.AbsoluteUri.ToLower().LastIndexOf(".aspx");
                string strFileName = Request.Url.AbsoluteUri.ToLower().Substring(nStartIndex, nEndIndex - nStartIndex + 5);
                if (!pages.Contains(strFileName))
                {
                    Response.Redirect("Main.aspx");
                }
            }
        }
        else
        {
            //pnlSideBar.Visible = false;
            if (!Request.Url.AbsoluteUri.ToLower().Contains("default.aspx"))
            {
                Response.Redirect("Default.aspx");
            }
        }
    }



    
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Common_Cpanel : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkUser();
    }
    private void checkUser()
    {
        if (Session["CurrentUser"] != null)
        {
            if (Session["CurrentUser"] == "")
            { return; }
            btnExit.Text =String.Format("چىقىپ كېتىش({0})", ((Eza)Session["CurrentUser"]).Name);
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
            pnlSideNav.Visible = false;
            if (!Request.Url.AbsoluteUri.ToLower().Contains("cplogin.aspx"))
            {
                Response.Redirect("cplogin.aspx");
            }
        }
    }

    protected void btnExit_Click(object sender, EventArgs e)
    {
        Session["CurrentUser"] = "";
        Response.Redirect("cpLogin.aspx");
    }

    private void fillSideBar()
    {
        //if (Session["CurrentUser"] != null)
        //{
        //    StringBuilder sbLink = new StringBuilder();
        //    DC5TilDataContext dc = new DC5TilDataContext();
        //    List<TWebPage> pages = dc.TWebPages.Select(r => r).ToList<TWebPage>();

        //    int?[] pagesIds = (from rol in dc.TRoles
        //                       where rol.Manager.ID == ((Manager)Session["CurrentUser"]).ID
        //                       select rol.PageID).ToArray();//dc.TRoles.Where(r=>r.UserID==Convert.ToInt32(ddlUser.SelectedValue)).Select(r=>r.PageID).ToArray()
        //    foreach (var pg in pages)
        //    {
        //        if (pagesIds.Contains(pg.ID))
        //        {
        //            //HyperLink lnk = new HyperLink();
        //            //lnk.NavigateUrl = "~/" + pg.Page;
        //            //lnk.Text = pg.PageName;
        //            //phLink.Controls.Add(lnk);
        //            sbLink.Append("●<a href=\"" + pg.Page + "\" >" + pg.PageName + "</a>&nbsp;&nbsp;");

        //        }
        //    }
        //    ltrlLinks.Text = sbLink.ToString();
        //}
    }
}

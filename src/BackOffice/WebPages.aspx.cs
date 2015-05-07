using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_WebPages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddRole_Click(object sender, EventArgs e)
    {
        LibraryDataContext dcLib = new LibraryDataContext();
        WebPage wp = new WebPage();
        wp.PageFile = txtPageFileName.Text;
        wp.PageTitle = txtPageTitle.Text;
        dcLib.WebPages.InsertOnSubmit(wp);
        dcLib.SubmitChanges();
        txtPageFileName.Text = txtPageTitle.Text = string.Empty;
        gvWebPages.DataBind();
    }
}
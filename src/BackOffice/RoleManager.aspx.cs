using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_RoleManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddRole_Click(object sender, EventArgs e)
    {
        LibraryDataContext dcLib = new LibraryDataContext();
        UserRole ur = new UserRole();
        ur.Enable = true;
        ur.PageID = Convert.ToInt32(ddlWebPage.SelectedValue);
        ur.UserID=Convert.ToInt32(ddlUser.SelectedValue);
        dcLib.UserRoles.InsertOnSubmit(ur);
        dcLib.SubmitChanges();
        gvRole.DataBind();
    }
}
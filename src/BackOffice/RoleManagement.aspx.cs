using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_RoleManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void LoadRoles()
    {
        lbUserPages.Items.Clear();
        LibraryDataContext dc = new LibraryDataContext();
        List<WebPage> pages = dc.WebPages.Select(r => r).ToList<WebPage>();

        int?[] pagesIds = (from rol in dc.UserRoles
                           where rol.Eza.ID == Convert.ToInt32(ddlUser.SelectedValue)
                           select rol.PageID).ToArray();//dc.TRoles.Where(r=>r.UserID==Convert.ToInt32(ddlUser.SelectedValue)).Select(r=>r.PageID).ToArray()
        foreach (var pg in pages)
        {
            if (pagesIds.Contains(pg.ID))
            {
                ListItem li = new ListItem(pg.PageTitle, pg.ID.ToString());
                lbUserPages.Items.Add(li);
            }
        }
    }
    protected void ddlUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadRoles();
    }
    protected void ddlUser_DataBound(object sender, EventArgs e)
    {
        LoadRoles();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (lbAllPAges.SelectedIndex > -1)
        {
            LibraryDataContext dc = new LibraryDataContext();
            int nCount = dc.UserRoles.Where(r => r.UserID == Convert.ToInt32(ddlUser.SelectedValue) && r.PageID == Convert.ToInt32(lbAllPAges.SelectedValue)).Count();
            if (nCount == 0)
            {
                UserRole rol = new UserRole();
                rol.UserID = Convert.ToInt32(ddlUser.SelectedValue);
                rol.PageID = Convert.ToInt32(lbAllPAges.SelectedValue);
                dc.UserRoles.InsertOnSubmit(rol);
                dc.SubmitChanges();
                LoadRoles();
            }
        }
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        if (lbUserPages.SelectedIndex > -1)
        {
            LibraryDataContext dc = new LibraryDataContext();
            UserRole rol = dc.UserRoles.Where(r => r.PageID == Convert.ToInt32(lbUserPages.SelectedValue) && r.Eza.ID == Convert.ToInt32(ddlUser.SelectedValue)).Single();
            dc.UserRoles.DeleteOnSubmit(rol);
            dc.SubmitChanges();
            LoadRoles();
        }
    }
}
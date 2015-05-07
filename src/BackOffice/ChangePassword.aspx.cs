using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main.aspx");
    }
    protected void btnChangePass_Click(object sender, EventArgs e)
    {
        //Eza eza = (Eza)Session["CurrentUser"];
        LibraryDataContext dcLib = new LibraryDataContext();
        SecurityTools st = new SecurityTools();
        Eza objEza = dcLib.Ezas.Where(m => m.ID==Convert.ToInt32(ddlEza.SelectedValue)).SingleOrDefault();
        objEza.Password = st.toMD5(txtNewPass.Text);
        dcLib.SubmitChanges();
    }
}
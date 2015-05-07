using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_ChangeUserPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtNewPass.Text = txtNewPassR.Text = txtOldPass.Text = string.Empty;
        Response.Redirect("Main.aspx");
    }
    protected void btnChangePass_Click(object sender, EventArgs e)
    {
        SecurityTools st=new SecurityTools();
        Eza crruser = (Eza)Session["CurrentUser"];
        if (crruser.Password != st.toMD5(txtOldPass.Text))
        {
            LibraryDataContext lib = new LibraryDataContext();
            Eza theUser = (from ez in lib.Ezas
                           where ez.ID == crruser.ID
                           select ez).SingleOrDefault();
            theUser.Password = st.toMD5(txtNewPass.Text.Trim());
            lib.SubmitChanges();
        }
        else
        {
            rfvOldPass.ErrorMessage = "كونا پارول توغرا ئەمەس";
            rfvOldPass.IsValid = false;
        }
    }
}
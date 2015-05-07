using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CPanel_cpLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        LibraryDataContext dcLib = new LibraryDataContext();
        SecurityTools st = new SecurityTools();
        string strPass =  st.toMD5(txtPass.Text);
        Eza objEza = dcLib.Ezas.Where(m => m.Name == txtUserName.Text.Trim() && m.Password == strPass &&  m.Enable==true).SingleOrDefault();
        if (objEza != null)
       {
           Session["CurrentUser"] = objEza;
           Response.Redirect("main.aspx");

       }
       else

       {
           Response.Redirect("cpLogin.aspx");
       }
    }
}
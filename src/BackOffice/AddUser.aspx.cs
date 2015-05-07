using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_AddUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void dvEza_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (e.Values["Name"] == null || e.Values["Password"] == null)
        {
            e.Cancel = true;
            return;
        }
        //Response.Write(e.Values["Password"].ToString());
        //Response.Write(e.Values["Name"].ToString());
        //Response.Write(e.Values["Email"].ToString());
        e.Values["RegisteredTime"] = DateTime.Now;
        SecurityTools st=new SecurityTools();
        e.Values["Password"] = st.toMD5(e.Values["Password"].ToString());
    }
}
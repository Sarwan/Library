using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_Replay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int nArticleID=0;
        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
        {
             nArticleID = Convert.ToInt32(Request.QueryString["id"]);
            showReplay(nArticleID);
        }
       
    }

    private void showReplay(int nArticleID)
    {
        LibraryDataContext dcLib = new LibraryDataContext();
        if (nArticleID > 0)
        {
            var rep = from r in dcLib.Replays
                      where r.ArticleID == nArticleID && r.Deleted==false
                      select r;
            gvReplaies.DataSource = rep;
            gvReplaies.DataBind();
        }
        else
        {
            var rep = from r in dcLib.Replays
                      where r.Deleted==false
                      select r;
            gvReplaies.DataSource = rep;
            gvReplaies.DataBind();
        }
        
       
    }
    protected void gvReplaies_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        LibraryDataContext lib = new LibraryDataContext();

        if (e.CommandName == "confrim")
        {
            Response.Write("confirim");
            int nid = Convert.ToInt32(gvReplaies.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text);
            Response.Write(nid.ToString());
            Replay rep = (from rp in lib.Replays
                          where rp.ID == nid
                          select rp).SingleOrDefault();

            rep.Enable = Convert.ToBoolean(rep.Enable) ? false : true;
            lib.SubmitChanges();
        }
        else if (e.CommandName == "delete")
        {
            int nid = Convert.ToInt32(gvReplaies.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text);
            Response.Write(nid.ToString());
            Replay rep = (from rp in lib.Replays
                          where rp.ID == nid
                          select rp).SingleOrDefault();
            rep.Deleted = Convert.ToBoolean(rep.Deleted) ? false : true;
            lib.SubmitChanges();
        }
        gvReplaies.DataBind();
        Response.Write(" ca:" + e.CommandArgument.ToString());
    }

    

}
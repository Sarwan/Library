using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Common_UserControls_Replys : System.Web.UI.UserControl
{
    private string _ArticleID;

    public string ArticleID
    {
        get { return _ArticleID; }
        set { _ArticleID = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string getUserName(Int32 nID)
    {
        return String.Format("ئوقۇرمەن({0})", nID.ToString());
    }
    protected void btnSendReplay_Click(object sender, EventArgs e)
    {
        LibraryDataContext dcLib = new LibraryDataContext();
        Replay rply = new Replay();
        rply.ArticleID = Convert.ToInt32(hfArticleID.Value);
        rply.Deleted = false;
        rply.Enable = true;
        rply.ReplayContent = txtReplayContent.Text;
        rply.ReplayDate = DateTime.Now;
        rply.Title = txtReplayTitle.Text;
        rply.UserID = 0;
        dcLib.Replays.InsertOnSubmit(rply);
        dcLib.SubmitChanges();
        txtReplayTitle.Text = string.Empty;
        txtReplayContent.Text = string.Empty;
        dlReplays.DataBind();
    }

    public string replaceBr(string strSource)
    {
        return strSource.Replace(Environment.NewLine, "<br/>");
    }
}
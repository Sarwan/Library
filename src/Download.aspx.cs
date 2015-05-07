using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Download : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            { 
                int nFileID=Convert.ToInt32(Request.QueryString["id"]);
                goDownload(nFileID);
            }
        }
    }

    private void goDownload(int nFileID)
    {
        LibraryDataContext lib = new LibraryDataContext();
        File fl = (from f in lib.Files
                   where f.ID == nFileID
                   select f).FirstOrDefault();
        fl.Article.DownCount++;
        lib.SubmitChanges();

        Response.Clear();
        Response.ContentType = fl.FileType1.MimeType.Trim();
        string strFileName = fl.FileName.Trim();// +fl.FileType1.Extension.Trim();
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + strFileName);
        string strFilePath = Server.MapPath(System.Web.Configuration.WebConfigurationManager.AppSettings["FileFolder"]) + fl.FilePath.Trim();
        //if (fl.FilePath.Trim().StartsWith("~"))
        //{
        //    Response.Redirect("~/files/docs" + fl.FilePath.Trim().Replace("~", ""));
        //}
        Response.TransmitFile(strFilePath);//ھۆججەتنى تورغا يوللىدۇق
        Response.End();
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_SendArticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["ArticleID"]))
            {
                hfArticleID.Value = Request.QueryString["ArticleID"];
            }
            else
            {
                if (!String.IsNullOrEmpty(Request.QueryString["Action"]))
                {
                    if (Request.QueryString["Action"].Equals("Create"))
                    {
                        if (String.IsNullOrEmpty(hfArticleID.Value))
                        {
                            CreateNewArticle();
                        }
                        else if (hfArticleID.Value.Equals("0"))
                        {
                            CreateNewArticle();
                        }
                    }
                }
            }
        }
        this.Title="ArticleID"+hfArticleID.Value;
    }

    private void CreateNewArticle()
    {
        Article art = new Article();
        art.DownCount = 0;
        art.VisitCount = 0;
        art.ReadCount = 0;
        art.AddTime = DateTime.Now;

        LibraryDataContext dcLib = new LibraryDataContext();
        dcLib.Articles.InsertOnSubmit(art);
        dcLib.SubmitChanges();
        hfArticleID.Value = art.ID.ToString();
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        SaveChanges();
    }

    private void SaveChanges()
    {
        LibraryDataContext dcLib = new LibraryDataContext();
        Article art = (from a in dcLib.Articles
                       where a.ID == getArticleID()
                       select a).SingleOrDefault();

        art.Source = txtSource.Text;
        art.Language = ucLanguage.selectedLanguage.ID;
        if (txtContent.Text.Length > 0)
        {
            art.ArticleContent = txtContent.Text;
        }
        art.Classification = 0;
        art.Classification = ucCatalog.SelectedCategory;

        dcLib.SubmitChanges();
    }

    protected void btnAddTitle_Click(object sender, EventArgs e)
    {
        LibraryDataContext dcLib = new LibraryDataContext();
        Title ttl= new Title();
        ttl.ArticleID = getArticleID();
        ttl.Language = ucLangForTitle.selectedLanguage.ID;
        ttl.Title1 = txtTitle.Text.Trim();
        dcLib.Titles.InsertOnSubmit(ttl);
        dcLib.SubmitChanges();
        txtTitle.Text = "";
        gvTitles.DataBind();
    }
    protected void btnAddAuthor_Click(object sender, EventArgs e)
    {
        LibraryDataContext dcLib = new LibraryDataContext();
        Author auth = new Author();
        auth.ArticleID = getArticleID();
        auth.AuthorName = txtAuthor.Text.Trim();
        dcLib.Authors.InsertOnSubmit(auth);
        dcLib.SubmitChanges();
        txtAuthor.Text = "";
        gvAuthor.DataBind();
    }
    protected void btnAddSubject_Click(object sender, EventArgs e)
    {
        LibraryDataContext dcLib = new LibraryDataContext();
        Abstraction abs = new Abstraction();
        abs.ArticleID = getArticleID();
        abs.Language = usAbstractionLang.selectedLanguage.ID;
        abs.Abstract = txtAbstraction.Text;
        dcLib.Abstractions.InsertOnSubmit(abs);
        dcLib.SubmitChanges();
        txtAbstraction.Text = "";
        gvAbstraction.DataBind();
    }

    private int getArticleID()
    {
        int nID = 0;
       if( Int32.TryParse(hfArticleID.Value,out nID)==false)
        {
            nID = 0;
        }
       return nID;
    }
    protected void btnKeyword_Click(object sender, EventArgs e)
    {
        KeyWord kw = new KeyWord();
        kw.ArticleID = getArticleID();
        kw.KeyWord1 = txtKeyword.Text;
        kw.Language = ucKeywordLanguage.selectedLanguage.ID;

        LibraryDataContext dcLib = new LibraryDataContext();
        dcLib.KeyWords.InsertOnSubmit(kw);
        dcLib.SubmitChanges();
        txtKeyword.Text="";
        gvKeyWords.DataBind();
    }
    protected void btnUploadFile_Click(object sender, EventArgs e)
    {
        if (fuFile.HasFile)
        {
            FileHelper fh = new FileHelper();
            string strExt = fuFile.PostedFile.FileName.Substring(fuFile.FileName.LastIndexOf('.'));
            string strFileName = fuFile.FileName;//for save to db
            string strFulPath = fh.generateFileName(strExt);//
            string strSavingPath = Server.MapPath(System.Configuration.ConfigurationManager.AppSettings["FileFolder"]) + strFulPath;
            fuFile.PostedFile.SaveAs(strSavingPath);

            LibraryDataContext dcLib = new LibraryDataContext();
            File fl = new File();
            fl.ArticleID = getArticleID();
            fl.FileType1 = (from ft in dcLib.FileTypes
                            where ft.Extension == strExt
                            select ft).SingleOrDefault();
            fl.FileName = strFileName;
            fl.FilePath = strFulPath;
            dcLib.Files.InsertOnSubmit(fl);
            dcLib.SubmitChanges();
            gvFiles.DataBind();
        }
    }
}
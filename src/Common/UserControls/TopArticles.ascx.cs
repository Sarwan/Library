using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Common_UserControls_TopArticles : System.Web.UI.UserControl
{

    private string _Title;
    public string Title
    {
        get { return _Title; }
        set { _Title = value; }
    }

    private TopArticleType _ArticleType;

    public TopArticleType ArticleType
    {
        get { return (TopArticleType)Enum.Parse(typeof(TopArticleType), hfArticleType.Value); }
        set { hfArticleType.Value = value.ToString(); }
    }

    ////private int _PageSize;

    //public int PageSize
    //{
    //    get { return Convert.ToInt32(hfPageSize.Value); }
    //    set { hfPageSize.Value = value.ToString(); }
    //}

    ////private int _CurrentPage;

    //public int CurrentPage
    //{
    //    get { return Convert.ToInt32(hfCurrentPage.Value); }
    //    set { hfCurrentPage.Value = value.ToString(); }
    //}

    //private int _TotalPage=3;

    //public int TotalPage
    //{
    //    get { return _TotalPage; }
    //    set { _TotalPage = value; }
    //}

    public string _PagerText;

    //public string PagerText
    //{
    //    get { return _PagerText; }
    //    set { _PagerText = value; }
    //}

    protected void Page_Load(object sender, EventArgs e)
    {
        //_PagerText = String.Format("جەمئى:{0},كۆرۈنگىنى:{1}",TotalPage*PageSize,((CurrentPage-1)*PageSize+1).ToString() +"-"+ (CurrentPage*PageSize).ToString());
       // bindData();
    }

    private void bindData()
    {
        net.UyghurDev.Library.ArticleHelper ah=new net.UyghurDev.Library.ArticleHelper();
        switch (ArticleType)
        {
            case TopArticleType.MostDownloaded:
                lvArticles.DataSource = ah.getTopDownloadedArticles();
                lvArticles.DataBind();
                break;
            case TopArticleType.MostReplayed:
                lvArticles.DataSource = ah.getTopReplayedArticles();
                lvArticles.DataBind();
                break;
            case TopArticleType.MostVisited:
                lvArticles.DataSource = ah.getTopViewdArticles();
                lvArticles.DataBind();
                break;
            case TopArticleType.Newst:
                lvArticles.DataSource = ah.getNewsArticles();
                lvArticles.DataBind();
                break;
            case TopArticleType.Recomended:
                lvArticles.DataSource = ah.getRecomendedArticles();
                lvArticles.DataBind();
                break;

        }

    }
    protected void btnPre_Click(object sender, EventArgs e)
    {
        //CurrentPage = CurrentPage + 1;
        //bindData();
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        //CurrentPage = CurrentPage - 1;
        //bindData();
    }
}
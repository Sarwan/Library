using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Common_Main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            intializeCheckBox();
        }
    }
    protected void ddlThirdCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        String strUrl =String.Format( "Browse.aspx?f={0}&s={1}&t={2}",ddlFirstCategory.SelectedValue,ddlSecondCategory.SelectedValue,ddlThirdCategory.SelectedValue);
        Response.Redirect(strUrl);
    }

    protected void ddlSecondCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        String strUrl = String.Format("Browse.aspx?f={0}&s={1}", ddlFirstCategory.SelectedValue, ddlSecondCategory.SelectedValue);
        Response.Redirect(strUrl);
    }
    protected void ddlFirstCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        String strUrl = String.Format("Browse.aspx?f={0}", ddlFirstCategory.SelectedValue);
        Response.Redirect(strUrl);
    }

    protected void btnSideSearch_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtSideKeyWord.Text))
        { return; }
        string strUrl=String.Format("Search.aspx?q={0}&bk={1}&bt={2}",txtSideKeyWord.Text.Trim(),cbKeyword.Checked?1:0,cbTitle.Checked?1:0);
        Response.Redirect(strUrl);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtKeyWord.Text))
        { return; }
        string strUrl = String.Format("Search.aspx?q={0}", txtKeyWord.Text.Trim());
        Response.Redirect(strUrl);
    }

    private void getCategories(DropDownList ddl,string qp)
    {
        if (Request.Url.PathAndQuery.ToLower().Contains("browse.aspx"))
        {
            if (!string.IsNullOrEmpty(Request.QueryString[qp]))
            {
                if (ddl.Items.FindByValue(Request.QueryString[qp]) != null)
                {
                    ddl.SelectedValue = Request.QueryString[qp];
                }
            }
       
            //if (!string.IsNullOrEmpty(Request.QueryString["s"]))
            //{
            //    ddlFirstCategory.SelectedValue = Request.QueryString["s"];
            //}
       
            //if (!string.IsNullOrEmpty(Request.QueryString["t"]))
            //{
            //    ddlFirstCategory.SelectedValue = Request.QueryString["t"];
            //}
        }

    }
    protected void ddlFirstCategory_DataBound(object sender, EventArgs e)
    {
        getCategories(ddlFirstCategory, "f");
    }
    protected void ddlSecondCategory_DataBound(object sender, EventArgs e)
    {
        getCategories(ddlSecondCategory, "s");
    }
    protected void ddlThirdCategory_DataBound(object sender, EventArgs e)
    {
        getCategories(ddlThirdCategory, "t");
    }

    private void intializeCheckBox()
    { 
        if (Request.Url.PathAndQuery.ToLower().Contains("search.aspx"))
        {
            cbKeyword.Checked = isChecked("bk");
            cbTitle.Checked = isChecked("bt");
        }
        if (!String.IsNullOrEmpty(Request.QueryString["q"]))
        {
            string q = Request.QueryString["q"].Trim();
            txtKeyWord.Text = q;
            txtSideKeyWord.Text = q;
        }
    }

    private Boolean isChecked(string strQsParam)
    {
        
            if (!string.IsNullOrEmpty(Request.QueryString[strQsParam]))
            {
                if (Request.QueryString[strQsParam] == "1")
                { return true; }
            }
            return false;
    }
}

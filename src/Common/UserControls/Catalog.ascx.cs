using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Common_UserControls_Catalog : System.Web.UI.UserControl
{
    private int _fCat;

    public int FirstCategory
    {
        get { return _fCat; }
        set { _fCat = value; }
    }

    private int _sCat;

    public int SecondCategory
    {
        get { return _sCat; }
        set { _sCat = value; }
    }

    private int _tCat;

    public int ThridCategory
    {
        get { return _tCat; }
        set { _tCat = value; }
    }

    private int _SelectedCategory;

    public int SelectedCategory
    {
        get { return _SelectedCategory; }
        set { _SelectedCategory = value; }
    }


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlFirstCategory_DataBound(object sender, EventArgs e)
    {
        getCategories(ddlFirstCategory, "f");
        ddlSecondCategory.DataBind();
    }
    protected void ddlSecondCategory_DataBound(object sender, EventArgs e)
    {
        getCategories(ddlSecondCategory, "s");
        ddlThirdCategory.DataBind();
    }
    protected void ddlThirdCategory_DataBound(object sender, EventArgs e)
    {
        getCategories(ddlThirdCategory, "t");
    }
    private void getCategories(DropDownList ddl, string qp)
    {
        if (Request.Cookies.AllKeys.Contains(qp))
        {
            if (!string.IsNullOrEmpty(Request.Cookies[qp].Value))
            {
                if (ddl.Items.FindByValue(Request.Cookies[qp].Value) != null)
                {
                    ddl.SelectedValue = Request.QueryString[qp];
                    
                }
            }
        }

    }

    protected void ddlThirdCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        setCookie("t",ddlThirdCategory.SelectedValue);
        ThridCategory = Convert.ToInt16(ddlThirdCategory.SelectedValue);
        getSelectedCategoryID();
    }

    protected void ddlSecondCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        setCookie("s",ddlSecondCategory.SelectedValue);
        SecondCategory = Convert.ToInt16(ddlSecondCategory.SelectedValue);
        getSelectedCategoryID();
        
    }
    protected void ddlFirstCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        setCookie("f", ddlFirstCategory.SelectedValue);
        FirstCategory = Convert.ToInt16(ddlFirstCategory.SelectedValue);
        getSelectedCategoryID();
    }

    private void setCookie(string strName, string strVal)
    { 
        Response.Cookies[strName].Value=strVal;
    }

    public int getSelectedCategoryID()
    {
        SelectedCategory=FirstCategory + SecondCategory + ThridCategory;
        setCookie("SelectedClassification", SelectedCategory.ToString());
        return SelectedCategory;
    }
}
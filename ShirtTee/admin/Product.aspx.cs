using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class Product : System.Web.UI.Page
    {

        const string query = "SELECT * FROM [Product] INNER JOIN[Category] ON Product.category_id = Category.category_id WHERE deleted_at IS NULL";

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (IsPostBack)
            {
                try
                {
                    if (txtSearch.Text != "" && ddlCategory.SelectedIndex != 0)
                    {
                        SqlDataSource1.SelectCommand = query + " AND product_name LIKE '%' + @product_name + '%'";
                        SqlDataSource1.SelectCommand += " AND Category.category_group = @category_group ";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("product_name", txtSearch.Text);
                        SqlDataSource1.SelectParameters.Add("category_group", ddlCategory.SelectedValue);

                    }
                    else if (ddlCategory.SelectedIndex != 0)
                    {
                        SqlDataSource1.SelectCommand = query + " AND Category.category_group = @category_group";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("category_group", ddlCategory.SelectedValue);
                    }
                    else if (txtSearch.Text != "")
                    {
                        SqlDataSource1.SelectCommand = query + " AND product_name LIKE '%' + @product_name + '%'";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("product_name", txtSearch.Text);
                    }
                    else
                    {
                        SqlDataSource1.SelectCommand = query;
                        SqlDataSource1.SelectParameters.Clear();
                    }

                    ListView1.DataBind();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex.Message + "\n" + query + "\n" + SqlDataSource1.SelectCommand);
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ProductAdded"] != null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
                }
                if (Session["ProductDeleted"] != null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessDeleteToast", "showSuccessDeleteToast();", true);
                }
            }
            else
            {
            }

        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }

    }
}
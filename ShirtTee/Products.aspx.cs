using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee
{
    public partial class Products : System.Web.UI.Page
    {
        const string query = "SELECT * FROM [Product] INNER JOIN[Category] ON Product.category_id = Category.category_id WHERE deleted_at IS NULL";
        protected override void OnPreRender(EventArgs e)
        {
            string prodCategory = Request.QueryString["category"];
            base.OnPreRender(e);
            if (IsPostBack)
            {
                try
                {
                    if (txtSearch.Text != "" && !string.IsNullOrEmpty(prodCategory))
                    {
                        SqlDataSource1.SelectCommand = query + " AND product_name LIKE '%' + @product_name + '%'";
                        SqlDataSource1.SelectCommand += " AND Category.category_group = @category_group ";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("product_name", txtSearch.Text);
                        SqlDataSource1.SelectParameters.Add("category_group", prodCategory);

                    }
                    else if (!string.IsNullOrEmpty(prodCategory))
                    {
                        SqlDataSource1.SelectCommand = query + " AND Category.category_group = @category_group";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("category_group", prodCategory);
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

                    Repeater1.DataBind();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex.Message + "\n" + query + "\n" + SqlDataSource1.SelectCommand);
                }
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string prodCategory = Request.QueryString["category"];
            if (prodCategory != null)
            {
                if (prodCategory.Equals("men"))
                {
                    lblProduct.Text = "MEN";
                }
                else if (prodCategory.Equals("women"))
                {
                    lblProduct.Text = "WOMEN";
                }
                else if (prodCategory.Equals("kids"))
                {
                    lblProduct.Text = "KIDS";
                }
            }


        }

    }
}
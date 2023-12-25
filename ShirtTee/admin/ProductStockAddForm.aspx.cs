using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class StockAddForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["product_id"] != null)
            {
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@ProductId", Request.QueryString["product_id"])
                };
                SqlDataReader productDetails = dbconnection.ExecuteQuery(
                    "SELECT * FROM Product WHERE Product_ID=@ProductId",
                    parameterUrl).ExecuteReader();


                if (productDetails.HasRows)
                {
                    productDetails.Read();
                    hypProduct.Text = "Product: " + productDetails["product_name"];
                    hypProduct.NavigateUrl = ResolveUrl("~/admin/ProductDetails.aspx") + "?product_id=" + Request.QueryString["product_id"];
                }
            }
            else
            {
                Panel1.Visible = false;
                lblError.Visible = true;
                lblError.Text = "<div class=\"grid h-screen place-content-center bg-white px-4\">" +
                    "<h1 class=\"text-center uppercase tracking-widest text-gray-500\">404 | Not Found</h1>" +
                    "</div>";
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                DBconnection dbconnection = new DBconnection();
                string sqlCommand = "INSERT INTO Product_Details (product_ID, size_ID, color_ID, stock_available, updated_at " +
                                   (fileImage.HasFile ? ",image" : "") +
                                    ") " +
                                    "VALUES (@product_ID, @size_ID, @color_ID, @stock_available, @updated_at" +
                                    (fileImage.HasFile ? ",@image" : "") +
                                    ")";


                SqlParameter[] parameters = {
                    new SqlParameter("@product_ID",Request.QueryString["product_id"]),
                    new SqlParameter("@size_ID", ddlSize.SelectedValue),
                    new SqlParameter("@color_ID", ddlColor.SelectedValue),
                    new SqlParameter("@stock_available",  Convert.ToDouble(txtQty.Text)),
                    new SqlParameter("@updated_at", DateTime.Now),

                };


                if (fileImage.HasFile)
                {
                    parameters = parameters.Append(new SqlParameter("@image", (object)fileImage.FileBytes)).ToArray();
                }

                if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                {
                    Session["StockAdded"] = "success";
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                Session["StockAdded"] = "error";
            }
            finally
            {
                Response.Redirect(ResolveUrl("~/admin/ProductStock.aspx")
                    + "?product_id="
                    + Request.QueryString["product_id"]);
            }
        }
    }
}
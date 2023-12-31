using System;
using System.Collections.Generic;
using System.Configuration.Provider;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class ProductStock : System.Web.UI.Page
    {
        const string query = "SELECT *" +
" FROM Product_Details" +
" INNER JOIN Product ON Product.product_ID = Product_Details.product_ID" +
" INNER JOIN Color ON Product_Details.color_ID = Color.color_ID" +
" INNER JOIN Size ON Product_Details.size_ID = Size.size_ID" +
" WHERE (Product.product_ID = @product_ID)";

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (IsPostBack)
            {
                try
                {
                    if (ddlColor.SelectedIndex != 0 && ddlSize.SelectedIndex != 0)
                    {
                        SqlDataSource2.SelectCommand = query + " AND (Color.color_ID = @color_ID)";
                        SqlDataSource2.SelectCommand += " AND (Size.size_ID = @size_ID)";
                        SqlDataSource2.SelectParameters.Clear();
                        SqlDataSource2.SelectParameters.Add("size_ID", ddlSize.SelectedValue);
                        SqlDataSource2.SelectParameters.Add("color_ID", ddlColor.SelectedValue);

                    }
                    else if (ddlColor.SelectedIndex != 0)
                    {
                        SqlDataSource2.SelectCommand = query + " AND (Color.color_ID = @color_ID)";

                        SqlDataSource2.SelectParameters.Clear();
                        SqlDataSource2.SelectParameters.Add("color_ID", ddlColor.SelectedValue);
                    }
                    else if (ddlSize.SelectedIndex != 0)
                    {
                        SqlDataSource2  .SelectCommand += " AND (Size.size_ID = @size_ID)";
                        SqlDataSource2.SelectParameters.Clear();
                        SqlDataSource2.SelectParameters.Add("size_ID", ddlSize.SelectedValue);
                    }
                    else
                    {
                        SqlDataSource2.SelectCommand = query;
                        SqlDataSource2.SelectParameters.Clear();
                    }
                    SqlDataSource2.SelectParameters.Add("product_ID", Request.QueryString["product_id"].ToString());

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

            if (Request.QueryString["product_id"] == null)
            {
                Panel1.Visible = false;
                lblError.Visible = true;
                lblError.Text = "<div class=\"grid h-screen place-content-center bg-white px-4\">" +
                    "<h1 class=\"text-center uppercase tracking-widest text-gray-500\">404 | Not Found</h1>" +
                    "</div>";
            }
            else
            {


                if (!IsPostBack)
                {

                    if (Session["StockAdded"] != null)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
                    }
                }
                hypAddStock.NavigateUrl = "./ProductStockAddForm.aspx?product_id=" + Request.QueryString["product_id"].ToString();
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

        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if ((e.CommandName == "updateStock"))
            {
                System.Diagnostics.Debug.WriteLine("HI");
                string commandArgument = e.CommandArgument.ToString();
                string[] arguments = commandArgument.Split('|');

                if (arguments.Length == 2)
                {
                    int itemIndex = Convert.ToInt32(arguments[0]);
                    int id = Convert.ToInt32(arguments[1]);

                    TextBox txtQty = (TextBox)ListView1.Items[itemIndex].FindControl("txtQty");
                    FileUpload fileImage = (FileUpload)ListView1.Items[itemIndex].FindControl("fileImage");
                    CheckBox chkOnSales = (CheckBox)ListView1.Items[itemIndex].FindControl("chkOnSales");

                    try
                    {
                        DBconnection dbconnection = new DBconnection();

                        string sqlCommand = "UPDATE Product_Details SET " +
                               "stock_available = @qty," +
                               "on_sale = @on_sale " +
                               (fileImage.HasFile ? ", image = @image " : "") +
                               "WHERE product_details_ID = @id";

                        SqlParameter[] parameters = {
                            new SqlParameter("@qty", Convert.ToInt32(txtQty.Text)),
                            new SqlParameter("@on_sale",chkOnSales.Checked),
                            new SqlParameter("@id",id),
                        };

                        if (fileImage.HasFile)
                        {
                            parameters = parameters.Append(new SqlParameter("@image", (object)fileImage.FileBytes)).ToArray();
                        }

                        if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                        {
                            Session["StockUpdated"] = "success";
                        }
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine(ex.Message);
                        Session["StockUpdated"] = "error";
                    }
                    finally
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showUpdateSuccessToast();", true);
                    }
                }

            }
        }

        protected void ddlColor_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlSize_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
using Microsoft.SqlServer.Server;
using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;

namespace ShirtTee.admin
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        string selectedCategory;
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
                hypToStock.NavigateUrl = ResolveUrl("~/admin/ProductStock.aspx").ToString() +
                    "?product_id=" + Request.QueryString["product_id"].ToString();

                if (!IsPostBack)
                {
                    FetchData();
                }
            }



        }

        private void FetchData()
        {
            DBconnection dbconnection = new DBconnection();
            SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@ProductId", Request.QueryString["product_id"])
                };
            dbconnection.createConnection();
            SqlDataReader productDetails = dbconnection.ExecuteQuery(
                "SELECT P.*, C.* FROM Product AS P INNER JOIN Category AS C ON P.category_id = C.category_id WHERE Product_ID=@ProductId",
                parameterUrl).ExecuteReader();


            if (productDetails.HasRows)
            {
                productDetails.Read();
                lblTitle.Text = (string)productDetails["product_name"];


                txtProdName.Text = (string)productDetails["product_name"];
                txtProdDesc.Text = (string)productDetails["description"];
                txtPrice.Text = productDetails["price"].ToString();


                Image1.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String((byte[])productDetails["thumbnail"]);


                switch (productDetails["category_group"].ToString())
                {
                    case "men":
                        radProdGroup.Items[0].Selected = true;
                        break;
                    case "women":
                        radProdGroup.Items[1].Selected = true;
                        break;
                    default:
                        radProdGroup.Items[2].Selected = true;
                        break;
                }
                ddlProdCategory.SelectedValue = productDetails["category_id"].ToString();

               
            }
            dbconnection.closeConnection();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                DBconnection dbconnection = new DBconnection();

                string sqlCommand = "UPDATE Product SET " +
                       "category_ID = @category_ID, " +
                       "product_name = @product_name, " +
                       "description = @description, " +
                       "price = @price " +
                       (fileThumbnail.HasFile ? ", thumbnail = @thumbnail " : "") +
                       "WHERE product_ID = @product_ID";

                SqlParameter[] parameters = {
                new SqlParameter("@category_ID", ddlProdCategory.SelectedValue),
                new SqlParameter("@product_name", txtProdName.Text),
                new SqlParameter("@description", txtProdDesc.Text),
                new SqlParameter("@price", Convert.ToDouble(txtPrice.Text)),
                new SqlParameter("@product_ID",Request.QueryString["product_id"].ToString())
                };

                if (fileThumbnail.HasFile)
                {
                    parameters = parameters.Append(new SqlParameter("@thumbnail", (object)fileThumbnail.FileBytes)).ToArray();
                }
                dbconnection.createConnection();
                bool valid = dbconnection.ExecuteNonQuery(sqlCommand, parameters);
                dbconnection.closeConnection();
                if (valid)
                {
                    Session["ProductUpdated"] = "success";
                    FetchData();
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                Session["ProductUpdated"] = "error";
            }
            finally
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                DBconnection dbconnection = new DBconnection();

                string sqlCommand = "UPDATE Product SET " +
                       "deleted_at = @deleted_at " +
                       "WHERE product_ID = @product_ID";

                SqlParameter[] parameters = {
                new SqlParameter("@deleted_at", DateTime.Now),
                new SqlParameter("@product_id",Request.QueryString["product_id"])
                };

                dbconnection.createConnection();
                if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                {
                    Session["ProductDeleted"] = "success";
                }
                dbconnection.closeConnection();
            }
            catch (Exception)
            {
                Session["ProductDeleted"] = "error";
            }
            finally
            {
                Response.Redirect(ResolveUrl("~/admin/Product.aspx").ToString());
            }
        }
    }
}
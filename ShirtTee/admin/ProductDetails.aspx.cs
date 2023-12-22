using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@ProductId", Request.QueryString["product_id"])
                };
                SqlDataReader productDetails = dbconnection.ExecuteQuery(
                    "SELECT P.*, C.* FROM Product AS P INNER JOIN Category AS C ON P.category_id = C.category_id WHERE Product_ID=@ProductId", 
                    parameterUrl).ExecuteReader();


                if (productDetails.HasRows)
                {
                    productDetails.Read();
                    lblTitle.Text = (string)productDetails["product_name"];
                    lblSubTitle.Text = (string)productDetails["product_id"];


                    txtProdName.Text = (string)productDetails["product_name"];
                    txtProdDesc.Text = (string)productDetails["description"];
                    txtPrice.Text = productDetails["price"].ToString();
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

            }



        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            // Get the updated quantity value from the TextBox
            TextBox quantityTextBox = (TextBox)ListView1.Items[e.ItemIndex].FindControl("QuantityTextBox");
            string updatedQuantity = quantityTextBox.Text;

            // Update the data source with the new quantity
            SqlDataSource2.UpdateParameters["UpdatedQuantity"].DefaultValue = updatedQuantity;

            // You may also need to set other parameters like the primary key for the update

            // Perform the update
            SqlDataSource2.Update();

            // Cancel the update operation to prevent the default behavior
            e.Cancel = true;

            // Rebind the data to the ListView to reflect the changes
            ListView1.DataBind();
        }

        protected void ListView1_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {

        }
    }
}
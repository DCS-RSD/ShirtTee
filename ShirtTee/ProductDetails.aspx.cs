using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["product_ID"] != null)
            {
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@product_ID", Request.QueryString["product_ID"])
                };

                SqlDataReader productDetails = dbconnection.ExecuteQuery(
                    "SELECT * FROM [Stock] AS s"
                  + " INNER JOIN [Product] AS p ON s.product_ID = p.product_ID"
                  + " INNER JOIN [Color] AS c ON s.color_ID = c.color_ID"
                  + " INNER JOIN [Size] AS i ON s.size_ID = i.size_ID"
                  + " WHERE p.product_ID = @product_ID",
                parameterUrl).ExecuteReader();

                if (productDetails.HasRows)
                {
                    productDetails.Read();
                    lblProdName.Text = productDetails["product_name"].ToString();
                    lblDesc.Text = productDetails["description"].ToString();
                    lblPrice.Text = "RM" + productDetails["price"].ToString();

                }
            }

        }

        protected void btnAddToBag_Click(object sender, EventArgs e)
        {
            string prodID = "";
            Response.Redirect($"~/customer/Cart.aspx?customerid={prodID}");
        }

        protected void radColor_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton radioButton = (RadioButton)sender;
            string colorName = radioButton.Attributes["value"];


            Label1.Text = colorName;

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the RadioButton in the current Repeater item
                RadioButton radColor = (RadioButton)e.Item.FindControl("radColor");

                // Get the data item for the current Repeater item
                DataRowView dataItem = (DataRowView)e.Item.DataItem;

                // Set the value attribute dynamically based on the data
                if (radColor != null && dataItem != null)
                {
                    radColor.Attributes["value"] = dataItem["color_ID"].ToString();
                    radColor.Attributes["onclick"] = "handleRadioButtonClick(this);";
                }
            }
        }
    }
}
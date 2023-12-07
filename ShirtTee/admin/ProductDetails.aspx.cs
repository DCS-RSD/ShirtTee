using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Check if the product_id query parameter is present
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
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection conn = new SqlConnection(strCon);
                    conn.Open();

                    string strRetrieve = "SELECT * FROM Product WHERE Product_ID=@ProductId";
                    SqlCommand cmdRetrieve = new SqlCommand(strRetrieve, conn);

                    cmdRetrieve.Parameters.AddWithValue("@ProductId", Request.QueryString["product_id"]);

                    SqlDataReader productDetails = cmdRetrieve.ExecuteReader();

                    if (productDetails.HasRows)
                    {
                        productDetails.Read();
                        lblTitle.Text = (string)productDetails["product_name"];
                        lblSubTitle.Text = (string)productDetails["product_id"];


                        txtProdName.Text = (string)productDetails["product_name"];
                        txtProdDesc.Text = (string)productDetails["description"];
                        txtPrice.Text = productDetails["price"].ToString();


                    }

                    conn.Close();
                }
            }


        }
    }
}
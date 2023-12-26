﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class ProductStock : System.Web.UI.Page
    {
        protected override void OnPreRender(EventArgs e)
        {
            // Bind your ListView data here
            ListView1.DataSource = SqlDataSource2;
            ListView1.DataBind();
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



                    FileUpload fileImage = (FileUpload)ListView1.Items[itemIndex].FindControl("fileImage");
                    System.Diagnostics.Debug.WriteLine("---" + (fileImage == null ? "Fuck" : "jibai"));
                    System.Diagnostics.Debug.WriteLine(itemIndex+"-"+id);
                }
                
            }
        }


    }
}
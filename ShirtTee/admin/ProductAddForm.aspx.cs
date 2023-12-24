﻿using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class AddProductForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProdCategory.Enabled = true;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DBconnection dbconnection = new DBconnection();

            string sqlCommand = "INSERT INTO Product (category_ID, product_name, description, price, thumbnail) " +
                           "VALUES (@category_ID, @product_name, @description, @price, @thumbnail)";

            SqlParameter[] parameters = {
                new SqlParameter("@category_ID", ddlProdCategory.SelectedValue), 
                new SqlParameter("@product_name", txtProdName.Text),
                new SqlParameter("@description", txtProdDesc.Text),
                new SqlParameter("@price", Convert.ToDouble(txtPrice.Text)),
                new SqlParameter("@thumbnail", (object)fileThumbnail.FileBytes??DBNull.Value)
            };

            if (dbconnection.ExecuteNonQuery(sqlCommand,parameters))
            {
                Session["ProductAdded"] = true;
                Response.Redirect(ResolveUrl("~/admin/Product.aspx").ToString());
            }
            else
            {
                Response.Write("Error");
            }
        }
    }
}
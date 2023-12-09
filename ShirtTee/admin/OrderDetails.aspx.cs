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
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["order_status_id"] != null)
            {
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@order_status_id", Request.QueryString["order_status_id"])
                };
                SqlDataReader productDetails = dbconnection.ExecuteQuery("GetOrderDetails", parameterUrl)
                    .ExecuteReader();


                if (productDetails.HasRows)
                {
                    productDetails.Read();

                    lblTitle.Text = (string)productDetails["order_ID"];


                }
            }
        }
    }
}
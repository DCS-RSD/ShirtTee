using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
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
            if (Request.QueryString["order_id"] != null)
            {
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@order_id", Request.QueryString["order_id"])
                };
                SqlDataReader orderDetails = dbconnection.ExecuteQuery("GetOrderDetails", parameterUrl)
                    .ExecuteReader();



                if (orderDetails.HasRows)
                {
                    orderDetails.Read();

                    lblTitle.Text = "Order#" + (string)orderDetails["order_ID"];
                    lblOrderDate.Text = orderDetails["order_date"].ToString();

                    lblDeliveryAddress.Text = orderDetails["delivery_address"].ToString();

                    lblPaymentId.Text = orderDetails["payment_ID"].ToString();
                    lblPaymentMethod.Text = orderDetails["payment_name"].ToString();
                    lblPaymentDate.Text = orderDetails["payment_date"].ToString();

                    //lblSubtotal.Text = "RM " + orderDetails["subtotal"].ToString();
                    lblShippingFee.Text = "RM " + orderDetails["shipping_fee"].ToString();
                    //lblDiscount.Text = "- RM " + orderDetails["discount"].ToString();
                    lblVoucher.Text = orderDetails["voucher_name"].ToString() + "#" +
                        orderDetails["voucher_ID"].ToString();

                    lblOrderTotal.Text = "RM " + orderDetails["order_total"].ToString();
                    lblPoint.Text = orderDetails["member_points_earned"].ToString();

                    lblCustId.Text = orderDetails["customer_ID"].ToString();
                    lblCustName.Text = orderDetails["customer_name"].ToString();
                    hypCustEmail.Text = orderDetails["email"].ToString();
                    hypCustEmail.Attributes.Add("href", "mailto:" + orderDetails["email"].ToString());

                    hypContactNo.Text = orderDetails["phone_number"].ToString();
                    hypContactNo.Attributes.Add("href", "tel:" + orderDetails["phone_number"].ToString());

                }

                DBconnection dbconnection2 = new DBconnection();
                SqlParameter[] parameterUrl2 = new SqlParameter[]{
                 new SqlParameter("@order_id", Request.QueryString["order_id"])
                };
                SqlDataReader orderStatus = dbconnection2.ExecuteQuery("GetOrderStatus", parameterUrl2)
                    .ExecuteReader();
                int width;
                while (orderStatus.Read())
                {
                    
                    switch (orderStatus["status"].ToString().ToLower())
                    {
                        case "order placed":
                            width = 0;
                            break;
                        case "preparing":
                            width = 3;
                            break;
                        case "shipped":
                            width = 5;
                            break;
                        default:
                            width = 8;
                            btnNext.Enabled = false;
                            btnCancel.Enabled = false;
                            btnCancel.Visible = false;
                            btnNext.Visible = false;
                            break;
                    }
                    progressBar.Attributes["style"] = "width: calc((" + width + ") / 8 * 100%)";
                }

            }
        }
    }
}
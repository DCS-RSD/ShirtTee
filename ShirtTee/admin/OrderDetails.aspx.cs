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
                SqlDataReader orderDetails = dbconnection.ExecuteQuery(
                    "SELECT * FROM [Order] AS o" 
                    +" INNER JOIN [Customer] AS c ON c.customer_ID = o.customer_ID" 
                    +" INNER JOIN [Voucher] AS v ON v.voucher_ID = o.voucher_ID" 
                    +" INNER JOIN [Payment] AS p ON p.payment_ID = o.payment_ID" 
                    +" WHERE order_ID = @order_ID", 
                    parameterUrl).ExecuteReader();


                if (orderDetails.HasRows)
                {
                    orderDetails.Read();

                    lblTitle.Text = "Order#" + (string)orderDetails["order_ID"];
                    lblOrderDate.Text = orderDetails["order_date"].ToString();

                    lblDeliveryAddress.Text = orderDetails["delivery_address"].ToString();

                    lblPaymentId.Text = orderDetails["payment_ID"].ToString();
                    lblPaymentMethod.Text = orderDetails["payment_name"].ToString();
                    lblPaymentDate.Text = orderDetails["payment_date"].ToString();

                    lblSubtotal.Text = "RM " + orderDetails["subtotal"].ToString();
                    lblShippingFee.Text = "RM " + orderDetails["shipping_fee"].ToString();
                    lblDiscount.Text = "- RM " + orderDetails["discount"].ToString();
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
                SqlDataReader orderStatus = dbconnection2.ExecuteQuery("SELECT * FROM [Order] AS o INNER JOIN [Order_Status] AS os ON o.order_id = os.order_id WHERE o.order_ID = @order_ID",
                    parameterUrl2).ExecuteReader();
                int width = 0;
                while (orderStatus.Read())
                {
                    string status = orderStatus["status"].ToString().ToLower();
                    switch (status)
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
                        case "delivered":
                            width = 8;
                            break;
                    }

                    if (string.Equals(status,"delivered") || string.Equals(status, "cancel"))
                    {
                        btnNext.Enabled = false;
                        btnCancel.Enabled = false;
                        btnCancel.Visible = false;
                        btnNext.Visible = false;
                    }

                    progressBar.Attributes["style"] = "width: calc((" + width + ") / 8 * 100%)";
                    progressBar.Attributes["class"] += " bg-indigo-600";
                }

            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        string nextStatus, id, toEmail, receiverName;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["order_id"] == null)
            {
                Panel1.Visible = false;
                lblError.Visible = true;
                lblError.Text = "<div class=\"grid h-screen place-content-center bg-white px-4\">" +
                    "<h1 class=\"text-center uppercase tracking-widest text-gray-500\">404 | Not Found</h1>" +
                    "</div>";
            }
            else
            {
                if (Session["OrderStatusUpdated"] != null && !IsPostBack)
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
                }

                FetchData();

            }
        }

        private void FetchData()
        {
            DBconnection dbconnection = new DBconnection();
            SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@order_id", Request.QueryString["order_id"])
                };
            SqlDataReader orderDetails = dbconnection.ExecuteQuery(
                "SELECT * FROM [Order] AS o"
                + " INNER JOIN [AspNetUsers] AS c ON c.id = o.user_ID"
                + " LEFT JOIN [Voucher] AS v ON v.voucher_ID = o.voucher_ID"
                + " INNER JOIN [Payment] AS p ON p.payment_ID = o.payment_ID"
                + " WHERE order_ID = @order_ID",
                parameterUrl).ExecuteReader();


            if (orderDetails.HasRows)
            {
                orderDetails.Read();
                id = orderDetails["order_ID"].ToString();
                toEmail = orderDetails["Email"].ToString();
                receiverName = orderDetails["UserName"].ToString();

                lblTitle.Text = "Order#" + (string)orderDetails["order_ID"];
                lblOrderDate.Text = orderDetails["order_date"].ToString();

                lblDeliveryAddress.Text = orderDetails["delivery_address"].ToString();

                lblPaymentId.Text = orderDetails["payment_ID"].ToString();
                lblPaymentMethod.Text = orderDetails["payment_name"].ToString();
                lblPaymentDate.Text = orderDetails["payment_date"].ToString();

                lblSubtotal.Text = "RM " + orderDetails["subtotal"].ToString();
                lblShippingFee.Text = "RM " + orderDetails["shipping_fee"].ToString();
                lblDiscount.Text = orderDetails["discount"] == DBNull.Value ? "-" : "- RM " + orderDetails["discount"].ToString();
                lblVoucher.Text = orderDetails["voucher_name"].ToString() + "#" +
                    orderDetails["voucher_ID"].ToString();

                lblOrderTotal.Text = "RM " + orderDetails["order_total"].ToString();
                lblPoint.Text = orderDetails["member_points_earned"].ToString();

                lblCustId.Text = orderDetails["user_ID"].ToString();
                lblCustName.Text = orderDetails["UserName"].ToString();
                hypCustEmail.Text = orderDetails["Email"].ToString();
                hypCustEmail.Attributes.Add("href", "mailto:" + orderDetails["Email"].ToString());

                hypContactNo.Text = orderDetails["PhoneNumber"].ToString();
                hypContactNo.Attributes.Add("href", "tel:" + orderDetails["PhoneNumber"].ToString());

            }

            DBconnection dbconnection2 = new DBconnection();
            SqlParameter[] parameterUrl2 = new SqlParameter[]{
                 new SqlParameter("@order_id", Request.QueryString["order_id"])
                };
            SqlDataReader orderStatus = dbconnection2.ExecuteQuery("SELECT * FROM [Order] AS o INNER JOIN [Order_Status] AS os ON o.order_id = os.order_id WHERE o.order_ID = @order_ID",
                parameterUrl2).ExecuteReader();
            int width = 0;
            string tempStr = txtUpdateStatusDesc.Text;
            while (orderStatus.Read())
            {
                string status = orderStatus["status"].ToString().ToLower();
                switch (status)
                {
                    case "order placed":
                        width = 0;
                        if (!IsPostBack)
                        {
                            txtUpdateStatusDesc.Text = "We are preparing your order.";
                        }
                        nextStatus = "Preparing";
                        break;
                    case "preparing":
                        width = 3;
                        if (!IsPostBack)
                        {
                            txtUpdateStatusDesc.Text = "Your order is out of delivery";
                        }
                        nextStatus = "Shipped";
                        break;
                    case "shipped":
                        width = 5;
                        if (!IsPostBack)
                        {
                            txtUpdateStatusDesc.Text = "Your order has been delivered.";
                        }
                        nextStatus = "Delivered";
                        break;
                    case "delivered":
                        width = 8;
                        break;
                }

                if (string.Equals(status, "delivered") || string.Equals(status, "cancelled"))
                {
                    btnNext.Enabled = false;
                    btnCancel.Enabled = false;
                    btnCancel.Visible = false;
                    btnNext.Visible = false;
                }
                if (string.Equals(status, "cancelled"))
                {
                    progressBar.Attributes["class"] += " bg-red-600";
                }
                else
                {
                    progressBar.Attributes["class"] += " bg-indigo-600";
                }

                progressBar.Attributes["style"] = "width: calc((" + width + ") / 8 * 100%)";


            }
        }

        protected void btnCancelOrder_Click(object sender, EventArgs e)
        {
            try
            {
                DBconnection dbconnection = new DBconnection();

                string sqlCommand = "INSERT INTO [Order_Status] (status, update_date, order_ID, description) " +
                               "VALUES (@status, @update_date, @order_ID, @description)";

                SqlParameter[] parameters = {
                new SqlParameter("@status", "Cancelled"),
                new SqlParameter("@update_date", DateTime.Now),
                new SqlParameter("@order_ID", id),
                new SqlParameter("@description", txtUpdateStatusDesc.Text),
                };

                if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                {
                    Session["OrderStatusUpdated"] = "success";
                }
            }
            catch (Exception ex)
            {
                Session["OrderStatusUpdated"] = "error";
            }
            finally
            {
                FetchData();
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

        protected void btnSubmitNewStatus_Click(object sender, EventArgs e)
        {
            try
            {
                DBconnection dbconnection = new DBconnection();

                string sqlCommand = "INSERT INTO [Order_Status] (status, update_date, order_ID, description) " +
                               "VALUES (@status, @update_date, @order_ID, @description)";

                SqlParameter[] parameters = {
                new SqlParameter("@status", nextStatus),
                new SqlParameter("@update_date", DateTime.Now),
                new SqlParameter("@order_ID", id),
                new SqlParameter("@description", txtUpdateStatusDesc.Text),
                };

                if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                {
                    EmailManager.sendEmail(toEmail, receiverName, id);
                    Session["OrderStatusUpdated"] = "success";
                }
            }
            catch (Exception ex)
            {
                throw;
                System.Diagnostics.Debug.WriteLine(ex.Message);
                Session["OrderStatusUpdated"] = "error";
            }
            finally
            {
                FetchData();
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.customer
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["OrderStatusUpdated"] != null && !IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
            }

            FetchData();
        }

        private void FetchData()
        {
            if (Session["order_ID"] != null)
            {
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@order_ID", Session["order_ID"])
                };
                dbconnection.createConnection();
                SqlDataReader orderDetails = dbconnection.ExecuteQuery(
                    "SELECT * FROM [Order] AS o"
                    + " LEFT JOIN [Voucher] AS v ON v.voucher_ID = o.voucher_ID"
                    + " INNER JOIN [Payment] AS p ON p.payment_ID = o.payment_ID"
                    + " WHERE order_ID = @order_ID",
                    parameterUrl).ExecuteReader();
                if (orderDetails.HasRows)
                {
                    orderDetails.Read();
                    lblOrderID.Text = orderDetails["order_ID"].ToString();
                    lblOrderDate.Text = orderDetails["order_date"].ToString();

                    lblDeliveryAddress.Text = orderDetails["delivery_address"].ToString();

                    lblPaymentID.Text = orderDetails["payment_ID"].ToString();
                    lblPaymentName.Text = orderDetails["payment_name"].ToString();
                    lblPaymentDate.Text = orderDetails["payment_date"].ToString();

                    lblSubtotal.Text = orderDetails["subtotal"].ToString();
                    lblShippingFee.Text = orderDetails["shipping_fee"].ToString();
                    lblDiscount.Text = orderDetails["discount"] == DBNull.Value ? "-" : "- RM " + orderDetails["discount"].ToString();
                    if (!string.IsNullOrEmpty(orderDetails["voucher_name"].ToString()))
                    {
                        lblVoucherCode.Text = "(" + orderDetails["voucher_name"].ToString() + ")";
                    }


                    lblMemberPointEarned.Text = orderDetails["member_points_earned"].ToString();
                    lblTotal.Text = orderDetails["order_total"].ToString();

                }
                dbconnection.closeConnection();

                SqlParameter[] parameter2 = new SqlParameter[]{
                 new SqlParameter("@order_ID", Session["order_ID"])
                };
                dbconnection.createConnection();
                SqlDataReader orderStatus = dbconnection.ExecuteQuery(
                     "SELECT * FROM [Order_Status] " +
                     "WHERE order_ID = @order_ID AND " +
                     "update_date = (SELECT MAX(update_date) FROM [Order_Status] WHERE order_ID = @order_ID)",
                parameter2).ExecuteReader();
                int width = 0;
                if (orderStatus.HasRows) 
                {
                    orderStatus.Read();
                    string status = orderStatus["status"].ToString().ToLower();

                    lblRefundInfo.Visible = false;

                    switch (status)
                    {
                        case "order placed":
                            width = 0;
                            lblOrderStatusDetails.Text = "Order Placed on " + orderStatus["update_date"].ToString();
                            break;
                        case "preparing":
                            width = 3;
                            lblOrderStatusDetails.Text = "Processing on " + orderStatus["update_date"].ToString();
                            break;
                        case "shipped":
                            width = 5;
                            lblOrderStatusDetails.Text = "Shipped on " + orderStatus["update_date"].ToString();
                            break;
                        case "delivered":
                            width = 8;
                            lblOrderStatusDetails.Text = "Delivered on " + orderStatus["update_date"].ToString();
                            break;
                        case "cancelled":
                            lblOrderStatusDetails.Text = "Cancelled on " + orderStatus["update_date"].ToString();
                            lblRefundInfo.Visible = true;
                            lblOrderStatusDetails.Attributes["class"] += "text-red-500";
                            break;
                    }

                    if (!string.Equals(status, "order placed"))
                    {
                        btnCancel.Enabled = false;
                        btnCancel.Visible = false;
                        btnCancelDisabled.Visible = true;
                    }
                    else 
                    {
                        btnCancel.Enabled = true;
                        btnCancel.Visible = true;
                        btnCancelDisabled.Visible = false;
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
                dbconnection.closeConnection();

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
                    new SqlParameter("@order_ID", Session["order_ID"]),
                    new SqlParameter("@description", "Your order is cancelled."),
                };
                dbconnection.createConnection();
                if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                {
                    Session["OrderStatusUpdated"] = "success";
                }
                dbconnection.closeConnection();
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

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblPrice = (Label)e.Item.FindControl("lblPrice");
                Label lblTotal = (Label)e.Item.FindControl("lblTotal");

                DataRowView dataItem = (DataRowView)e.Item.DataItem;

                if (dataItem != null)
                {
                    lblPrice.Text = Convert.ToDouble(dataItem["price"]).ToString("F2");
                    lblTotal.Text = Convert.ToDouble(dataItem["total"]).ToString("F2");

                }
            }

        }
    }
}
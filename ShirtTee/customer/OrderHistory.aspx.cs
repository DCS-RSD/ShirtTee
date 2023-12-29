using Stripe;
using Stripe.Checkout;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Linq;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.customer
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            paymentStatusDiv.Visible = false;
            string sessionId = Request.QueryString["id"]; //stripe
            string cancel = Request.QueryString["cancel"]; //paypal
            if (!string.IsNullOrEmpty(sessionId))
            {
                // Use the sessionId to retrieve the session and check its status
                StripeConfiguration.ApiKey = ConfigurationManager.AppSettings["StripeSecretKey"];
                var service = new SessionService();
                var session = service.Get(sessionId);
                var paymentIntent = new PaymentIntentService();
                string checkPaymentID = "";
                if (session != null)
                {
                    checkPaymentID = session.PaymentIntentId;
                }
                DBconnection dBconnection = new DBconnection();
                SqlParameter[] para = new SqlParameter[]{
                   new SqlParameter("@payment_ID", checkPaymentID),
                };

                SqlDataReader payment = dBconnection.ExecuteQuery(
                    " SELECT * FROM [Payment]"
                  + " WHERE payment_ID = @payment_ID",
                para).ExecuteReader();
                if (!payment.HasRows && session != null)
                {
                    paymentStatusDiv.Visible = true;

                    if (session != null)
                    {
                        if (session.PaymentStatus == "paid")
                        {
                            // Payment successful
                            successIcon.Visible = true;
                            failedIcon.Visible = false;
                            lblStatus.Text = "paid";


                            DateTime orderDate = DateTime.Now;
                            string orderID = generateOrderId(orderDate);
                            Boolean loop = false;
                            do
                            {
                                if (loop)
                                {
                                    orderID = generateOrderId(orderDate);
                                }
                                loop = false;

                                SqlParameter[] parameterUrl = new SqlParameter[]{
                            new SqlParameter("@order_date", orderDate),
                            };

                                SqlDataReader order = dBconnection.ExecuteQuery(
                                    " SELECT order_ID FROM [Order]"
                                  + " WHERE order_date = @order_date",
                                    parameterUrl).ExecuteReader();

                                if (order.HasRows)
                                {
                                    while (order.Read())
                                    {
                                        if (order["order_ID"].ToString().Equals(orderID))
                                        {
                                            loop = true;
                                            break;
                                        }
                                    }
                                }
                            } while (loop);

                            //initialize all values
                            decimal total = Convert.ToDecimal(session.AmountTotal) / 100m;
                            string paymentID = session.PaymentIntentId;
                            string voucherID = null;
                            SqlParameter[] parameter = new SqlParameter[]{
                           new SqlParameter("@voucher_name", Session["discountCode"].ToString()),
                        };
                            SqlDataReader voucher = dBconnection.ExecuteQuery(
                               " SELECT * FROM [Voucher]"
                             + " WHERE voucher_name = @voucher_name",
                               parameter).ExecuteReader();
                            if (voucher.HasRows)
                            {
                                voucher.Read();
                                voucherID = voucher["voucher_ID"].ToString();
                            }
                            string deliveryAddress = "abc";
                            //Session["deliveryAddress"].ToString();
                            decimal shippingFee = Convert.ToDecimal(session.TotalDetails.AmountShipping) / 100m;
                            int memberPoint = Convert.ToInt32(session.AmountTotal) / 100;
                            decimal subtotal = Convert.ToDecimal(session.AmountSubtotal) / 100m;
                            decimal discount = Convert.ToDecimal(session.TotalDetails.AmountDiscount) / 100m;

                            //create payment
                            var list = paymentIntent.Get(session.PaymentIntentId);
                            string paymentName = list.PaymentMethodTypes[0];
                            DateTime paymentDate = session.Created;
                            try
                            {
                                string createPaymentDetails =
                                    "INSERT INTO [Payment] (payment_ID, payment_name, payment_date) " +
                                    "VALUES (@payment_ID, @payment_name, @payment_date)";
                                SqlParameter[] parameters5 = {
                                new SqlParameter("@payment_ID", paymentID),
                                new SqlParameter("@payment_name", paymentName),
                                new SqlParameter("@payment_date", paymentDate)
                            };
                                dBconnection.ExecuteNonQuery(createPaymentDetails, parameters5);

                            }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine(ex.Message + "1"); }

                            //create order
                            try
                            {
                                //with voucher
                                string createOrder =
                                   "INSERT INTO [Order] (order_ID, order_date, order_total, payment_ID, voucher_ID, delivery_address, shipping_fee, member_points_earned, user_ID, subtotal, discount) " +
                                   "VALUES (@order_ID, @order_date, @order_total, @payment_ID, @voucher_ID, @delivery_address, @shipping_fee, @member_point, @user_ID, @subtotal, @discount)";

                                SqlParameter[] withVoucher = {
                                new SqlParameter("@order_ID", orderID),
                                new SqlParameter("@order_date", orderDate),
                                new SqlParameter("@order_total", total),
                                new SqlParameter("@payment_ID", paymentID),
                                new SqlParameter("@voucher_ID", voucherID),
                                new SqlParameter("@delivery_address", deliveryAddress),
                                new SqlParameter("@shipping_fee", shippingFee),
                                new SqlParameter("@member_point", memberPoint),
                                new SqlParameter("@user_ID", Session["user_ID"].ToString()),
                                new SqlParameter("@subtotal", subtotal),
                                new SqlParameter("@discount", discount)
                            };

                                Boolean orderCreated = false;
                                //without voucher
                                if (voucherID == null)
                                {
                                    createOrder =
                                        "INSERT INTO [Order] (order_ID, order_date, order_total, payment_ID, delivery_address, shipping_fee, member_points_earned, user_ID, subtotal, discount) " +
                                        "VALUES (@order_ID, @order_date, @order_total, @payment_ID, @delivery_address, @shipping_fee, @member_point, @user_ID, @subtotal, @discount)";
                                    SqlParameter[] withoutVoucher = {
                                        new SqlParameter("@order_ID", orderID),
                                        new SqlParameter("@order_date", orderDate),
                                        new SqlParameter("@order_total", total),
                                        new SqlParameter("@payment_ID", paymentID),
                                        new SqlParameter("@delivery_address", deliveryAddress),
                                        new SqlParameter("@shipping_fee", shippingFee),
                                        new SqlParameter("@member_point", memberPoint),
                                        new SqlParameter("@user_ID", Session["user_ID"].ToString()),
                                        new SqlParameter("@subtotal", subtotal),
                                        new SqlParameter("@discount", discount)
                                    };
                                    if (dBconnection.ExecuteNonQuery(createOrder, withoutVoucher)) { orderCreated = true; }
                                }
                                else //with voucher
                                {
                                    if (dBconnection.ExecuteNonQuery(createOrder, withVoucher)) { orderCreated = true; }
                                }

                                if (orderCreated)
                                {
                 
                                    //add member points
                                    try
                                    {
                                        string addMemberPoints =
                                            "UPDATE [AspNetUsers] SET " +
                                            "member_points = member_points + @member_points_earned " +
                                            "WHERE Id = @user_ID";
                                        SqlParameter[] param = {
                                            new SqlParameter("@member_points_earned", memberPoint),
                                            new SqlParameter("@user_ID", Session["user_ID"])
                                        };
                                        dBconnection.ExecuteNonQuery(addMemberPoints, param);
                                    }
                                    catch (Exception ex) { System.Diagnostics.Debug.WriteLine(ex.Message + "6"); }



                                    //create order status
                                    try
                                    {
                                        string createStatus =
                                            "INSERT INTO [Order_Status] (status, update_date, order_ID, description) " +
                                            "VALUES (@status, @update_date, @order_ID, @description) ";
                                        SqlParameter[] parameters1 = {
                                        new SqlParameter("@status", "Order Placed"),
                                        new SqlParameter("@update_date", DateTime.Now),
                                        new SqlParameter("@order_ID", orderID),
                                        new SqlParameter("@description", "We received your order.")
                                    };
                                        dBconnection.ExecuteNonQuery(createStatus, parameters1);
                                    }
                                    catch (Exception ex) { System.Diagnostics.Debug.WriteLine(ex.Message + "4"); }


                                    //read cart details
                                    SqlParameter[] parameters2 = new SqlParameter[]{
                                    new SqlParameter("@user_ID", Session["user_ID"].ToString()),
                                };
                                    SqlDataReader cart = dBconnection.ExecuteQuery(
                                       " SELECT * FROM [Cart]"
                                     + " WHERE user_ID = @user_ID",
                                       parameters2).ExecuteReader();
                                    if (cart.HasRows)
                                    {
                                        //create order details
                                        while (cart.Read())
                                        {
                                            string createDetails =
                                                "INSERT INTO [Order_Details] (order_ID, product_details_ID, quantity, total) " +
                                                "VALUES (@order_ID, @product_details_ID, @quantity, @total)";
                                            SqlParameter[] parameters3 = {
                                        new SqlParameter("@order_ID", orderID),
                                        new SqlParameter("@product_details_ID", cart["product_details_ID"]),
                                        new SqlParameter("@quantity", cart["quantity"]),
                                        new SqlParameter("@total", cart["subtotal"])
                                    };
                                            dBconnection.ExecuteNonQuery(createDetails, parameters3);
                                        }
                                    }

                                    //clear cart
                                    string clearCart =
                                        "DELETE FROM [Cart] " +
                                        "WHERE user_ID = @user_ID";
                                    SqlParameter[] parameters4 = {
                                new SqlParameter("@user_ID", Session["user_ID"])
                            };
                                    dBconnection.ExecuteNonQuery(clearCart, parameters4);
                                };
                            }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine(ex.Message + "2"); }



                        }
                        else
                        {
                            successIcon.Visible = false;
                            failedIcon.Visible = true;
                            // Payment canceled
                            lblStatus.Text = "error";
                            lblPaymentTitle.Text = "Payment Failed !";
                            lblPaymentDesc.Text = "You have cancelled your payment, please try again.";
                        }
                    }
                    else
                    {
                        // Unable to retrieve session, handle accordingly
                        lblStatus.Text = "error";
                    }
                }

            }
            else if (!string.IsNullOrEmpty(cancel))
            {
                paymentStatusDiv.Visible = true;
                if (cancel == "false")
                {
                    // Payment successful
                    // You can perform additional actions here
                    successIcon.Visible = true;
                    failedIcon.Visible = false;
                    lblStatus.Text = "paid";

                }
                else
                {
                    successIcon.Visible = false;
                    failedIcon.Visible = true;
                    lblStatus.Text = "error";
                    lblPaymentTitle.Text = "Payment Failed !";
                    lblPaymentDesc.Text = "You have cancelled your payment, please try again.";
                }
            }
            else
            {
                // No session ID in the query parameters, handle accordingly
                lblStatus.Text = "error";
                paymentStatusDiv.Visible = false;
            }



        }

        private string generateOrderId(DateTime orderDate)
        {
            string datetime = orderDate.ToString("yyyyMMddHHmmss");
            string random = generateRandom(6);
            return $"{datetime}{random}";
        }

        private string generateRandom(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            Random random = new Random();
            char[] randomArray = new char[length];
            for (int i = 0; i < length; i++)
            {
                randomArray[i] = chars[random.Next(chars.Length)];
            }
            return new string(randomArray);
        }

        protected void btnViewOrder_Click(object sender, EventArgs e)
        {
            Button btnViewOrder = (Button)sender;
            RepeaterItem repeaterItem = (RepeaterItem)btnViewOrder.NamingContainer;
            Label lblOrderID = (Label)repeaterItem.FindControl("lblOrderID");
            Session["order_ID"] = lblOrderID.Text;
            Response.Redirect($"~/customer/OrderDetails.aspx");
        }

        protected void btnWriteReview_Click(object sender, EventArgs e)
        {
            Button btnWriteReview = (Button)sender;
            RepeaterItem repeaterItem = (RepeaterItem)btnWriteReview.NamingContainer;
            Label lblOrderID = (Label)repeaterItem.FindControl("lblOrderID");
            //Session[""]
            Response.Redirect($"~/customer/WriteReview.aspx");
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblOrderID = (Label)e.Item.FindControl("lblOrderID");
                Label lblOrderDate = (Label)e.Item.FindControl("lblOrderDate");
                Label lblOrderTotal = (Label)e.Item.FindControl("lblOrderTotal");
                Label lblOrderStatus = (Label)e.Item.FindControl("lblOrderStatus");
                Label lblDisplayStatus = (Label)e.Item.FindControl("lblDisplayStatus");
                Label lblVoucherCode = (Label)e.Item.FindControl("lblVoucherCode");
                Label lblDisplayVoucher = (Label)e.Item.FindControl("lblDisplayVoucher");

                DataRowView dataItem = (DataRowView)e.Item.DataItem;

                if (dataItem != null)
                {
                    lblOrderID.Text = dataItem["order_ID"].ToString();
                    DateTime orderDate = Convert.ToDateTime(dataItem["order_date"].ToString());
                    lblOrderDate.Text = orderDate.ToString("dd MMM yyyy");
                    double orderTotal = Convert.ToDouble(dataItem["order_total"].ToString());
                    lblOrderTotal.Text = orderTotal.ToString("F2");
                    DBconnection dBconnection = new DBconnection();
                    SqlParameter[] parameter = new SqlParameter[]{
                         new SqlParameter("@order_ID", dataItem["order_ID"].ToString())
                    };
                    SqlDataReader orderStatus = dBconnection.ExecuteQuery(
                        "SELECT * FROM [Order_Status] " +
                        "WHERE order_ID = @order_ID AND " +
                        "update_date = (SELECT MAX(update_date) FROM [Order_Status] WHERE order_ID = @order_ID)",
                    parameter).ExecuteReader();
                    if (orderStatus.HasRows) 
                    {
                        orderStatus.Read();
                        lblOrderStatus.Text = orderStatus["status"].ToString();
                        GetStatusClass(orderStatus["status"].ToString(), lblDisplayStatus);
                    }
                    
                    if (dataItem["voucher_ID"] != null) 
                    {
                        SqlParameter[] p = new SqlParameter[]{
                         new SqlParameter("@voucher_ID", dataItem["voucher_ID"].ToString())
                        };
                        string v = dataItem["voucher_ID"].ToString();
                        SqlDataReader voucher = dBconnection.ExecuteQuery(
                            "SELECT * FROM [Voucher] " +
                            "WHERE voucher_ID = @voucher_ID ",
                        p).ExecuteReader();
                        if (voucher.HasRows) 
                        {
                            voucher.Read();
                            lblDisplayVoucher.Visible = true;
                            lblVoucherCode.Text = voucher["voucher_name"].ToString();
                        }

                    }
                }
            }
        }

        protected void GetStatusClass(string status, Label lblDisplayStatus)
        {
            string existingClass = lblDisplayStatus.CssClass;

            switch (status)
            {
                case "Order Placed":
                    lblDisplayStatus.CssClass = $"{existingClass} bg-teal-200 text-teal-800 dark:bg-teal-500/10 dark:text-teal-500";
                    break;
                case "Preparing":
                    lblDisplayStatus.CssClass = $"{existingClass} bg-yellow-100 text-yellow-800 dark:bg-yellow-500/10 dark:text-yellow-500";
                    break;
                case "Shipped":
                    lblDisplayStatus.CssClass = $"{existingClass} bg-blue-100 text-blue-600 dark:bg-blue-600/10 dark:text-blue-500";
                    break;
                case "Delivered":
                    lblDisplayStatus.CssClass = $"{existingClass} bg-gray-200 text-gray-800 dark:bg-slate-500/20 dark:text-slate-400";
                    break;
                case "Cancelled":
                    lblDisplayStatus.CssClass = $"{existingClass} bg-red-200 text-red-800 dark:bg-red-500/10 dark:text-red-500";

                    break;
                default:
                    break;
            }
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblPrice = (Label)e.Item.FindControl("lblPrice");
                Label lblTotal = (Label)e.Item.FindControl("lblTotal");

                DataRowView dataItem = (DataRowView)e.Item.DataItem;

                if (dataItem != null)
                {
                    double price = Convert.ToDouble(dataItem["price"].ToString());
                    lblPrice.Text = price.ToString("F2");
                    double total = Convert.ToDouble(dataItem["total"].ToString());
                    lblTotal.Text = total.ToString("F2");
                }
            }
        }
    }
}
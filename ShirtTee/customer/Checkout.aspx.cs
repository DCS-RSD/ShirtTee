using Stripe.Checkout;
using Stripe;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PayPal.Api;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using System.Data.Odbc;

namespace ShirtTee.customer
{
    public partial class Checkout : System.Web.UI.Page
    {
        public string sessionId = "";

        protected override void OnPreRender(EventArgs e)
        {
            Repeater1.DataBind();

      
        }





        protected void Page_Load(object sender, EventArgs e)
        {

            
            //lbl1.Text = Session["voucherApplied"].ToString();

            DBconnection dbconnection = new DBconnection();
            double subtotal = 0;
            SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@user_ID", Session["user_ID"]),
            };

            SqlDataReader cartDetails = dbconnection.ExecuteQuery(
                " SELECT * FROM [Cart] AS c"
              + " WHERE user_ID = @user_ID",
                parameterUrl).ExecuteReader();

            if (cartDetails.HasRows)
            {
                while (cartDetails.Read())
                {
                    subtotal += Convert.ToDouble(cartDetails["subtotal"].ToString());
                }
            }
            else
            {
                subtotal = 0;
            }

            double shipping = 0, discountValue = 0, total;

            lblSubtotal.Text = subtotal.ToString("F2");
            if (Session["discountValue"] != null)
            {
                discountValue = Convert.ToDouble(Session["discountValue"].ToString());
                lblDiscount.Text = discountValue.ToString("F2");
                if (discountValue != 0)
                {
                    lblVoucherCode.Text = "(" + Session["discountCode"] + ")";
                }
            }
            else
            {
                discountValue = 0;
                lblDiscount.Text = "0.00";
                lblVoucherCode.Text = "";
            }
            if (Session["shipping"] != null)
            {

                shipping = Convert.ToDouble(Session["shipping"].ToString());
                lblShipping.Text = shipping.ToString("F2");
            }
            else
            {
                lblShipping.Text = "0.00";
            }
            total = subtotal + shipping - discountValue;
            lblTotal.Text = total.ToString("F2");


            SqlParameter[] parameterUrl2 = new SqlParameter[]{
                 new SqlParameter("@user_ID", Session["user_ID"]),
            };

            SqlDataReader cartInfo = dbconnection.ExecuteQuery(
                " SELECT * FROM [Cart] AS c" +
                " INNER JOIN [Product_Details] AS d ON c.product_details_ID = d.product_details_ID" +
                " WHERE user_ID = @user_ID",
            parameterUrl2).ExecuteReader();
            bool cont = true;
            if (cartInfo.HasRows)
            {
                while (cartInfo.Read())
                {
                    if (Convert.ToInt32(cartInfo["quantity"].ToString()) > Convert.ToInt32(cartInfo["stock_available"].ToString()))
                    {
                        cont = false;
                        lblWarning.Visible = true;
                    }

                }
                if (cont)
                {
                    callFPX();
                }
            }




        }

        protected void callFPX()
        {

            DBconnection dbconnection = new DBconnection();
            SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@user_ID", Session["user_ID"]),
            };

            SqlDataReader cartDetails = dbconnection.ExecuteQuery(
                " SELECT * FROM [Cart] AS c" +
                " INNER JOIN [Product_Details] AS d ON c.product_details_ID = d.product_details_ID" +
                " INNER JOIN [Product] AS p ON d.product_ID = p.product_ID" +
                " INNER JOIN [Color] AS o ON d.color_ID = o.color_ID" +
                " INNER JOIN [Size] AS s ON d.size_ID = s.size_ID" +
                " WHERE user_ID = @user_ID",
            parameterUrl).ExecuteReader();
            var items = new List<SessionLineItemOptions>();
            if (cartDetails.HasRows)
            {
                while (cartDetails.Read())
                {
                    items.Add(new SessionLineItemOptions
                    {
                        PriceData = new SessionLineItemPriceDataOptions
                        {
                            UnitAmount = (long)Convert.ToDouble(cartDetails["price"]) * 100,
                            Currency = "myr",
                            ProductData = new SessionLineItemPriceDataProductDataOptions
                            {
                                Name = cartDetails["product_name"].ToString(),
                                Description = cartDetails["color_name"].ToString() + ", " + cartDetails["size_name"].ToString(),
                            },
                        },
                        Quantity = (long)Convert.ToInt32(cartDetails["quantity"]),
                    });
                }
            }

            var shipping = new List<SessionShippingOptionOptions>();
            if (Convert.ToDouble(Session["shipping"]) == 0)
            {
                //shipping free
                shipping.Add(new SessionShippingOptionOptions { ShippingRate = "shr_1OS2AVFglGOSlsymaAj05Mih" });
            }
            else
            {
                //shipping RM 12.00
                shipping.Add(new SessionShippingOptionOptions { ShippingRate = "shr_1OS1yRFglGOSlsym0DVPXvEB" });
            }

            try
            {
                StripeConfiguration.ApiKey = ConfigurationManager.AppSettings["StripeSecretKey"];

                SessionCreateOptions options;

                string discountCode = null;

                if (Session["discountCode"] != null)
                {
                    discountCode = Session["discountCode"].ToString();
                }


                if (!string.IsNullOrEmpty(discountCode))
                {
                    options = new SessionCreateOptions
                    {
                        PaymentMethodTypes = new List<String> {
                            "fpx",
                            "card",
                            "grabpay"
                        },
                        LineItems = items,
                        Mode = "payment",
                        Discounts = new List<SessionDiscountOptions>
                        {
                            new SessionDiscountOptions { Coupon = discountCode },
                        },
                        Customer = Session["user_ID"].ToString(),
                        ShippingOptions = shipping,
                        SuccessUrl = "https://localhost:44374/customer/OrderHistory.aspx?id={CHECKOUT_SESSION_ID}",
                        CancelUrl = "https://localhost:44374/customer/OrderHistory.aspx?id={CHECKOUT_SESSION_ID}",

                    };
                }
                else
                {
                    options = new SessionCreateOptions
                    {
                        PaymentMethodTypes = new List<String> {
                    "fpx",
                    "card",
                    "grabpay"
                },
                        LineItems = items,
                        Mode = "payment",
                        ShippingOptions = shipping,
                        SuccessUrl = "https://localhost:44374/customer/OrderHistory.aspx?id={CHECKOUT_SESSION_ID}",
                        CancelUrl = "https://localhost:44374/customer/OrderHistory.aspx?id={CHECKOUT_SESSION_ID}",

                    };
                }

                var service = new SessionService();
                Session session = service.Create(options);
                sessionId = session.Id;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }




        }


        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                string shippingAddress = txtAddressLine1.Text + " " + txtAddressLine2.Text + " " + txtCity.Text + " " + txtPostalCode.Text + " " + ddlState.SelectedValue + " " + "Malaysia";
                Session["shippingAddress"] = shippingAddress;

                Page.ClientScript.RegisterStartupScript(this.GetType(), "SubmitAPI", "submitAPI();", true);

            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblLowStock = (Label)e.Item.FindControl("lblLowStock");
                Label lblEachSubtotal = (Label)e.Item.FindControl("lblEachSubtotal");
                Label lblPrice = (Label)e.Item.FindControl("lblPrice");

                DataRowView dataItem = (DataRowView)e.Item.DataItem;

                double price = Convert.ToDouble(dataItem["price"].ToString());
                lblPrice.Text = price.ToString("F2");
                double subtotal = Convert.ToDouble(dataItem["subtotal"].ToString());
                lblEachSubtotal.Text = subtotal.ToString("F2");

                if (Convert.ToInt32(dataItem["quantity"].ToString()) > Convert.ToInt32(dataItem["stock_available"].ToString()))
                {
                    lblLowStock.Visible = true;
                }
                else
                {
                    lblLowStock.Visible = false;
                }



            }

        }


        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


    }
}
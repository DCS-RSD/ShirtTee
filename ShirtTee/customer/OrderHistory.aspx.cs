using Stripe;
using Stripe.Checkout;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.customer
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sessionId = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(sessionId))
            {
                // Use the sessionId to retrieve the session and check its status
                StripeConfiguration.ApiKey = ConfigurationManager.AppSettings["StripeSecretKey"];
                var service = new SessionService();
                var session = service.Get(sessionId);

                if (session != null)
                {
                    if (session.PaymentStatus == "paid")
                    {
                        // Payment successful
                        // You can perform additional actions here
                        lblStatus.Text = session.PaymentIntentId;

                    }
                    else if (session.PaymentStatus == "canceled")
                    {
                        // Payment canceled
                        // You can handle this case as needed
                        lblStatus.Text = "Payment Cancelled";
                        lblPaymentTitle.Text = "Payment Failed !";
                        lblPaymentDesc.Text = "You have cancelled your payment, please try again.";

                    }
                    else
                    {
                        // Payment failed or in another state
                        // You can handle this case as needed
                        lblStatus.Text = "Payment Failed";
                    }
                }
                else
                {
                    // Unable to retrieve session, handle accordingly
                    lblStatus.Text = "Error: Unable to retrieve payment information.";
                }
            }
            else
            {
                // No session ID in the query parameters, handle accordingly
                lblStatus.Text = "error";
            }
        }
    }
}
using Stripe;
using Stripe.Checkout;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Linq;
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
            string sessionId = Request.QueryString["id"]; //stripe
            string cancel = Request.QueryString["cancel"]; //paypal
            if (!string.IsNullOrEmpty(sessionId))
            {
                paymentStatusDiv.Visible = true;

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
                        successIcon.Visible = true;
                        failedIcon.Visible = false;
                        lblStatus.Text = session.PaymentIntentId;

                    }
                    else
                    {
                        successIcon.Visible = false;
                        failedIcon.Visible = true;
                        // Payment canceled
                        // You can handle this case as needed
                        lblStatus.Text = "Payment Cancelled";
                        lblPaymentTitle.Text = "Payment Failed !";
                        lblPaymentDesc.Text = "You have cancelled your payment, please try again.";
                    }
                }
                else
                {
                    // Unable to retrieve session, handle accordingly
                    lblStatus.Text = "Error: Unable to retrieve payment information.";
                }
            }
            else if (!string.IsNullOrEmpty(cancel)) { 
                paymentStatusDiv.Visible = true;
                if (cancel == "false")
                {
                    // Payment successful
                    // You can perform additional actions here
                    successIcon.Visible = true;
                    failedIcon.Visible = false;

                }
                else
                {
                    successIcon.Visible = false;
                    failedIcon.Visible = true;
                    lblStatus.Text = "Payment Cancelled";
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

        protected void btnViewOrder_Click(object sender, EventArgs e)
        {
            string cartID = "";
            Response.Redirect($"~/customer/OrderDetails.aspx?customerid={cartID}");
        }

        protected void btnWriteReview_Click(object sender, EventArgs e)
        {
            string cartID = "";
            Response.Redirect($"~/customer/WriteReview.aspx?customerid={cartID}");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PayPal.Api;
using Stripe.Checkout;
using Stripe;
using System.Configuration;

namespace ShirtTee
{
    public partial class Checkout : System.Web.UI.Page
    {
        public string sessionId = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            StripeConfiguration.ApiKey = ConfigurationManager.AppSettings["StripeSecretKey"];
           

            var options = new SessionCreateOptions
            {
                PaymentMethodTypes = new List<String> {
                "fpx",
                "card",
                "grabpay"
                },
                LineItems = new List<SessionLineItemOptions>
                {
                  new SessionLineItemOptions
                  {
                      PriceData = new SessionLineItemPriceDataOptions
                      {
                       UnitAmount = 1000,
                       Currency = "myr",
                       ProductData = new SessionLineItemPriceDataProductDataOptions
                       {
                        Name = "T-shirt",

                       },
                      },
                    Quantity = 1,
                  },
                },
                Mode = "payment",
                SuccessUrl = "https://localhost:44374/SuccessPayment.aspx?id={CHECKOUT_SESSION_ID}",
                CancelUrl = "https://localhost:44306/Cancel.aspx",

            };

            var service = new SessionService();
            Session session = service.Create(options);
            sessionId = session.Id;
        }
    }
}
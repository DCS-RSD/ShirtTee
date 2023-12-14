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

namespace ShirtTee.customer
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
                SuccessUrl = "https://localhost:44374/customer/OrderHistory.aspx?id={CHECKOUT_SESSION_ID}",
                CancelUrl = "https://localhost:44374/customer/OrderHistory.aspx?id={CHECKOUT_SESSION_ID}",

            };

            var service = new SessionService();
            Session session = service.Create(options);
            sessionId = session.Id;
        }

        protected void btnHidden_Click(object sender, EventArgs e)
        {
            decimal postagePackingCost = 0.01m;
            decimal examPaperPrice = 0.01m;
            int quantityOfExamPapers = 1;
            decimal subtotal = (quantityOfExamPapers * examPaperPrice);
            decimal total = subtotal + postagePackingCost;
            // Authenticate with PayPal
            var config = ConfigManager.Instance.GetProperties();
            var accessToken = new OAuthTokenCredential(config).GetAccessToken();
            //Get APIContext Object
            var apiContext = new APIContext(accessToken);
            var examPaperItem = new Item();
            examPaperItem.name = "Past Exam Paper";
            examPaperItem.currency = "MYR";
            examPaperItem.price = examPaperPrice.ToString();
            examPaperItem.sku = "PEPCO5027m15"; //sku is stock keeping unit e.g. manufacturer code
            examPaperItem.quantity = quantityOfExamPapers.ToString();
            var transactionDetails = new Details();
            transactionDetails.tax = "0";
            transactionDetails.shipping = postagePackingCost.ToString();
            transactionDetails.subtotal = subtotal.ToString("0.00");
            var transactionAmount = new Amount();
            transactionAmount.currency = "MYR";
            transactionAmount.total = total.ToString("0.00");
            transactionAmount.details = transactionDetails;
            var transaction = new Transaction();
            transaction.description = "Your order of Past Exam papers";
            transaction.invoice_number = Guid.NewGuid().ToString(); //this should ideally be the id of a record storing the order
            transaction.amount = transactionAmount;
            transaction.item_list = new ItemList
            {
                items = new List<Item> { examPaperItem }
            };
            var payer = new Payer();
            payer.payment_method = "paypal";
            var redirectUrls = new RedirectUrls();
            redirectUrls.cancel_url = "https://localhost:44374/customer/Cart.aspx";
            redirectUrls.return_url = "https://localhost:44374/customer/OrderHistory.aspx";
            var payment = Payment.Create(apiContext, new Payment
            {
                intent = "sale",
                payer = payer,
                transactions = new List<Transaction> { transaction },
                redirect_urls = redirectUrls
            });
            Session["paymentId"] = payment.id;
            foreach (var link in payment.links)
            {
                if (link.rel.ToLower().Trim().Equals("approval_url"))
                {
                    Response.Redirect(link.href);
                };
            }

        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            btnHidden_Click(null, EventArgs.Empty);
        }
    }
}
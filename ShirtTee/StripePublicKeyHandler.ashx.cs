using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace ShirtTee
{
    /// <summary>
    /// Summary description for StripePublicKeyHandler
    /// </summary>
    public class StripePublicKeyHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            string stripePublicKey = ConfigurationManager.AppSettings["StripePublicKey"];

            context.Response.ContentType = "application/json";
            context.Response.Write($"{{ \"stripePublicKey\": \"{stripePublicKey}\" }}");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
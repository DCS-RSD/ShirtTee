using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace ShirtTee
{
    /// <summary>
    /// Summary description for StripePublicLiveKeyHandler
    /// </summary>
    public class StripePublicLiveKeyHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string stripePublicLiveKey = ConfigurationManager.AppSettings["StripePublicLiveKey"];

            context.Response.ContentType = "application/json";
            context.Response.Write($"{{ \"stripePublicLiveKey\": \"{stripePublicLiveKey}\" }}");
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
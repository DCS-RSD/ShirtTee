using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace ShirtTee
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            SiteMapProvider siteMapProvider = SiteMap.Providers["AdminSiteMapProvider"];
            // Code that runs on application startup
            siteMapProvider.SiteMapResolve += SiteMap_SiteMapResolve;
        }

        SiteMapNode SiteMap_SiteMapResolve(object sender, SiteMapResolveEventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("113331222");
            SiteMapProvider siteMapProvider = SiteMap.Providers["AdminSiteMapProvider"];

            SiteMapNode currentNode = siteMapProvider.CurrentNode.Clone(true);
            SiteMapNode tempNode = currentNode;

            if (currentNode.ParentNode.Url.Contains("/admin/ProductDetails.aspx"))
            {
                System.Diagnostics.Debug.WriteLine("111222");

                currentNode.ParentNode.Url += "?product_id=" + e.Context.Request["product_id"];
                currentNode.ParentNode.Title += "sss";
            }

            return currentNode;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            if (Request.Cookies["user_ID"] != null)
            {
                Session["user_ID"] = Request.Cookies["user_ID"].Value;
            }
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}


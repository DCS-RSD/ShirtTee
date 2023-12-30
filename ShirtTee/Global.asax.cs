using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using WingtipToys.Logic;

namespace ShirtTee
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            SiteMapProvider siteMapProvider = SiteMap.Providers["AdminSiteMapProvider"];
            siteMapProvider.SiteMapResolve += SiteMap_SiteMapResolve;

            RoleActions roleActions = new RoleActions();
            roleActions.AddUserAndRole();
        }

        SiteMapNode SiteMap_SiteMapResolve(object sender, SiteMapResolveEventArgs e)
        {
            SiteMapProvider siteMapProvider = SiteMap.Providers["AdminSiteMapProvider"];
            SiteMapNode currentNode = siteMapProvider.CurrentNode.Clone(true);
            SiteMapNode tempNode = currentNode;

            string queryString= "?product_id=" + e.Context.Request["product_id"];

            if (currentNode.Title.Equals("Stock"))
            {
                currentNode.ParentNode.Url += queryString;
            }

            if (currentNode.Title.Equals("Add Stock"))
            {
                currentNode.ParentNode.Url += queryString;
                currentNode.ParentNode.ParentNode.Url += queryString;
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


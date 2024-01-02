using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using WingtipToys.Logic;
using Microsoft.Owin.Security;
using System.IO;
using System.Text;
using Stripe.Terminal;

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

            string queryString = "?product_id=" + e.Context.Request["product_id"];

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
            System.Diagnostics.Debug.WriteLine("start 1");

            if (Request.Cookies["user_ID"] != null)
            {
                System.Diagnostics.Debug.WriteLine("start");
                var identityDbContext = new IdentityDbContext("ConnectionString");

                var userStore = new UserStore<IdentityUser>(identityDbContext);
                var manager = new UserManager<IdentityUser>(userStore);
                var user = manager.FindById(Request.Cookies["user_ID"].Value);
                if (user != null)
                {
                    System.Diagnostics.Debug.WriteLine("auto login");

                    //logUserIn
                    var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                    var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                    authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);
                    Session["user_ID"] = user.Id;
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("wrong cookie");
                    Request.Cookies.Remove("user_ID");
                }

            }


            if (HttpContext.Current != null && HttpContext.Current.User.Identity.IsAuthenticated)
            {
                System.Diagnostics.Debug.WriteLine("give session id");

                Session["user_ID"] = HttpContext.Current.User.Identity.GetUserId();
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

            Exception error = Server.GetLastError();
            Server.ClearError();

            string logContent = "[" + DateTime.Now + "] " + error + " at " + Request.Url.ToString();
            string fileName = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "log/log.txt");

            try
            {
                string directoryPath = Path.GetDirectoryName(fileName);

                // Check if the directory exists, and create it if it doesn't
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                if (!File.Exists(fileName))
                {
                    File.Create(fileName).Close(); // Make sure to close the FileStream
                }

                // Appending the given texts
                using (StreamWriter sw = File.AppendText(fileName))
                {
                    sw.WriteLine(logContent + "\n");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error log: " + ex.Message);
            }
            finally
            {
                Response.Redirect("errors/500.aspx");
            }

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}


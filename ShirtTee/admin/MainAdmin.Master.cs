using Microsoft.AspNet.Identity;
using System;
using System.Web;

namespace ShirtTee.admin
{
    public partial class MainAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsername.Text = HttpContext.Current.User.Identity.GetUserName();

            string activeNavClass = "flex items-center gap-x-3.5 py-2 px-2.5  text-sm bg-gray-100 text-slate-700 rounded-lg dark:bg-gray-900  dark:text-white dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600";
            // Get the current page name without the path and extension
            string currentPage = System.IO.Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath);

            // Check the current page and apply the active class accordingly
            switch (currentPage)
            {
                case "Dashboard":
                case var noticePage when noticePage.StartsWith("Notice"):
                    dashboardLink.Attributes["class"] = activeNavClass;
                    break;
                case "Analyze":
                    analyzeLink.Attributes["class"] = activeNavClass;
                    break;
                case var productPage when productPage.StartsWith("Product"):
                    productLink.Attributes["class"] = activeNavClass;
                    break;
                case var orderPage when orderPage.StartsWith("Order"):
                    orderLink.Attributes["class"] = activeNavClass;
                    break;
                case var voucherPage when voucherPage.StartsWith("Voucher"):
                    voucherLink.Attributes["class"] = activeNavClass;
                    break;
            }
        }

        protected void btnSignout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}
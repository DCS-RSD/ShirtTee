using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class MainAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

    }
}
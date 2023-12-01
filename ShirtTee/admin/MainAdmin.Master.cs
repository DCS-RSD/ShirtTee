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
            // Get the current page name without the path and extension
            string currentPage = System.IO.Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath);

            // Check the current page and apply the active class accordingly
            switch (currentPage)
            {
                case "Dashboard":
                    dashboardLink.Attributes["class"] += " active";
                    break;
                case "AnotherPage":
                    customerLink.Attributes["class"] += " active";
                    break;
                case "Product":
                    productLink.Attributes["class"] += " active";
                    break;
                    // Add cases for other pages as needed
            }
        }

    }
}
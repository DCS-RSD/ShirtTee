using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class OrderTracking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string GetStatusClass(string status)
        {
            switch (status)
            {
                case "Order Placed":
                    return "border-black text-gray-800 dark:border-gray-200 dark:text-white";
                case "Preparing":
                    return "border-yellow-500 text-yellow-500";
                case "Shipped":
                    return "border-teal-500 text-teal-500";
                case "Delivered":
                    return "border-blue-600 text-blue-600";
                case "Cancelled":
                    return "border-red-500 text-red-500";
                default:
                    return "border-gray-200";
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                // Retrieve the product ID from the clicked row
                string prodId = e.CommandArgument.ToString();

                // Redirect to the product details page with the selected product ID
                Response.Redirect($"ProductDetails.aspx?prodid={prodId}");
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddToBag_Click(object sender, EventArgs e)
        {
            string prodID = "";
            Response.Redirect($"~/customer/Cart.aspx?customerid={prodID}");
        }

    }
}
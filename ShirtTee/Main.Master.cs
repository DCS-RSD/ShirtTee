using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMen_Click(object sender, EventArgs e)
        {
            string categoryName = "men";
            Response.Redirect($"~/Products.aspx?categoryname={categoryName}");
        }

        protected void btnWomen_Click(object sender, EventArgs e)
        {
            string categoryName = "women";
            Response.Redirect($"~/Products.aspx?categoryname={categoryName}");
        }

        protected void btnKids_Click(object sender, EventArgs e)
        {
            string categoryName = "kids";
            Response.Redirect($"~/Products.aspx?categoryname={categoryName}");
        }

        protected void btnOrderHis_Click(object sender, EventArgs e)
        {
            string customerID = "";
            Response.Redirect($"~/customer/OrderHistory.aspx?customerid={customerID}");
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            string customerID = "";
            Response.Redirect($"~/customer/Profile.aspx?customerid={customerID}");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            string customerID = "";
            Response.Redirect($"~/customer/Cart.aspx?customerid={customerID}");
        }
    }
}
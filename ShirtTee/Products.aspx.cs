using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee
{
    public partial class Products : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string prodCategory = Request.QueryString["category"];
            string subCategory = Request.QueryString["sub"];

            if (prodCategory != null && subCategory != null)
            {
                Repeater1.Visible = false;
                Repeater2.Visible = true;
                Repeater3.Visible = false;
                lblProduct.Text = prodCategory.ToUpper() + " " + subCategory.ToUpper();

            }
            else if (prodCategory != null)
            {
                Repeater1.Visible = true;
                Repeater2.Visible = false;
                Repeater3.Visible = false;
                lblProduct.Text = prodCategory.ToUpper();
            }
            else 
            {
                Repeater1.Visible = false;
                Repeater2.Visible = false;
                Repeater3.Visible = true;
                lblProduct.Text = "ALL PRODUCTS";
            }

        }

    }
}
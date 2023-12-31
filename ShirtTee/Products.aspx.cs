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
            if (prodCategory != null)
            {
                if (prodCategory.Equals("men"))
                {
                    lblProduct.Text = "MEN";
                }
                else if (prodCategory.Equals("women"))
                {
                    lblProduct.Text = "WOMEN";
                }
                else if (prodCategory.Equals("kids"))
                {
                    lblProduct.Text = "KIDS";
                }
            }


        }

    }
}
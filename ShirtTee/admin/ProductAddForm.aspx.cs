using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class AddProductForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProdCategory.Enabled = true;
        }


    }
}
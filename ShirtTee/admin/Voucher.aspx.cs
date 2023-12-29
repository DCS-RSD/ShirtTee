using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class Voucher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["VoucherAdded"] != null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
                }
                if (Session["VoucherDeleted"] != null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessDeleteToast", "showSuccessDeleteToast();", true);
                }
            }
        }
    }
}
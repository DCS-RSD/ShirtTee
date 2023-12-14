using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
namespace ShirtTee
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (HttpContext.Current.User.Identity.IsAuthenticated) {
                    lblUsername.Text = string.Format("{0}", HttpContext.Current.User.Identity.GetUserName());
                }
            }
        }

 





    }
}
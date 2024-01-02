using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.GetUserId() == null)
            {
                Response.Redirect("~/errors/404.aspx");
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) 
            {
                var identityDbContext = new IdentityDbContext("ConnectionString");

                var userStore = new UserStore<IdentityUser>(identityDbContext);
                var manager = new UserManager<IdentityUser>(userStore);

                var result = manager.ChangePassword(HttpContext.Current.User.Identity.GetUserId(), txtCurPwd.Text, txtNewPwd.Text);

                if (result != null)
                {
                    Session["ProfileChanged"] = "changePwdSuccess";
                }
                else
                {
                    Session["ProfileChanged"] = "changePwdFailed";
                }
                Response.Redirect("~/customer/Profile.aspx");
            }

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var identityDbContext = new IdentityDbContext("ConnectionString");

            var userStore = new UserStore<IdentityUser>(identityDbContext);
            var manager = new UserManager<IdentityUser>(userStore);

            var curUser = manager.FindById(HttpContext.Current.User.Identity.GetUserId());

            var user = manager.Find(curUser.UserName, txtCurPwd.Text);
            if (user != null)
            {
                args.IsValid = true;
            }
            else 
            {
                args.IsValid = false;
            }
        }
    }
}
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var identityDbContext = new IdentityDbContext("ConnectionString");

            var userStore = new UserStore<IdentityUser>(identityDbContext);
            var manager = new UserManager<IdentityUser>(userStore);

            var userEmail = manager.FindByEmail(signinEmail.Text);
            if (userEmail ==null)
            {
                //error
                return;
            }
            var user = manager.Find(userEmail.UserName, signInPassword.Text);
            if (user != null)
            {

                LogUserIn(manager, user);

                if (chkRememberMe.Checked)
                {
                    var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                    var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                    authenticationManager.SignIn(
                        new AuthenticationProperties
                        {
                            IsPersistent = true,
                            ExpiresUtc = DateTime.UtcNow.AddDays(30)
                        },
                        userIdentity
                    );

                    // Also, store the user ID in a persistent cookie
                    Response.Cookies["user_ID"].Value = user.Id;
                    Response.Cookies["user_ID"].Expires = DateTime.UtcNow.AddDays(30);
                }
                if (manager.IsInRole(user.Id, "admin"))
                {

                    Response.Redirect($"~/admin/Dashboard.aspx", false);
                }
                else
                {
                    Response.Redirect($"~/Homepage.aspx", false);
                }

            }
            else
            {
                
            }
        }

        private void LogUserIn(UserManager<IdentityUser> usermanager, IdentityUser user)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = usermanager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);
            Session["user_ID"] = user.Id;
        }

        protected void chkRememberMe_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Stripe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            var identityDbContext = new IdentityDbContext("ConnectionString");

            var userStore = new UserStore<IdentityUser>(identityDbContext);
            var manager = new UserManager<IdentityUser>(userStore);
            var user = new IdentityUser() { UserName = signupEmail.Text, Email = signupEmail.Text };
            IdentityResult result = manager.Create(user, signupPassword.Text);
            if (result.Succeeded)
            {
                Response.Redirect($"~/Login.aspx?");
            }
            else
            {
                //error
            }


            //
        }
    }
}
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

            if (Session["SigninValidate"] != null && !IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (tandc.Checked)
            {

                var identityDbContext = new IdentityDbContext("ConnectionString");

                var userStore = new UserStore<IdentityUser>(identityDbContext);
                var manager = new UserManager<IdentityUser>(userStore);
                var user = new IdentityUser() { UserName = signupEmail.Text, Email = signupEmail.Text };

                if (manager.FindByEmail(signupEmail.Text) == null)
                {
                    IdentityResult result = manager.Create(user, signupPassword.Text);
                    if (result.Succeeded)
                    {
                        manager.AddToRole(user.Id, "customer");
                        Session["SigninValidate"] = "validSignin";
                        Response.Redirect($"~/Login.aspx");
                    }
                }
                else
                {
                    Session["SigninValidate"] = "invalidSignin";
                    Response.Redirect(Request.Url.AbsoluteUri);
                }

            }
            else
            {
                Session["SigninValidate"] = "notChecked";
                Response.Redirect(Request.Url.AbsoluteUri);
            }



            //
        }
    }
}
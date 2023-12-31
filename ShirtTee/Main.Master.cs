using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
namespace ShirtTee
{
    public partial class Main : System.Web.UI.MasterPage
    {

        protected override void OnPreRender(EventArgs e)
        {
            if (Session["user_ID"] != null)
            {
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@user_ID", Session["user_ID"])
                };

                SqlDataReader cartDetails = dbconnection.ExecuteQuery(
                    " SELECT SUM(quantity) AS qty FROM [Cart]"
                  + " WHERE user_ID = @user_ID",
                parameterUrl).ExecuteReader();

                if (cartDetails.HasRows)
                {
                    cartDetails.Read();
                    lblCartNumber.Text = cartDetails["qty"].ToString();
                }
            }
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    notificationDiv.Visible = true;
                    orderHisDiv.Visible = true;
                    myReviewDiv.Visible = true;
                    profileDiv.Visible = true;
                    cartDiv.Visible = true;
                    panelLoginInfo.Visible = true;
                    panelLogout.Visible = true;
                    panelSignIn.Visible = false;
                    lblUsername.Text = string.Format("{0}", HttpContext.Current.User.Identity.GetUserName());
                    if (HttpContext.Current.User.IsInRole("admin"))
                    {
                        hypToClient.Visible = true;
                    }
                }
                else
                {
                    notificationDiv.Visible = false;
                    orderHisDiv.Visible = false;
                    myReviewDiv.Visible = false;
                    profileDiv.Visible = false;
                    cartDiv.Visible = false;
                    panelLoginInfo.Visible = false;
                    panelLogout.Visible = false;
                    panelSignIn.Visible = true;
                }
            }


        }

        protected void btnSignout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Session["user_ID"] = "";
            Response.Redirect("~/Login.aspx");
        }

    }
}
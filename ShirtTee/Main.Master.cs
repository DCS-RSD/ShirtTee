using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
namespace ShirtTee
{
    public partial class Main : System.Web.UI.MasterPage
    {

        protected override void OnPreRender(EventArgs e)
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    lblUsername.Text = string.Format("{0}", HttpContext.Current.User.Identity.GetUserName());
                }
            }


        }







    }
}
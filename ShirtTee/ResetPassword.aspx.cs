using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Owin.Security;
using System.Text;

namespace ShirtTee
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string email = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string resetKey = Request.QueryString["resetKey"];
            DateTime? expiryDate = null;


            if (string.IsNullOrEmpty(resetKey))
            {
                Response.Redirect("~/errors/404.aspx");
            }
            else
            {
                SqlParameter[] parameterUrl0 = new SqlParameter[]{
                 new SqlParameter("@resetKey", resetKey)
                };

                SqlConnection connection0 = new SqlConnection(connectionString);

                connection0.Open();

                SqlCommand command0 = new SqlCommand("SELECT * FROM [AspNetUsers] WHERE reset_key = @resetKey", connection0);

                if (parameterUrl0 != null)
                {
                    command0.Parameters.AddRange(parameterUrl0);
                }

                SqlDataReader userDetails = command0.ExecuteReader();

                if (userDetails.HasRows)
                {
                    userDetails.Read();
                    if (userDetails["reset_key_expired"] != DBNull.Value)
                    {
                        email = userDetails["Email"].ToString();
                        expiryDate = Convert.ToDateTime(userDetails["reset_key_expired"].ToString());
                        if (expiryDate < DateTime.Now)
                        {
                            Response.Redirect("~/errors/404.aspx");
                        }
                    }

                }
                else
                {
                    connection0.Close();
                    Response.Redirect("~/errors/404.aspx");
                }

                connection0.Close();

            }

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

            string resetKey = Request.QueryString["resetKey"];
            if (!string.IsNullOrEmpty(resetKey))
            {
                //use the password and create a temp account to get the password hash
                //random email to prevent many user reset pwd same time
                (string tEmail, string username) = GenerateRandomEmail();
                var identityDbContext = new IdentityDbContext("ConnectionString");
                var userStore = new UserStore<IdentityUser>(identityDbContext);
                var manager = new UserManager<IdentityUser>(userStore);
                var user = new IdentityUser() { UserName = username, Email = tEmail };
                if (manager.FindByEmail(tEmail) == null)
                {
                    IdentityResult result = manager.Create(user, signupPassword.Text);
                    if (result.Succeeded)
                    {
                        manager.AddToRole(user.Id, "customer");
                    }
                }

                //get the temp account from database
                string newPwd = "";
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@Email", tEmail)
                };
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM [AspNetUsers] WHERE Email = @email", connection);
                if (parameterUrl != null)
                {
                    command.Parameters.AddRange(parameterUrl);
                }
                SqlDataReader tempAcc = command.ExecuteReader();
                if (tempAcc.HasRows)
                {
                    tempAcc.Read();
                    newPwd = tempAcc["PasswordHash"].ToString();

                }
                connection.Close();

                //update the user pwd that want to reset pwd, clear resetkey and expdate
                string sqlcommand =
                    "UPDATE AspNetUsers SET " +
                    "reset_key = @resetKey2, " +
                    "reset_key_expired = @expiryDate2, " +
                    "PasswordHash = @password " +
                    "WHERE Email = @email2";
                SqlParameter[] parameterUrl2 = new SqlParameter[]{
                    new SqlParameter("@resetKey2", DBNull.Value),
                    new SqlParameter("@expiryDate2", DBNull.Value),
                    new SqlParameter("@password", newPwd),
                    new SqlParameter("@email2", email)
                };
                SqlConnection connection2 = new SqlConnection(connectionString);
                connection2.Open();
                SqlCommand command2 = new SqlCommand(sqlcommand, connection2);

                if (parameterUrl2 != null)
                {
                    command2.Parameters.AddRange(parameterUrl2);
                }
                command2.ExecuteNonQuery();
                connection2.Close();

                //delete temp account
                string sqlcommand3 =
                    "DELETE FROM AspNetUsers " +
                    "WHERE Email = @tEmail";
                SqlParameter[] parameterUrl3 = new SqlParameter[]{
                    new SqlParameter("@tEmail", tEmail)
                };
                SqlConnection connection3 = new SqlConnection(connectionString);
                connection3.Open();
                SqlCommand command3 = new SqlCommand(sqlcommand3, connection3);

                if (parameterUrl3 != null)
                {
                    command3.Parameters.AddRange(parameterUrl3);
                }
                command3.ExecuteNonQuery();
                connection3.Close();

                Session["LoginValidate"] = "resetPwd";
                Response.Redirect("~/Login.aspx");
            }




        }

        private (string, string) GenerateRandomEmail()
        {
            // Generate a random prefix
            string prefix = GenerateRandomString(8);

            // Define the postfix
            string postfix = "@gmail.com";

            // Combine prefix and postfix to form the email
            string email = $"{prefix}{postfix}";

            return (email, prefix);
        }

        private string GenerateRandomUsername(string prefix)
        {
            return prefix;
        }

        private string GenerateRandomString(int length)
        {
            // Characters to be used for generating the random string
            const string chars = "abcdefghijklmnopqrstuvwxyz0123456789";

            // Random object to generate random indexes
            Random random = new Random();

            // Use StringBuilder for efficient string concatenation
            StringBuilder result = new StringBuilder(length);

            // Generate random string by selecting random characters from 'chars'
            for (int i = 0; i < length; i++)
            {
                result.Append(chars[random.Next(chars.Length)]);
            }

            return result.ToString();
        }
    }
}
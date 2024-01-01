using Org.BouncyCastle.Pqc.Crypto.Lms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        private string connectionString =
    ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ForgetPassword"] != null && !IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);

            }



        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string email = "";
            string username = "";
            string resetKey = "";
            DateTime? existingExpired = null;
            //DBconnection dbconnection = new DBconnection();

            SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@email", signinEmail.Text)
                };
            /*
            SqlDataReader userDetails = dbconnection.ExecuteQuery(
                " SELECT * FROM [AspNetUsers]"
              + " WHERE Email = @email",
                parameterUrl).ExecuteReader();

            */
            SqlConnection connection = new SqlConnection(connectionString);

            connection.Open();


            SqlCommand command = new SqlCommand("SELECT * FROM[AspNetUsers] WHERE Email = @email", connection);

            if (parameterUrl != null)
            {
                command.Parameters.AddRange(parameterUrl);
            }

            SqlDataReader userDetails = command.ExecuteReader();
          

            if (userDetails.HasRows)
            {
                userDetails.Read();
                email = userDetails["Email"].ToString();
                username = userDetails["UserName"].ToString();
                if (userDetails["reset_key_expired"] != DBNull.Value) 
                {
                    existingExpired = Convert.ToDateTime(userDetails["reset_key_expired"].ToString());
                }
                if (existingExpired != null)
                {
                    if (existingExpired < DateTime.Now)
                    {
                        resetKey = GenerateResetKey(email, username);
                    }
                }
                else 
                {
                    resetKey = GenerateResetKey(email, username);
                }

            }
            else
            {
                Session["ForgetPassword"] = "invalidEmail";
                connection.Close();
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            connection.Close();



            if (!string.IsNullOrEmpty(resetKey))
            {
                DateTime expiryDate = DateTime.Now.AddHours(24);
                string sqlcommand =
                    "UPDATE AspNetUsers SET " +
                    "reset_key = @resetKey, " +
                    "reset_key_expired = @expiryDate " +
                    "WHERE Email = @email2";
                SqlParameter[] parameterUrl2 = new SqlParameter[]{
                    new SqlParameter("@resetKey", resetKey),
                    new SqlParameter("@expiryDate", expiryDate),
                    new SqlParameter("@email2", email)
                };
                //dbconnection.ExecuteNonQuery(sqlcommand, parameterUrl2);
                SqlConnection connection2 = new SqlConnection(connectionString);
                connection2.Open();
                SqlCommand command2 = new SqlCommand(sqlcommand, connection2);

                if (parameterUrl2 != null)
                {
                    command2.Parameters.AddRange(parameterUrl2);
                }

                command2.ExecuteNonQuery();
                connection2.Close();

                try
                {
                    string link = "https://localhost:44374/ResetPassword.aspx?resetKey=" + resetKey;
                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("shirtteecs@gmail.com");
                    msg.To.Add(signinEmail.Text);
                    msg.Subject = "SHIRTTEE Account Reset Password";
                    msg.Body = ("Hi " + username + 
                        "<br/><br/>" + 
                        "Your reset passwork link: " + link + 
                        "<br/><br/>" + 
                        "The link is valid for 24 hours only.");
                    msg.IsBodyHtml = true;
                    //Admin@123
                    SmtpClient smt = new SmtpClient("smtp.gmail.com");
                    smt.Port = 587;
                    smt.EnableSsl = true;
                    smt.UseDefaultCredentials = false;
                    smt.Credentials = new System.Net.NetworkCredential("shirtteecs@gmail.com", "ggzmbhdhafixyfhh");

                    smt.Send(msg);
                }
                catch (Exception ex)
                {
                    Session["ForgetPassword"] = "error";
                    Response.Redirect(Request.Url.AbsoluteUri);
                }

            }
            else 
            {
                Session["ForgetPassword"] = "keyNotExpired";
                Response.Redirect(Request.Url.AbsoluteUri);
            }

            Session["ForgetPassword"] = "success";
            Response.Redirect(Request.Url.AbsoluteUri);

        }

        private string GenerateResetKey(string email, string username)
        {
            // Generate a unique key based on user information and timestamp
            // You can customize this based on your specific requirements
            string keyData = $"{username}-{email}-{DateTime.Now.Ticks}";

            // Use a secure hash function (e.g., SHA256) to create a hash of the key data
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(keyData));
                return BitConverter.ToString(hashBytes).Replace("-", "");
            }
        }
    }
}
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.customer
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ProfileChanged"] != null && !IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
            }

            if (Session["user_ID"] != null && !IsPostBack)
            {
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@user_ID", Session["user_ID"]),
                };

                SqlDataReader profile = dbconnection.ExecuteQuery(
                    " SELECT * FROM [AspNetUsers] AS u"
                  + " WHERE Id = @user_ID",
                parameterUrl).ExecuteReader();

                if (profile.HasRows)
                {
                    profile.Read();
                    int memberPoint = Convert.ToInt32(profile["member_points"].ToString());
                    lblMemberPoints.Text = memberPoint.ToString();
                    if (memberPoint >= 0 && memberPoint <= 999)
                    {
                        lblMemberInfo.Text = "Level up to unlock more benefits !";
                        lblLvNow.Text = "0";
                        lblLvNext.Text = "1";

                    }
                    else if (memberPoint >= 1000 && memberPoint <= 3999)
                    {
                        lblMemberInfo.Text = "Level 1: Free delivery for all your purchases.";
                        lblLvNow.Text = "1";
                        lblLvNext.Text = "2";
                    }
                    else
                    {
                        lblMemberInfo.Text = "Level 1: Free delivery for all your purchases. <br /> Level 2: A birthday gift to look forward to on your special day.";
                        lblLvNow.Text = "2";
                        lblLvNext.Text = "3";
                    }
                    txtEmail.Text = profile["Email"].ToString();



                    if (profile["avatar"] != DBNull.Value)
                    {
                        Image1.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String((byte[])profile["avatar"]);

                        //divAvatar.InnerHtml = "<svg class=\"h-full w-full text-gray-300\" fill=\"currentColor\" viewBox=\"0 0 24 24\">\r\n                                        <path d=\"M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z\"></path>\r\n                                    </svg>";
                    }


                    txtUsername.Text = profile["UserName"].ToString();

                    ddlGender.SelectedValue = profile["gender"].ToString();

                    if (profile["dob"] != DBNull.Value)
                    {
                        txtSelectDOB.Visible = false;
                        txtDisplayDOB.Visible = true;
                        DateTime dob = Convert.ToDateTime(profile["dob"].ToString());
                        txtDisplayDOB.Text = dob.ToString("MM/dd/yyyy");

                    }
                    else
                    {
                        txtSelectDOB.Visible = true;
                        txtDisplayDOB.Visible = false;
                    }
                    txtPhone.Text = profile["PhoneNumber"].ToString();


                }


            }
        }

        protected void btnChangeAvatar_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {


                //Boolean fileValid = false;
                //if (fileAvatar.HasFile)
                //{
                //    string fileName = Path.GetFileName(fileAvatar.FileName);
                //    string fileExtension = Path.GetExtension(fileName).ToLower();
                //    if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
                //    {
                //        // Process the file upload
                //        // ...
                //        fileValid = true;
                //    }
                //    else
                //    {
                //        // Invalid file type
                //        Response.Write("Invalid file type. Please upload a JPG, JPEG or PNG file.");
                //    }
                //}


                //Boolean same = false;
                //if (userDetails.HasRows)
                //{
                //    userDetails.Read();
                //    SqlParameter[] parameterUrl2 = new SqlParameter[]{
                //     new SqlParameter("@user_ID", Session["user_ID"])
                //    };
                //    SqlDataReader allUser = dbconnection.ExecuteQuery("SELECT * FROM [AspNetUsers] WHERE Id != @user_ID"
                //        ,parameterUrl2)
                //        .ExecuteReader();

                //    if (allUser.HasRows)
                //    {
                //        while (allUser.Read())
                //        {
                //            if (allUser["UserName"].ToString().Equals(txtUsername.Text)) 
                //            {
                //                same = true;
                //                Session["ProfileChanged"] = "sameUsername";
                //            }
                //        }
                //    }
                //}
                DBconnection dbconnection = new DBconnection();
                string sqlCommand =
                       "UPDATE [AspNetUsers] SET " +
                       "Email = @email, " +
                       (fileAvatar.HasFile ? "avatar = @avatar, " : "") +
                       "UserName = @username, " +
                       "gender = @gender, " +
                       "PhoneNumber = @phone " +
                       "WHERE Id = @user_ID";

                SqlParameter[] parameters = {
                        new SqlParameter("@email", txtEmail.Text),
                        new SqlParameter("@username", txtUsername.Text),
                        new SqlParameter("@gender", ddlGender.SelectedValue),
                        new SqlParameter("@phone", txtPhone.Text),
                        new SqlParameter("@user_ID", HttpContext.Current.User.Identity.GetUserId())
                    };

                if (fileAvatar.HasFile)
                {
                    parameters = parameters.Append(new SqlParameter("@avatar", (object)fileAvatar.FileBytes)).ToArray();
                }

                if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                {
                    Session["ProfileChanged"] = "success";
                }


            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex + "profile");
                Session["ProfileChanged"] = "error";
            }
            finally
            {
                Response.Redirect(Request.Url.AbsoluteUri);
            }

        }
    }
}
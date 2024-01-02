using Microsoft.AspNet.Identity;
using Stripe;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
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
                dbconnection.createConnection();
                SqlDataReader profile = dbconnection.ExecuteQuery(
                    " SELECT * FROM [AspNetUsers] AS u"
                  + " WHERE Id = @user_ID",
                parameterUrl).ExecuteReader();
                if (profile.HasRows)
                {
                    double width;
                    profile.Read();

                    int memberPoint = Convert.ToInt32(profile["member_points"].ToString());
                    lblMemberPoints.Text = memberPoint.ToString();
                    if (memberPoint >= 0 && memberPoint <= 999)
                    {
                        lblMemberInfo.Text = "Level up to unlock more benefits !";
                        lblLvNow.Text = "Level 0";
                        lblLvNext.Text = "Level 1";
                        width = memberPoint / 999.0 * 100;

                    }
                    else if (memberPoint >= 1000 && memberPoint <= 3999)
                    {
                        lblMemberInfo.Text = "Level 1: Free delivery for all your purchases.";
                        lblLvNow.Text = "Level 1";
                        lblLvNext.Text = "Level 2";
                        width = (memberPoint - 999) / 2999.0 * 100;
                    }
                    else
                    {
                        lblMemberInfo.Text = "Level 1: Free delivery for all your purchases. <br /> Level 2: A birthday gift to look forward to on your special day.";
                        lblLvNow.Text = "Level 2";
                        lblLvNext.Text = "Max Level";
                        width = 100;
                    }
                    progressBar.Attributes["style"] = "width: calc((" + width + ") / 100 * 100%)";

                    txtEmail.Text = profile["Email"].ToString();



                    if (profile["avatar"] != DBNull.Value)
                    {
                        Image1.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String((byte[])profile["avatar"]);

                        //divAvatar.InnerHtml = "<svg class=\"h-full w-full text-gray-300\" fill=\"currentColor\" viewBox=\"0 0 24 24\">\r\n                                        <path d=\"M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z\"></path>\r\n                                    </svg>";
                    }


                    txtUsername.Text = profile["UserName"].ToString();


                    if (profile["gender"] != DBNull.Value)
                    {
                        ddlGender.SelectedValue = profile["gender"].ToString();
                    }
                    else
                    {
                        ddlGender.SelectedIndex = 0;
                    }



                    if (profile["dob"] != DBNull.Value)
                    {
                        svgIcon.Visible = false;
                        rfvDate.Enabled = false;
                        CustomValidator3.Enabled = false;
                        txtSelectDOB.Visible = false;

                        DateTime dob = Convert.ToDateTime(profile["dob"].ToString());

                        txtDOB.Text = dob.ToString("dd MMMM yyyy");



                    }
                    else
                    {
                        svgIcon.Visible = true;
                        txtDOB.Text = "";
                        txtSelectDOB.Visible = true;
                        rfvDate.Enabled = true;
                        CustomValidator3.Enabled = true;
                    }

                    txtPhone.Text = profile["PhoneNumber"].ToString();


                }
                dbconnection.closeConnection();


            }


        }


        protected void btnChangeAvatar_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Page.Validate();
            if (Page.IsValid)
            {
                Boolean dobExist = false;
                //try
                //{
                DBconnection dbconnection = new DBconnection();

                SqlParameter[] parameterUrl2 = new SqlParameter[]{
                         new SqlParameter("@user_ID", Session["user_ID"]),
                        };
                dbconnection.createConnection();
                SqlDataReader user = dbconnection.ExecuteQuery(
                    " SELECT * FROM [AspNetUsers] " +
                    " WHERE Id = @user_ID", parameterUrl2).ExecuteReader();

                if (user.HasRows)
                {
                    user.Read();
                    if (user["dob"] != DBNull.Value)
                    {
                        dobExist = true;
                    }
                }
                dbconnection.closeConnection();

                //if file invalid type, the fileUpload will still contain that invalid file, so need to validate here
                if (validatePhotoFormat())
                {
                    string sqlCommand =
                           "UPDATE AspNetUsers SET " +
                           "Email = @email, " +
                           (fileAvatar.HasFile ? "avatar = @avatar, " : "") +
                           (dobExist ? "" : "dob = @dob, ") +
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

                    if (!dobExist)
                    {
                        parameters = parameters.Append(new SqlParameter("@dob", Convert.ToDateTime(txtSelectDOB.Text))).ToArray();
                    }

                    if (fileAvatar.HasFile)
                    {
                        parameters = parameters.Append(new SqlParameter("@avatar", (object)fileAvatar.FileBytes)).ToArray();
                    }
                    dbconnection.createConnection();
                    if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                    {
                        Session["ProfileChanged"] = "success";
                        dbconnection.closeConnection();
                        Response.Redirect(Request.Url.AbsoluteUri);
                    }
                    dbconnection.closeConnection();
                }
                else
                {
                    string sqlCommand =
                       "UPDATE AspNetUsers SET " +
                       "Email = @email, " +
                       (dobExist ? "" : "dob = @dob, ") +
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
                    if (!dobExist)
                    {
                        parameters = parameters.Append(new SqlParameter("@dob", Convert.ToDateTime(txtSelectDOB.Text))).ToArray();
                    }
                    dbconnection.createConnection();
                    if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                    {
                        Session["ProfileChanged"] = "success";
                        Response.Redirect(Request.Url.AbsoluteUri);

                    }
                    dbconnection.closeConnection();
                }


                //}
                //catch (Exception ex)
                //{
                //    System.Diagnostics.Debug.WriteLine(ex + "profile");
                //    Session["ProfileChanged"] = "error";
                //}
                //finally
                //{
                //    Response.Redirect(Request.Url.AbsoluteUri);
                //}
            }





        }

        private Boolean validatePhotoFormat()
        {
            if (fileAvatar.HasFile)
            {
                string extension = System.IO.Path.GetExtension(fileAvatar.FileName).ToLower();
                if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                // No file uploaded, consider it valid if not required
                return true;
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblExpiryDate = (Label)e.Item.FindControl("lblExpiryDate");
                Label lblVoucher = (Label)e.Item.FindControl("lblVoucher");
                Label lblMinSpend = (Label)e.Item.FindControl("lblMinSpend");
                Label lblCapAt = (Label)e.Item.FindControl("lblCapAt");

                DataRowView dataItem = (DataRowView)e.Item.DataItem;

                if (dataItem != null)
                {
                    string expDate = dataItem["expiry_date"].ToString();
                    string discountRate = (Convert.ToDouble(dataItem["discount_rate"].ToString()) * 100).ToString();
                    lblVoucher.Text = "Voucher " + discountRate + "% off";
                    lblMinSpend.Text = "Minimum Spend: RM" + Convert.ToDouble(dataItem["min_spend"].ToString()).ToString("F2");
                    lblCapAt.Text = "Cap At: RM" + Convert.ToDouble(dataItem["cap_at"].ToString()).ToString("F2");

                    lblExpiryDate.Text = Convert.ToDateTime(expDate).ToString("dd MMMM yyyy");
                }
            }
        }

        protected void btnRedeem_Click(object sender, EventArgs e)
        {
            DBconnection dbconnection0 = new DBconnection();

            SqlParameter[] parameterUrl2 = new SqlParameter[]{
                         new SqlParameter("@voucher_name", txtRedeem.Text.ToString()),
                        };
            dbconnection0.createConnection();
            SqlDataReader voucher = dbconnection0.ExecuteQuery(
                " SELECT * FROM [Voucher] AS v" +
                " WHERE expiry_date > GETDATE() AND" +
                " deleted_at IS NULL AND" +
                " voucher_name = @voucher_name", parameterUrl2).ExecuteReader();

            if (voucher.HasRows)
            {

                voucher.Read();
                DBconnection dbconnection1 = new DBconnection();

                SqlParameter[] parameterUrl = new SqlParameter[]{
                         new SqlParameter("@user_ID", Session["user_ID"]),
                         new SqlParameter("@voucher_name", voucher["voucher_name"].ToString()),
                        };
                dbconnection1.createConnection();
                SqlDataReader existingVoucher = dbconnection1.ExecuteQuery(
                    " SELECT * FROM [Voucher_Details] AS vd" +
                    " INNER JOIN [Voucher] AS v ON vd.voucher_ID = v.voucher_ID" +
                    " WHERE user_ID = @user_ID AND" +
                    " voucher_name = @voucher_name",
                parameterUrl).ExecuteReader();
                if (existingVoucher.HasRows)
                {
                    existingVoucher.Read();
                    //duplicate voucher
                    Session["ProfileChanged"] = "duplicateVoucher";
                }
                else
                {
                    //insert voucher
                    string sqlcommand =
                        "INSERT INTO Voucher_Details (user_ID, voucher_ID) " +
                        "VALUES (@user_ID, @voucher_ID)";
                    SqlParameter[] parameters = {
                       new SqlParameter("@user_ID", Session["user_ID"]),
                         new SqlParameter("@voucher_ID", voucher["voucher_ID"].ToString()),
                    };

                    DBconnection db = new DBconnection();
                    db.createConnection();
                    if (db.ExecuteNonQuery(sqlcommand, parameters))
                    {
                        Session["ProfileChanged"] = "redeemSuccess";
                    }

                    db.closeConnection();
                }
                dbconnection1.closeConnection();


            }
            else
            {
                Session["ProfileChanged"] = "noSuchVoucher";
            }
            dbconnection0.closeConnection();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Boolean same = false;
            DBconnection dbconnection = new DBconnection();
            SqlParameter[] parameter = new SqlParameter[]{
                         new SqlParameter("@user_ID", Session["user_ID"].ToString()),
                    };
            dbconnection.createConnection();
            SqlDataReader allUser = dbconnection.ExecuteQuery(
                "SELECT * FROM [AspNetUsers] " +
                "WHERE Id != @user_ID ",
            parameter).ExecuteReader();

            if (allUser.HasRows)
            {
                while (allUser.Read())
                {
                    if (allUser["UserName"].ToString().Equals(txtUsername.Text))
                    {
                        same = true;
                        //Session["ProfileChanged"] = "sameUsername";
                    }
                }
            }
            dbconnection.closeConnection();
            if (same)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Boolean same = false;
            DBconnection dbconnection = new DBconnection();

            SqlParameter[] parameter = new SqlParameter[]{
                         new SqlParameter("@user_ID", Session["user_ID"].ToString()),
                    };
            dbconnection.createConnection();
            SqlDataReader allUser = dbconnection.ExecuteQuery(
                "SELECT * FROM [AspNetUsers] " +
                "WHERE Id != @user_ID ",
            parameter).ExecuteReader();

            if (allUser.HasRows)
            {
                while (allUser.Read())
                {
                    if (allUser["Email"].ToString().Equals(txtEmail.Text))
                    {
                        same = true;
                        //Session["ProfileChanged"] = "sameUsername";
                    }
                }
            }
            dbconnection.closeConnection();
            if (same)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dt = DateTime.Now;
            if (Convert.ToDateTime(txtSelectDOB.Text) > dt)
            {
                args.IsValid = false;
            }
            else 
            {
                args.IsValid = true;
            }
        }

        protected void btnPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/customer/ChangePassword.aspx");
        }
    }
}
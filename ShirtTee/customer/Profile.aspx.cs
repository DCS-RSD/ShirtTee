using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
            if (Session["user_ID"] != null)
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
                    if (memberPoint > 0 && memberPoint <= 999)
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
                    txtUsername.Text = profile["UserName"].ToString();

                    ddlGender.SelectedValue = profile["gender"].ToString();

                    if (profile["dob"] != DBNull.Value)
                    {
                        DateTime dob = Convert.ToDateTime(profile["dob"].ToString());
                        txtDOB.Text = dob.ToString("MM/dd/yyyy");
                    }
                    txtPhone.Text = profile["PhoneNumber"].ToString();
          

                }


            }
        }
    }
}
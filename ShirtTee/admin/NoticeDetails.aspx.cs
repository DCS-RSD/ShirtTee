using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class NoticeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["notice_id"] == null)
            {
                Panel1.Visible = false;
                lblError.Visible = true;
                lblError.Text = "<div class=\"grid h-screen place-content-center bg-white px-4\">" +
                    "<h1 class=\"text-center uppercase tracking-widest text-gray-500\">404 | Not Found</h1>" +
                    "</div>";
            }
            else
            {
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@notice_ID", Request.QueryString["notice_id"])
                };
                SqlDataReader noticeDetails = dbconnection.ExecuteQuery("SELECT * FROM [Notice] AS n INNER JOIN [AspNetUsers] AS s ON s.id = n.user_ID WHERE n.notice_ID = @notice_ID",
                    parameterUrl).ExecuteReader();


                if (noticeDetails.HasRows)
                {
                    noticeDetails.Read();
                    lblTitle.Text = (string)noticeDetails["notice_title"];
                    lblSubTitle.Text = noticeDetails["notice_ID"].ToString();


                    txtTitle.Text = (string)noticeDetails["notice_title"];
                    txtContent.Text = (string)noticeDetails["notice_content"];
                    if ((bool)noticeDetails["is_private"])
                    {
                        radVisibility.Items[1].Selected = true;
                    }
                    else
                    {
                        radVisibility.Items[0].Selected = true;

                    }

                }

            }

        }
    }
}
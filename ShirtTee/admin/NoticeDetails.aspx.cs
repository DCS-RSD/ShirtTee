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
                if (!IsPostBack)
                {
                    fetchData();
                }

            }

        }

        private void fetchData()
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                DBconnection dbconnection = new DBconnection();

                string sqlCommand = "UPDATE Notice SET" +
                    " notice_title = @notice_title," +
                    " notice_content = @notice_content," +
                    " is_private = @is_private " +
                    " WHERE notice_ID = @notice_ID";

                SqlParameter[] parameters = {
                new SqlParameter("@notice_title", txtTitle.Text),
                new SqlParameter("@notice_content", txtContent.Text),
                new SqlParameter("@is_private", radVisibility.SelectedValue=="is_staff_only"?1:0),
                new SqlParameter("@notice_ID", Request.QueryString["notice_id"]),
                };

                if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                {
                    Session["NoticeUpdated"] = "success";
                    fetchData();
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                Session["NoticeUpdated"] = "error";
            }
            finally
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                DBconnection dbconnection = new DBconnection();

                string sqlCommand = "DELETE FROM [Notice] WHERE notice_ID = @notice_id ";

                SqlParameter[] parameters = {
                new SqlParameter("@notice_ID",Request.QueryString["notice_id"])
                };


                if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                {
                    Session["NoticeDeleted"] = "success";
                }
            }
            catch (Exception)
            {
                Session["NoticeDeleted"] = "error";
            }
            finally
            {
                Response.Redirect(ResolveUrl("~/admin/dashboard.aspx").ToString());
            }
        }
    }
}
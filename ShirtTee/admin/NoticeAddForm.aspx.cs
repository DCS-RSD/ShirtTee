using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class NoticeAddForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                DBconnection dbconnection = new DBconnection();

                string sqlCommand = "INSERT INTO Notice (user_ID, notice_title, notice_content, created_at,is_private) " +
                               "VALUES (@user_ID, @notice_title, @notice_content, @created_at, @is_private)";

                SqlParameter[] parameters = {
                new SqlParameter("@user_ID", "1a243703-25dd-4213-b791-9c4721e28416"), //replace session user id
                new SqlParameter("@notice_title", txtTitle.Text),
                new SqlParameter("@notice_content", txtContent.Text),
                new SqlParameter("@created_at", DateTime.Now),
                new SqlParameter("@is_private", radVisibility.SelectedValue=="is_staff_only"?1:0)
                };

                if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                {
                    Session["NoticeAdded"] = "success";
                }
            }
            catch (Exception ex)
            {
                Session["NoticeAdded"] = "error";
            }
            finally
            {
                Response.Redirect(ResolveUrl("~/admin/Dashboard.aspx").ToString());
            }

        }
    }
}
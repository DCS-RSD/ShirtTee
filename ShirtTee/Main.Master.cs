using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using PayPal.Api;
namespace ShirtTee
{
    public partial class Main : System.Web.UI.MasterPage
    {

        protected override void OnPreRender(EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("render");

            base.OnPreRender(e);
            if (Session["user_ID"] != null)
            {
                System.Diagnostics.Debug.WriteLine("has session");

                DBconnection dbconnection = new DBconnection();
                dbconnection.createConnection();
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
                dbconnection.closeConnection();

                SqlParameter[] parameterUrl2 = new SqlParameter[]{
                 new SqlParameter("@user_ID", Session["user_ID"])
                };
                dbconnection.createConnection();

                SqlDataReader user = dbconnection.ExecuteQuery(
                    " SELECT * FROM [AspNetUsers]"
                  + " WHERE Id = @user_ID",
                parameterUrl2).ExecuteReader();

                if (user.HasRows)
                {
                    user.Read();
                    if (user["avatar"] != DBNull.Value)
                    {
                        imgAvatar.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String((byte[])user["avatar"]);

                    }
                    else
                    {
                        imgAvatar.ImageUrl = "~/Image/default-avatar.jpg";
                    }
                    lblUsername.Text = string.Format("{0}", user["UserName"]);
                }
                dbconnection.closeConnection();

            }
            else
            {
                System.Diagnostics.Debug.WriteLine("no session key");
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    panelUserDropdown.Visible = true;
                    panelSignIn.Visible = false;
                    cartDiv.Visible = true;

                    lblUsername.Text = string.Format("{0}", HttpContext.Current.User.Identity.GetUserName());
                    if (HttpContext.Current.User.IsInRole("admin"))
                    {
                        hypToClient.Visible = true;
                    }
                }
                else
                {
                    cartDiv.Visible = false;
                    panelUserDropdown.Visible = false;
                    panelSignIn.Visible = true;
                }
            }


        }

        protected void btnSignout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Session["user_ID"] = "";
            Response.Cookies["user_ID"].Value = "";
            Response.Cookies["user_ID"].Expires = DateTime.UtcNow.AddDays(-1);
            Response.Redirect("~/Login.aspx");
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {



                DataRowView dataItem = (DataRowView)e.Item.DataItem;

                HyperLink linkMen = (HyperLink)e.Item.FindControl("linkMen");

                if (dataItem != null)
                {
                    linkMen.NavigateUrl = "~/Products.aspx?category=men&sub=" + dataItem["category_name"].ToString();
                }
            }
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {



                DataRowView dataItem = (DataRowView)e.Item.DataItem;

                HyperLink linkWomen = (HyperLink)e.Item.FindControl("linkWomen");

                if (dataItem != null)
                {
                    linkWomen.NavigateUrl = "~/Products.aspx?category=women&sub=" + dataItem["category_name"].ToString();
                }
            }
        }

        protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {



                DataRowView dataItem = (DataRowView)e.Item.DataItem;

                HyperLink linkKids = (HyperLink)e.Item.FindControl("linkKids");

                if (dataItem != null)
                {
                    linkKids.NavigateUrl = "~/Products.aspx?category=kids&sub=" + dataItem["category_name"].ToString();
                }
            }
        }
    }
}
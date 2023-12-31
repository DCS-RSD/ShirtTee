using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["NoticeAdded"] != null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
                }

                if (Session["NoticeDeleted"] != null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowDeleteSuccessToast", "showDeleteSuccessToast();", true);
                }
            }
        }

        public string showPrivateLogo()
        {

            return @"
            <div class=""hs-tooltip inline-block"">
                <div class=""hs-tooltip-toggle"">
                   <svg class="" flex-shrink-0 w-4 h-4"" xmlns=""http://www.w3.org/2000/svg"" width=""24"" height=""24"" viewBox=""0 0 24 24"" fill=""none"" stroke=""gray"" stroke-width=""2"" stroke-linecap=""round"" stroke-linejoin=""round"">
                       <g id=""SVGRepo_bgCarrier"" stroke-width=""0""></g><g id=""SVGRepo_tracerCarrier"" stroke-linecap=""round"" stroke-linejoin=""round""></g><g id=""SVGRepo_iconCarrier"">
                              <path d=""M7 10.0288C7.47142 10 8.05259 10 8.8 10H15.2C15.9474 10 16.5286 10 17 10.0288M7 10.0288C6.41168 10.0647 5.99429 10.1455 5.63803 10.327C5.07354 10.6146 4.6146 11.0735 4.32698 11.638C4 12.2798 4 13.1198 4 14.8V16.2C4 17.8802 4 18.7202 4.32698 19.362C4.6146 19.9265 5.07354 20.3854 5.63803 20.673C6.27976 21 7.11984 21 8.8 21H15.2C16.8802 21 17.7202 21 18.362 20.673C18.9265 20.3854 19.3854 19.9265 19.673 19.362C20 18.7202 20 17.8802 20 16.2V14.8C20 13.1198 20 12.2798 19.673 11.638C19.3854 11.0735 18.9265 10.6146 18.362 10.327C18.0057 10.1455 17.5883 10.0647 17 10.0288M7 10.0288V8C7 5.23858 9.23858 3 12 3C14.7614 3 17 5.23858 17 8V10.0288"" stroke-width=""2"" stroke-linecap=""round"" stroke-linejoin=""round""></path>
                       </g>
                   </svg>
                   <span class=""z-[100] hs-tooltip-content hs-tooltip-shown:opacity-100 hs-tooltip-shown:visible opacity-0 transition-opacity inline-block absolute invisible z-10 py-1 px-2 bg-gray-900 text-xs font-medium text-white rounded shadow-sm dark:bg-slate-700"" role=""tooltip"">
                   This notice is only visible to staff.
                   </span>
                </div>
            </div>";
        }

        protected void ddlNoticeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            var query = SqlDataSource1.SelectCommand;
            if (ddlNoticeType.SelectedIndex != 0)
            {
                txtSearch.Text = ""; //reset search

                SqlDataSource1.SelectCommand = SqlDataSourceFiltered.SelectCommand;
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("is_private", ddlNoticeType.SelectedValue);
            }
            else
            {
                SqlDataSource1.SelectCommand = query;
            }

            ListView1.DataBind();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            var query = SqlDataSource1.SelectCommand;
            if (txtSearch.Text != "")
            {
                ddlNoticeType.SelectedIndex = 0; //reset dropdown
                SqlDataSource1.SelectCommand = query + " WHERE notice_title LIKE '%' + @notice_title + '%'";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("notice_title", txtSearch.Text);
            }
            else
            {
                SqlDataSource1.SelectCommand = query;
            }
            ListView1.DataBind();

        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class AnalyzeCustomer : System.Web.UI.Page
    {

        const string query = "SELECT u.Id AS user_ID, u.Username, u.email, " +
            " COUNT(o.order_ID) AS total_order, COALESCE(SUM(o.order_total), 0) AS total_amount" +
            " FROM[AspNetUsers] AS u" +
            " LEFT OUTER JOIN[Order] AS o ON u.Id = o.user_ID ";
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (IsPostBack)
            {
                try
                {
                    if (ddlYear.SelectedIndex != 0 && ddlMonth.SelectedIndex != 0)
                    {
                        SqlDataSource1.SelectCommand = query + " WHERE Year(order_date) = @year AND Month(order_date) = @month";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("year", ddlYear.SelectedValue);
                        SqlDataSource1.SelectParameters.Add("month", ddlMonth.SelectedValue);

                    }
                    else if (ddlYear.SelectedIndex != 0)
                    {
                        SqlDataSource1.SelectCommand = query + " WHERE Year(order_date) = @year";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("year", ddlYear.SelectedValue);
                    }
                    else if (ddlMonth.SelectedIndex != 0)
                    {
                        SqlDataSource1.SelectCommand = query + " WHERE Month(order_date) = @month";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("month", ddlMonth.SelectedValue);
                    }
                    else
                    {
                        SqlDataSource1.SelectCommand = query;
                        SqlDataSource1.SelectParameters.Clear();
                    }
                    SqlDataSource1.SelectCommand += " GROUP BY u.Id, u.Username, u.email";
                    ListView1.DataBind();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex.Message + "\n" + query + "\n" + SqlDataSource1.SelectCommand);
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            generateFile(".xls");
        }

        private void generateFile(string extension)
        {
            hideLinkButton();

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=customer-report-" + DateTime.Now.ToString("yyyy-MM-dd_HH:mm:ss") + extension);
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                ListView1.RenderControl(hw);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

        private void hideLinkButton()
        {
            string[] linkButtonIds = { "sortTitle", "sortDate", "LinkButton1", "LinkButton2", "LinkButton3" };

            foreach (string linkButtonId in linkButtonIds)
            {
                LinkButton linkButton = (LinkButton)ListView1.FindControl(linkButtonId);

                if (linkButton != null)
                {
                    linkButton.Visible = false;
                }
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            DataPager2.PagedControlID = null;
            DataPager2.Visible = false;
            ClientScript.RegisterStartupScript(this.GetType(), "Print", "printListView();", true);
            DataPager2.PagedControlID = "ListView1";
            DataPager2.Visible = true;


        }
    }
}
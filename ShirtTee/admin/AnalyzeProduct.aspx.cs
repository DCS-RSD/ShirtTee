using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class AnalyzeProduct : System.Web.UI.Page
    {

        const string query = @"
SELECT
    P.product_ID,
    P.product_name,

FROM
    Product P
JOIN
    Product_Details PD ON P.product_ID = PD.product_ID
LEFT JOIN
    Order_Details OD ON PD.product_details_ID = OD.product_details_ID
LEFT JOIN
    [Order] O ON OD.order_ID = O.order_ID";

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
                    SqlDataSource1.SelectCommand += " GROUP BY P.product_ID, P.product_name";
                    ListView1.DataBind();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex.Message + "\n" + query + "\n" + SqlDataSource1.SelectCommand);
                }
                DataPager2.PageSize = int.MaxValue;
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
            string[] linkButtonIds = { "LinkButton1", "LinkButton2", "LinkButton3" };

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
            ClientScript.RegisterStartupScript(this.GetType(), "Print", "printListView();", true);
        }
    }
}
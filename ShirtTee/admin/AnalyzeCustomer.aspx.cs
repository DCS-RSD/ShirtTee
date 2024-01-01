using System;
using System.Collections.Generic;
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
    }
}
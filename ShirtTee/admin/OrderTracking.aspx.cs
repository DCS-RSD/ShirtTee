using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class OrderTracking : System.Web.UI.Page
    {

        const string query = "SELECT s.order_status_ID, o.order_ID, s.status, o.order_date, MAX(s.update_date) AS latest_update_date" +
            " FROM [Order] AS o" +
            " INNER JOIN [Order_Status] AS s ON s.order_ID = o.order_ID";

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (IsPostBack)
            {
                try
                {
                    if (txtSearch.Text != "" && ddlCategory.SelectedIndex != 0)
                    {
                        SqlDataSource1.SelectCommand = query + " WHERE o.order_ID LIKE '%' + @order_ID + '%'";
                        SqlDataSource1.SelectCommand += " AND s.status = @status ";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("order_ID", txtSearch.Text);
                        SqlDataSource1.SelectParameters.Add("status", ddlCategory.SelectedValue);

                    }
                    else if (ddlCategory.SelectedIndex != 0)
                    {
                        SqlDataSource1.SelectCommand = query + " WHERE s.status = @status ";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("status", ddlCategory.SelectedValue);
                    }
                    else if (txtSearch.Text != "")
                    {
                        SqlDataSource1.SelectCommand = query + " WHERE o.order_ID LIKE '%' + @order_ID + '%'";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("order_ID", txtSearch.Text);
                    }
                    else
                    {
                        SqlDataSource1.SelectCommand = query;
                        SqlDataSource1.SelectParameters.Clear();
                    }

                    SqlDataSource1.SelectCommand += " GROUP BY s.order_status_ID, o.order_ID, s.status, o.order_date " +
            " HAVING MAX(s.update_date) = ( SELECT MAX(update_date) FROM [Order_Status] WHERE order_ID = o.order_ID) ";
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

        protected string GetStatusClass(string status)
        {
            switch (status)
            {
                case "Order Placed":
                    return "border-black text-gray-800 dark:border-gray-200 dark:text-white";
                case "Preparing":
                    return "border-yellow-500 text-yellow-500";
                case "Shipped":
                    return "border-teal-500 text-teal-500";
                case "Delivered":
                    return "border-blue-600 text-blue-600";
                case "Cancelled":
                    return "border-red-500 text-red-500";
                default:
                    return "border-gray-200";
            }
        }
    }
}
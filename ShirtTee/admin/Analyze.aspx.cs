using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class Analyze : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            displayTotalOrder();
            displayTotalUser();
            displayTotalSales();
            ScriptManager.RegisterStartupScript(this, GetType(), "setArrSales", $"setArrSales({getSales()});", true);

            if (!IsPostBack)
            {
                ddlYear.SelectedValue = DateTime.Now.Year.ToString();

            }

        }

        private void displayTotalOrder()
        {
            try
            {
                DBconnection dBconnection = new DBconnection();
                string query = "SELECT COUNT(*) FROM [Order] WHERE YEAR(order_date) = @year" +
                    " AND MONTH(order_date) = @month";
                SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@year",DateTime.Now.Year),
                new SqlParameter("@month",DateTime.Now.Month),
                };

                object totalOrder = dBconnection.ExecuteQuery(query, parameters).ExecuteScalar();
                if (totalOrder != null && totalOrder.ToString() != String.Empty)
                {
                    lblTotalOrder.Text = totalOrder.ToString();
                }
            }
            catch (Exception ex) { }
        }

        private void displayTotalUser()
        {
            try
            {
                DBconnection dBconnection = new DBconnection();
                string query = "SELECT COUNT(*) FROM [AspNetUsers]";
                SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@month",DateTime.Now.Month),
                };

                object totalUser = dBconnection.ExecuteQuery(query, parameters).ExecuteScalar();
                if (totalUser != null)
                {
                    lblTotalUser.Text = totalUser.ToString();
                }
            }
            catch (Exception ex) { }
        }

        private void displayTotalSales()
        {
            try
            {
                DBconnection dBconnection = new DBconnection();
                string query = "SELECT SUM(order_total) FROM [Order] WHERE YEAR(order_date) = @year" +
                    " AND MONTH(order_date) = @month";
                SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@year",DateTime.Now.Year),
                new SqlParameter("@month",DateTime.Now.Month),
                };

                object totalOrder = dBconnection.ExecuteQuery(query, parameters).ExecuteScalar();
                if (totalOrder != null && totalOrder.ToString() != String.Empty)
                {
                    lblTotalSales.Text = totalOrder.ToString();
                }
            }
            catch (Exception ex) { }
        }

        public string getSales()
        {
            decimal[] arr = new decimal[12];
            DBconnection dBconnection = new DBconnection();
            string query = "SELECT MONTH(order_date) AS month, SUM(order_total) AS monthly_order_total " +
            "FROM [Order] WHERE YEAR(order_date) = @year GROUP BY MONTH(order_date) ORDER BY month;";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@year",ddlYear.SelectedValue),
            };

            SqlDataReader result = dBconnection.ExecuteQuery(query, parameters).ExecuteReader();

            while (result.Read())
            {
                arr[Convert.ToInt32(result["month"]) - 1] = Convert.ToDecimal(result[1].ToString());
            }
            JavaScriptSerializer ser = new JavaScriptSerializer();
            string values = ser.Serialize(arr);
            return values;
        }
    }
}
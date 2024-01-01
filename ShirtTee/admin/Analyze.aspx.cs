using ShirtTee.customer;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
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
            ScriptManager.RegisterStartupScript(this, GetType(), "setGroupSales", $"setGroupSales({getGroupSales()});", true);

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

        public string getGroupSales()
        {
            int total = 0;


            int[] arr = new int[3];
            string query = @"SELECT category_group, SUM(quantity)
 FROM [Category] AS c
 INNER JOIN [Product] AS p ON p.category_ID = c.category_ID
 INNER JOIN [Product_Details] AS pd ON pd.product_ID = p.product_ID
 INNER JOIN [Order_Details] AS od ON od.product_details_ID = pd.product_details_ID
 INNER JOIN [Order] AS o ON o.order_ID = od.order_ID
 WHERE YEAR(order_date) = 2023
 GROUP BY  category_group";

            DBconnection dBconnection = new DBconnection();
            SqlParameter[] parameters2 = new SqlParameter[]
            {
                new SqlParameter("@year",ddlYear.SelectedValue),
            };
            SqlDataReader result = dBconnection.ExecuteQuery(query, parameters2).ExecuteReader();

            while (result.Read())
            {
                total+= Convert.ToInt32(result[1].ToString());
                int x;
                switch (result["category_group"].ToString())
                {
                    case "men":
                        x = 0;
                        break;
                    case "women":
                        x = 1;
                        break;
                    default:
                        x = 2;
                        break;
                }
                arr[x] = Convert.ToInt32(result[1].ToString());
            }

            double[] percent = new double[3];
            if (total != 0)
            {
                for (int i = 0; i < arr.Length; i++)
                {
                    percent[i] = Math.Round((double)arr[i] / total * 100, 2);
                }
            }        
            JavaScriptSerializer ser = new JavaScriptSerializer();
            string values = ser.Serialize(percent);
            return values;
        }
    }
}
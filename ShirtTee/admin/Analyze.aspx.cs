using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
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

        }

        private void displayTotalOrder()
        {
            try
            {
                DBconnection dBconnection = new DBconnection();
                string query = "SELECT COUNT(*) FROM [Order] WHERE MONTH(order_date) = @month";
                SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@month",DateTime.Now.Month),
                };

                object totalOrder = dBconnection.ExecuteQuery(query, parameters).ExecuteScalar();
                if (totalOrder != null)
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
                string query = "SELECT SUM(order_total) FROM [Order] WHERE MONTH(order_date) = @month";
                SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@month",DateTime.Now.Month),
                };

                object totalOrder = dBconnection.ExecuteQuery(query, parameters).ExecuteScalar();
                if (totalOrder != null)
                {
                    lblTotalSales.Text = totalOrder.ToString();
                }
            }
            catch (Exception ex) { }
        }
    }
}
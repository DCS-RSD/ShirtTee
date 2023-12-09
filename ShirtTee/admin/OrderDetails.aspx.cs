using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["order_id"] != null)
            {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(strCon);
                conn.Open();

                string strRetrieve = "SELECT *" +
                    "FROM [Order_Status] AS os" +
                    "INNER JOIN [Order] AS o ON o.order_ID = os.order_ID" +
                    "INNER JOIN [Customer] AS c ON c.customer_ID = o.customer_ID" +
                    "INNER JOIN [Voucher] AS v ON v.voucher_ID = o.voucher_ID" +
                    "INNER JOIN [Payment] AS p ON p.payment_ID = o.payment_ID" +
                    "INNER JOIN [Order_Details] AS od ON od.order_ID = o.order_ID" +
                    "INNER JOIN [Stock] AS s ON s.stock_ID= od.stock_ID" +
                    "INNER JOIN [Size] AS sz ON sz.size_ID= s.size_ID" +
                    "INNER JOIN [Color] AS co ON co.color_ID= s.color_ID" +
                    "INNER JOIN [Product] AS pd ON pd.product_ID= s.product_ID" +
                    "INNER JOIN [Category] AS cat ON cat.category_ID= pd.category_ID" +
                    "WHERE os.order_status_ID=@order_status_id";
                SqlCommand cmdRetrieve = new SqlCommand(strRetrieve, conn);

                cmdRetrieve.Parameters.AddWithValue("@order_status_id", Request.QueryString["order_status_id"]);

                SqlDataReader productDetails = cmdRetrieve.ExecuteReader();
            }
        }
    }
}
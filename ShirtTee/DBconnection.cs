using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ShirtTee
{
    public class DBconnection
    {
        private string connectionString =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        private Dictionary<string, string> queryList;

        private void LazyInitializeQueries()
        {
            if (this.queryList == null)
            {
                queryList = new Dictionary<string, string>();
                queryList.Add("GetProductDetails", "SELECT P.*, C.* FROM Product AS P INNER JOIN Category AS C ON P.category_id = C.category_id WHERE Product_ID=@ProductId");
                queryList.Add("GetOrderDetails", "SELECT *" +
                    " FROM [Order_Status] AS os" +
                    " INNER JOIN [Order] AS o ON o.order_ID = os.order_ID" +
                    " INNER JOIN [Customer] AS c ON c.customer_ID = o.customer_ID" +
                    " INNER JOIN [Voucher] AS v ON v.voucher_ID = o.voucher_ID" +
                    " INNER JOIN [Payment] AS p ON p.payment_ID = o.payment_ID" +
                    " INNER JOIN [Order_Details] AS od ON od.order_ID = o.order_ID" +
                    " INNER JOIN [Stock] AS s ON s.stock_ID= od.stock_ID" +
                    " INNER JOIN [Size] AS sz ON sz.size_ID= s.size_ID" +
                    " INNER JOIN [Color] AS co ON co.color_ID= s.color_ID" +
                    " INNER JOIN [Product] AS pd ON pd.product_ID= s.product_ID" +
                    " INNER JOIN [Category] AS cat ON cat.category_ID= pd.category_ID" +
                    " WHERE os.order_status_ID=@order_status_id");
            }

        }

        public SqlCommand ExecuteQuery(string queryKey, SqlParameter[] parameters)
        {
            //Ensure the dictionary only init for first access (better performance)
            LazyInitializeQueries();

            // Ensure the query key exists in the dictionary
            if (!queryList.ContainsKey(queryKey))
            {
                return null;
                //throw new ArgumentException($"Query with key '{queryKey}' not found.");
            }

            SqlConnection connection = new SqlConnection(connectionString);

            connection.Open();

            SqlCommand command = new SqlCommand(queryList[queryKey], connection);

            if (parameters != null)
            {
                command.Parameters.AddRange(parameters);
            }

            return command;


        }
    }
}
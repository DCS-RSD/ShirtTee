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
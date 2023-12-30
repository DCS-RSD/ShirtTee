using Newtonsoft.Json.Linq;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.customer
{
    public partial class WriteReview : System.Web.UI.Page
    {
        int rating;
        string reviewDesc;
        protected void Page_Load(object sender, EventArgs e)
        {
            rating = Convert.ToInt32(lblRating.Value.ToString());
            reviewDesc = lblReviewText.Value.ToString();
            if (Session["ReviewSubmitted"] != null && !IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
            }
            if (!IsPostBack)
            {
                FetchData();
            }
        }

        private void FetchData()
        {
            DBconnection dbconnection = new DBconnection();
            try
            {
                SqlParameter[] parameterUrl0 = new SqlParameter[]{
                 new SqlParameter("@order_ID", Session["order_ID_review"]),
                 new SqlParameter("@product_details_ID", Session["product_details_ID"])
                };
                SqlDataReader product = dbconnection.ExecuteQuery(
                  "SELECT * FROM [Order_Details] AS od"
                + " INNER JOIN [Product_Details] AS pd ON od.product_details_ID = pd.product_details_ID"
                + " INNER JOIN [Product] AS p ON pd.product_ID = p.product_ID"
                + " INNER JOIN [Size] AS s ON pd.size_ID = s.size_ID"
                + " INNER JOIN [Color] AS c ON pd.color_ID = c.color_ID"
                + " WHERE order_ID = @order_ID AND"
                + " od.product_details_ID = @product_details_ID ",
                    parameterUrl0).ExecuteReader();

                if (product.HasRows)
                {
                    product.Read();
                    lblOrderID.Text = "Order #" + product["order_ID"].ToString();
                    lblProductName.Text = product["product_name"].ToString();
                    lblDescription.Text = product["description"].ToString();
                    lblPrice.Text = Convert.ToDouble(product["price"]).ToString("F2");
                    lblQuantity.Text = product["quantity"].ToString();
                    lblColor.Text = product["color_name"].ToString();
                    lblSize.Text = product["size_name"].ToString();
                    lblTotal.Text = Convert.ToDouble(product["total"]).ToString("F2");
                    imgProduct.AlternateText = lblProductName.Text;
                    imgProduct.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String((byte[])product["thumbnail"]);

                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine(ex.Message + "orderdetails"); }

            try
            {
                if (Session["order_ID_review"] != null && Session["product_details_ID"] != null && Session["user_ID"] != null)
                {
                    SqlParameter[] parameterUrl = new SqlParameter[]{
                    new SqlParameter("@user_ID", Session["user_ID"]),
                 new SqlParameter("@product_details_ID", Session["product_details_ID"]),
                 new SqlParameter("@order_ID", Session["order_ID_review"]),
                };
                    SqlDataReader review = dbconnection.ExecuteQuery(
                      "SELECT * FROM [Review] AS r"
                    + " INNER JOIN [Product_Details] AS pd ON r.product_details_ID = pd.product_details_ID"
                    + " INNER JOIN [Order] AS o ON r.order_ID = o.order_ID"
                    + " WHERE r.user_ID = @user_ID AND"
                    + " r.product_details_ID = @product_details_ID AND"
                    + " r.order_ID = @order_ID AND"
                    + " review_date =  (SELECT MAX(review_date) FROM [Review] WHERE order_ID = @order_ID AND product_details_ID = @product_details_ID)",
                        parameterUrl).ExecuteReader();

                    if (review.HasRows)
                    {
                        review.Read();
                        lblRenderText.Value = review["review_description"].ToString();
                        lblRating.Value = review["rating"].ToString();
                        string script = $"<script type='text/javascript'>setRatingByValue('{lblRating.Value}');</script>";
                        ClientScript.RegisterStartupScript(this.GetType(), "SetRatingScript", script);

                        if (review["edited_at"] == DBNull.Value)
                        {
                            btnReview.Text = "Edit";
                        }
                        else
                        {
                            Response.Redirect($"~/customer/Review.aspx");
                        }

                    }

                }

            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine(ex.Message + "review"); }

        }

        protected Boolean checkReviewSame(int rating, string reviewDesc)
        {
            DBconnection dbconnection = new DBconnection();
            SqlParameter[] parameterUrl = new SqlParameter[]{
                    new SqlParameter("@user_ID", Session["user_ID"]),
                 new SqlParameter("@product_details_ID", Session["product_details_ID"]),
                 new SqlParameter("@order_ID", Session["order_ID_review"]),
                };
            SqlDataReader review = dbconnection.ExecuteQuery(
              "SELECT * FROM [Review] AS r"
            + " INNER JOIN [Product_Details] AS pd ON r.product_details_ID = pd.product_details_ID"
            + " INNER JOIN [Order] AS o ON r.order_ID = o.order_ID"
            + " WHERE r.user_ID = @user_ID AND"
            + " r.product_details_ID = @product_details_ID AND"
            + " r.order_ID = @order_ID AND"
            + " review_date =  (SELECT MAX(review_date) FROM [Review] WHERE order_ID = @order_ID AND product_details_ID = @product_details_ID)",
                parameterUrl).ExecuteReader();

            if (review.HasRows)
            {
                review.Read();
                if (rating == Convert.ToInt32(review["rating"].ToString()) && reviewDesc.Equals("<p class=\"text-gray-600 dark:text-gray-400\"></p>") && (review["review_description"] == DBNull.Value)) 
                {
                    return true;
                }
                if (rating == Convert.ToInt32(review["rating"].ToString()) && reviewDesc.Equals(review["review_description"].ToString()))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            return false;
        }

        protected void btnSubmitReview_Click(object sender, EventArgs e)
        {
            DBconnection dbconnection = new DBconnection();

            //int rating = Convert.ToInt32(lblRating.Value.ToString());
            //string reviewDesc = lblReviewText.Value;

            if (rating <= 0 || rating > 5)
            {
                Session["ReviewSubmitted"] = "error";
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            else
            {
                if (btnReview.Text == "Edit")
                {
                    if (checkReviewSame(rating, reviewDesc))
                    {
                        Session["ReviewSubmitted"] = "error";
                        Response.Redirect(Request.Url.AbsoluteUri);
                    }
                    else
                    {
                        DateTime dateNow = DateTime.Now;
                        if (reviewDesc.Equals("<p class=\"text-gray-600 dark:text-gray-400\"></p>"))
                        {
                            string createReview =
"INSERT INTO [Review] (user_ID, product_details_ID, rating, review_date, edited_at, order_ID) " +
"VALUES (@user_ID, @product_details_ID, @rating, @review_date, @edited_at, @order_ID)";
                            SqlParameter[] parameters = {
                                new SqlParameter("@user_ID", Session["user_ID"]),
                                new SqlParameter("@product_details_ID", Session["product_details_ID"]),
                                new SqlParameter("@rating", rating),
                                new SqlParameter("@review_date", dateNow),
                                new SqlParameter("@edited_at", dateNow),
                                new SqlParameter("order_ID", Session["order_ID_review"])
                            };
                            dbconnection.ExecuteNonQuery(createReview, parameters);
                        }
                        else 
                        {
                            string createReview =
"INSERT INTO [Review] (user_ID, product_details_ID, rating, review_description, review_date, edited_at, order_ID) " +
"VALUES (@user_ID, @product_details_ID, @rating, @review_description, @review_date, @edited_at, @order_ID)";
                            SqlParameter[] parameters = {
                                new SqlParameter("@user_ID", Session["user_ID"]),
                                new SqlParameter("@product_details_ID", Session["product_details_ID"]),
                                new SqlParameter("@rating", rating),
                                new SqlParameter("@review_description", reviewDesc),
                                new SqlParameter("@review_date", dateNow),
                                new SqlParameter("@edited_at", dateNow),
                                new SqlParameter("order_ID", Session["order_ID_review"])
                            };
                            dbconnection.ExecuteNonQuery(createReview, parameters);
                        }
                        

                        Response.Redirect($"~/customer/Review.aspx");

                    }

                }
                else
                {
                    DateTime dateNow = DateTime.Now;
                    if (reviewDesc.Equals("<p class=\"text-gray-600 dark:text-gray-400\"></p>"))
                    {
                        string createReview =
"INSERT INTO [Review] (user_ID, product_details_ID, rating, review_date, order_ID) " +
"VALUES (@user_ID, @product_details_ID, @rating, @review_date, @order_ID)";
                        SqlParameter[] parameters = {
                                new SqlParameter("@user_ID", Session["user_ID"]),
                                new SqlParameter("@product_details_ID", Session["product_details_ID"]),
                                new SqlParameter("@rating", rating),
                                new SqlParameter("@review_date", dateNow),
                                new SqlParameter("order_ID", Session["order_ID_review"])
                            };
                        dbconnection.ExecuteNonQuery(createReview, parameters);
                    }
                    else 
                    {
                        string createReview =
"INSERT INTO [Review] (user_ID, product_details_ID, rating, review_description, review_date, order_ID) " +
"VALUES (@user_ID, @product_details_ID, @rating, @review_description, @review_date, @order_ID)";
                        SqlParameter[] parameters = {
                                new SqlParameter("@user_ID", Session["user_ID"]),
                                new SqlParameter("@product_details_ID", Session["product_details_ID"]),
                                new SqlParameter("@rating", rating),
                                new SqlParameter("@review_description", reviewDesc),
                                new SqlParameter("@review_date", dateNow),
                                new SqlParameter("order_ID", Session["order_ID_review"])
                            };
                        dbconnection.ExecuteNonQuery(createReview, parameters);
                    }

                    Session["ReviewSubmitted"] = "success";
                    FetchData();
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
            }



        }
    }
}
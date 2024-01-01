using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text;

namespace ShirtTee.customer
{
    public partial class Review : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblQuantity = (Label)e.Item.FindControl("lblQuantity");
                Label lblTotal = (Label)e.Item.FindControl("lblTotal");
                HtmlGenericControl ratingStars = (HtmlGenericControl)e.Item.FindControl("ratingStars");
                Label lblReviewDesc = (Label)e.Item.FindControl("lblReviewDesc");
                Label lblReviewDate = (Label)e.Item.FindControl("lblReviewDate");
                Button btnEditReview = (Button)e.Item.FindControl("btnEditReview");
                Button btnEditReview2 = (Button)e.Item.FindControl("btnEditReview2");

                DataRowView dataItem = (DataRowView)e.Item.DataItem;
                if (dataItem["review_description"] == DBNull.Value)
                {
                    lblReviewDesc.Text = "No Review";
                }
                else 
                {
                    lblReviewDesc.Text = dataItem["review_description"].ToString();
                }

                if (dataItem["edited_at"] == DBNull.Value)
                {
                    btnEditReview.Visible = true;
                    btnEditReview2.Visible = true;
                    lblReviewDate.Text = "Reviewed on " + dataItem["review_date"].ToString();
                }
                else 
                {
                    btnEditReview.Visible = false;
                    btnEditReview2.Visible = false;
                    lblReviewDate.Text = "Review edited on " + dataItem["review_date"].ToString();
                }

                if (dataItem != null)
                {                  
                    DBconnection dBconnection = new DBconnection();
                    SqlParameter[] parameter = new SqlParameter[]{
                         new SqlParameter("@order_ID", dataItem["order_ID"].ToString()),
                         new SqlParameter("@product_details_ID", dataItem["product_details_ID"].ToString())
                    };
                    dBconnection.createConnection();
                    SqlDataReader orderDetails = dBconnection.ExecuteQuery(
                        "SELECT * FROM [Order_Details] " +
                        "WHERE order_ID = @order_ID AND " +
                        "product_details_ID = @product_details_ID",
                    parameter).ExecuteReader();
                    dBconnection.closeConnection();
                    if (orderDetails.HasRows)
                    {
                        orderDetails.Read();
                        lblQuantity.Text = orderDetails["quantity"].ToString();
                        lblTotal.Text = orderDetails["total"].ToString();
                    }

                    int rating = Convert.ToInt32(dataItem["rating"].ToString());

                    int grayStars = 5 - rating;

                    StringBuilder svgBuilder = new StringBuilder();

                    for (int i = 0; i < rating; i++)
                    {
                        svgBuilder.Append("<svg class=\"text-yellow-400 h-5 w-5 flex-shrink-0\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" aria-hidden=\"true\"><path d=\"M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z\"></path></svg>");
                    }

                    for (int i = 0; i < grayStars; i++)
                    {
                        svgBuilder.Append("<svg class=\"text-gray-400 h-5 w-5 flex-shrink-0\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" aria-hidden=\"true\"><path d=\"M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z\"></path></svg>");
                    }

                    ratingStars.InnerHtml = svgBuilder.ToString();
                }
            }
        }

        protected void btnEditReview_Click(object sender, EventArgs e)
        {
            Button btnEditReview = (Button)sender;
            RepeaterItem repeaterItem = (RepeaterItem)btnEditReview.NamingContainer;
            Label lblProductDetailsID = (Label)repeaterItem.FindControl("lblProductDetailsID");
            Label lblOrderID = (Label)repeaterItem.FindControl("lblOrderID");
            Session["product_details_ID"] = lblProductDetailsID.Text;
            Session["order_ID_review"] = lblOrderID.Text;
            Response.Redirect($"~/customer/WriteReview.aspx");
        }

    }
}
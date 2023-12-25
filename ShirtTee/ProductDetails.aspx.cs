using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Request.QueryString["product_ID"] != null)
            {
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@product_ID", Request.QueryString["product_ID"])
                };

                SqlDataReader productDetails = dbconnection.ExecuteQuery(
                    "SELECT * FROM [Product_Details] AS s"
                  + " INNER JOIN [Product] AS p ON s.product_ID = p.product_ID"
                  + " INNER JOIN [Color] AS c ON s.color_ID = c.color_ID"
                  + " INNER JOIN [Size] AS i ON s.size_ID = i.size_ID"
                  + " WHERE p.product_ID = @product_ID",
                parameterUrl).ExecuteReader();

                if (productDetails.HasRows)
                {
                    productDetails.Read();
                    lblProdName.Text = productDetails["product_name"].ToString();
                    lblDesc.Text = productDetails["description"].ToString();
                    lblPrice.Text = "RM" + productDetails["price"].ToString();
                }

                int totalReview = 0;
                int totalRating = 0;
                double avgRating = 0.0;
                int oneStar = 0, twoStar = 0, threeStar = 0, fourStar = 0, fiveStar = 0;
                double onePer, twoPer, threePer, fourPer, fivePer;
                SqlParameter[] parameterUrl2 = new SqlParameter[]{
                 new SqlParameter("@product_ID", Request.QueryString["product_ID"])
                };

                SqlDataReader reviewDetails = dbconnection.ExecuteQuery(
                    " SELECT * FROM [Review] AS r"
                  + " INNER JOIN [Product_Details] AS p ON r.product_details_ID = p.product_details_ID"
                  + " WHERE p.product_ID = @product_ID",
                parameterUrl2).ExecuteReader();

                if (reviewDetails.HasRows)
                {
                    while (reviewDetails.Read())
                    {
                        totalReview++;
                        int rating = Convert.ToInt32(reviewDetails["rating"]);
                        totalRating += rating;
                        switch (rating) 
                        {
                            case 1:
                                oneStar++;
                                break;
                            case 2:
                                twoStar++;
                                break;
                            case 3:
                                threeStar++;
                                break;
                            case 4:
                                fourStar++;
                                break;
                            case 5:
                                fiveStar++;
                                break;
                        }

                    }
                }
                avgRating = totalRating / (double)totalReview;
                onePer = oneStar / (double)totalReview * 100; 
                twoPer = twoStar / (double)totalReview * 100; 
                threePer = threeStar / (double)totalReview * 100; 
                fourPer = fourStar / (double)totalReview * 100;   
                fivePer = fiveStar / (double)totalReview * 100;
                starBar1.Attributes["style"] = "width: calc((" + onePer + ") / 100 * 100%)";
                starBar2.Attributes["style"] = "width: calc((" + twoPer + ") / 100 * 100%)";
                starBar3.Attributes["style"] = "width: calc((" + threePer + ") / 100 * 100%)";
                starBar4.Attributes["style"] = "width: calc((" + fourPer + ") / 100 * 100%)";
                starBar5.Attributes["style"] = "width: calc((" + fivePer + ") / 100 * 100%)";
                lblOnePer.Text = onePer.ToString("F0");
                lblTwoPer.Text = twoPer.ToString("F0");
                lblThreePer.Text = threePer.ToString("F0");
                lblFourPer.Text = fourPer.ToString("F0");
                lblFivePer.Text = fivePer.ToString("F0");
                lblTotalRating.Text = avgRating.ToString("F1");
                lblTotalReviews.Text = totalReview.ToString();

            }

        }

        protected string GenerateStars(int rating)
        {
            StringBuilder starsHtml = new StringBuilder();

            for (int i = 0; i < 5; i++)
            {
                string starClass = (i < rating) ? "text-yellow-400" : "text-gray-400";

                starsHtml.Append($"<svg class=\"{starClass} h-5 w-5 flex-shrink-0\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" aria-hidden=\"true\"><path d=\"M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z\"></path></svg>");
            }

            return starsHtml.ToString();
        }

        protected void btnAddToBag_Click(object sender, EventArgs e)
        {
            string prodID = "";
            Response.Redirect($"~/customer/Cart.aspx?customerid={prodID}");
        }

        protected void radColor_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton radioButton = (RadioButton)sender;
            string colorID = radioButton.Attributes["value"];

            lblColor.Text = colorID;
            lblMsg.Visible = false;

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the RadioButton in the current Repeater item
                RadioButton radColor = (RadioButton)e.Item.FindControl("radColor");

                // Get the data item for the current Repeater item
                DataRowView dataItem = (DataRowView)e.Item.DataItem;

                // Set the value attribute dynamically based on the data
                if (radColor != null && dataItem != null)
                {
                    radColor.Attributes["value"] = dataItem["color_ID"].ToString();
                    radColor.Attributes["onclick"] = "handleColorRadioClick(this);";
                }
            }
        }

        protected void radSize_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton radioButton = (RadioButton)sender;
            string sizeID = radioButton.Attributes["value"];

        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the RadioButton in the current Repeater item
                RadioButton radSize = (RadioButton)e.Item.FindControl("radSize");

                // Get the data item for the current Repeater item
                DataRowView dataItem = (DataRowView)e.Item.DataItem;

                // Set the value attribute dynamically based on the data
                if (radSize != null && dataItem != null)
                {
                    radSize.Attributes["value"] = dataItem["size_ID"].ToString();
                    radSize.Attributes["onclick"] = "handleSizeRadioClick(this);";
                }
            }
        }
    }
}
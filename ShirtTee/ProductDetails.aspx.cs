﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;
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
        protected string SelectedColor
        {
            get { return ViewState["SelectedColor"] as string; }
            set { ViewState["SelectedColor"] = value; }
        }
        protected string SelectedSize
        {
            get { return ViewState["SelectedSize"] as string; }
            set { ViewState["SelectedSize"] = value; }
        }
        protected override void OnPreRender(EventArgs e)
        {
            Repeater1.DataBind();
            Repeater2.DataBind();
            Repeater8.DataBind();
            restoreRadioState();
            calculateOverallRating();
        }

        private void saveColorState(string colorID)
        {
            SelectedColor = colorID;

        }

        private void saveSizeState(string sizeID)
        {
            SelectedSize = sizeID;
        }

        private void restoreRadioState()
        {

            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    RadioButton radColor = item.FindControl("radColor") as RadioButton;
                    if (radColor.Attributes["value"].Equals(SelectedColor))
                    {
                        EventArgs eventArgs = new EventArgs();
                        radColor_CheckedChanged(radColor, eventArgs);
                        string script = $"handleColorRadioClick({radColor.ClientID});";
                        ScriptManager.RegisterStartupScript(this, GetType(), "colorScript", script, true);
                        foreach (RepeaterItem item2 in Repeater2.Items)
                        {
                            if (item2.ItemType == ListItemType.Item || item2.ItemType == ListItemType.AlternatingItem)
                            {
                                RadioButton radSize = item2.FindControl("radSize") as RadioButton;
                                if (radSize.Attributes["value"].Equals(SelectedSize))
                                {
                                    EventArgs eventArgs2 = new EventArgs();
                                    radSize_CheckedChanged(radSize, eventArgs2);
                                    string script2 = $"handleSizeRadioClick({radSize.ClientID});";
                                    ScriptManager.RegisterStartupScript(this, GetType(), "sizeScript", script2, true);
                                    return;
                                }
                                else
                                {
                                    lblSize.Text = "No";
                                }
                            }

                        }
                    }
                }
            }



        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrAdd.Text = "";
            if (Request.QueryString["product_ID"] != null)
            {
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@product_ID", Request.QueryString["product_ID"])
                };
                dbconnection.createConnection();
                SqlDataReader productDetails = dbconnection.ExecuteQuery(
                    " SELECT * FROM [Product_Details] AS s"
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
                dbconnection.closeConnection();


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
            if (Session["user_ID"] != null)
            {
                //get prodctdetailsid
                string prodDetailsID = "";
                string prodID = "";
                double price = 0;
                int qty = 0;

                bool toUpdate = false;
                DBconnection dbconnection2 = new DBconnection();
                SqlParameter[] parameterUrl2 = new SqlParameter[]{
                 new SqlParameter("@product_ID", Request.QueryString["product_ID"]),
                 new SqlParameter("@size_ID", lblSize.Text),
                 new SqlParameter("@color_ID", lblColor.Text)
                };
                dbconnection2.createConnection();
                SqlDataReader productDetails = dbconnection2.ExecuteQuery(
                    " SELECT * FROM [Product_Details] AS d" +
                    " INNER JOIN [Product] AS p ON d.product_ID = p.product_ID" +
                    " WHERE d.product_ID = @product_ID AND" +
                    " size_ID = @size_ID AND" +
                    " color_ID = @color_ID",
                    parameterUrl2).ExecuteReader();
                if (productDetails.HasRows)
                {
                    productDetails.Read();
                    prodDetailsID = productDetails["product_details_ID"].ToString();
                    price = Convert.ToDouble(productDetails["price"].ToString());
                    prodID = productDetails["product_ID"].ToString();
                }
                dbconnection2.closeConnection();


                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@user_ID", Session["user_ID"]),
                 new SqlParameter("@product_ID", Request.QueryString["product_ID"])
                };
                dbconnection.createConnection();
                SqlDataReader cartDetails = dbconnection.ExecuteQuery(
                    " SELECT * FROM [Cart] AS c" +
                    " INNER JOIN [Product_Details] AS p ON c.product_details_ID = p.product_details_ID"
                  + " WHERE user_ID = @user_ID AND product_ID = @product_ID",
                    parameterUrl).ExecuteReader();

                if (cartDetails.HasRows)
                {
                    System.Diagnostics.Debug.WriteLine("has item");
                    cartDetails.Read();
                    //product already in cart, update
                    qty = Convert.ToInt32(cartDetails["quantity"].ToString());

                    if (qty < 15)
                    {
                        toUpdate = true;


                    }
                    else
                    {
                        //max qty
                        lblErrAdd.Text = "You have reached the max number in the cart.";
                    }

                }
                dbconnection.closeConnection();

                //add product into cart, not exist yet
                if (toUpdate)
                {
                    updateCart(prodDetailsID, prodID, qty);

                }
                else
                {
                    addToCart(prodDetailsID, price);
                }



            }


        }

        private void addToCart(string prodDetailsID, double price)
        {
            System.Diagnostics.Debug.WriteLine("no item");

            try
            {
                string sqlcommand =
                    "INSERT INTO Cart (user_ID, product_details_ID, quantity, subtotal) " +
                    "VALUES (@user_ID, @product_details_ID, 1, @subtotal)";
                SqlParameter[] parameters = {
                                        new SqlParameter("@user_ID", Session["user_ID"]),
                                        new SqlParameter("@product_details_ID", prodDetailsID),
                                        new SqlParameter("@subtotal", price)
                                    };
                DBconnection db1 = new DBconnection();
                db1.createConnection();
                bool valid = db1.ExecuteNonQuery(sqlcommand, parameters);
                db1.closeConnection();
                if (valid)
                {
                    //product add to cart sucess
                    Response.Redirect($"~/customer/Cart.aspx");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message + "3");
            }
        }

        private void updateCart(string prodDetailsID, string prodID, int qty)
        {
            try
            {
                string sqlcommand =
                    "UPDATE Cart SET " +
                    "quantity = @quantity, " +
                    "subtotal = @quantity * (SELECT price FROM [Product] WHERE product_ID = @product_ID) " +
                    "WHERE user_ID = @user_ID AND " +
                    "product_details_ID = @product_details_ID";
                SqlParameter[] parameters = {
                                            new SqlParameter("@quantity", qty + 1),
                                            new SqlParameter("@product_ID", prodID),
                                            new SqlParameter("@user_ID", Session["user_ID"]),
                                            new SqlParameter("@product_details_ID", prodDetailsID),
                                        };
                DBconnection db1 = new DBconnection();
                db1.createConnection();
                bool valid = db1.ExecuteNonQuery(sqlcommand, parameters);
                db1.closeConnection();
                if (valid)
                {
                    //product add to cart sucess
                    Response.Redirect($"~/customer/Cart.aspx");
                }
            }
            catch (Exception ex) { System.Diagnostics.Debug.WriteLine(ex.Message + "1"); }
        }

        protected void radColor_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton radioButton = (RadioButton)sender;
            string colorID = radioButton.Attributes["value"];

            lblColor.Text = colorID.ToString();
            saveColorState(colorID);
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
            saveSizeState(sizeID);
            lblSize.Text = sizeID.ToString();

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

        private void calculateOverallRating()
        {
            int totalReview = 0;
            int totalRating = 0;
            double avgRating = 0.0;
            int oneStar = 0, twoStar = 0, threeStar = 0, fourStar = 0, fiveStar = 0;
            double onePer = 0, twoPer = 0, threePer = 0, fourPer = 0, fivePer = 0;

            foreach (RepeaterItem item in Repeater8.Items)
            {
                Label lblRating = (Label)item.FindControl("lblRating");
                if (item.Visible == true)
                {
                    totalReview++;
                    int rating = Convert.ToInt32(lblRating.Text.ToString());
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
                    avgRating = totalRating / (double)totalReview;
                    onePer = oneStar / (double)totalReview * 100;
                    twoPer = twoStar / (double)totalReview * 100;
                    threePer = threeStar / (double)totalReview * 100;
                    fourPer = fourStar / (double)totalReview * 100;
                    fivePer = fiveStar / (double)totalReview * 100;
                }

            }



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

            int aVGRating = Convert.ToInt32(avgRating);

            int grayStars = 5 - aVGRating;

            StringBuilder svgBuilder = new StringBuilder();

            for (int i = 0; i < aVGRating; i++)
            {
                svgBuilder.Append("<svg class=\"flex-shrink-0 h-5 w-5 text-yellow-400\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" aria-hidden=\"true\">\r\n                                <path d=\"M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z\"></path>\r\n                            </svg>");
            }

            for (int i = 0; i < grayStars; i++)
            {
                svgBuilder.Append("<svg class=\"flex-shrink-0 h-5 w-5 text-gray-400\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" aria-hidden=\"true\">\r\n                                <path d=\"M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z\"></path>\r\n                            </svg>");
            }

            ratingStars.InnerHtml = svgBuilder.ToString();
        }

        protected void Repeater8_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {



                DataRowView dataItem = (DataRowView)e.Item.DataItem;

                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@product_details_ID", dataItem["product_details_ID"].ToString()),
                 new SqlParameter("@order_ID", dataItem["order_ID"].ToString()),
                };

                dbconnection.createConnection();
                SqlDataReader review = dbconnection.ExecuteQuery(
                    " SELECT * FROM [Review] AS r"
                  + " WHERE product_details_ID = @product_details_ID AND"
                  + " order_ID = @order_ID",
                parameterUrl).ExecuteReader();
                if (review.HasRows)
                {
                    int reviewCount = 0;
                    while (review.Read())
                    {
                        reviewCount++;
                    }
                    if (reviewCount > 1)
                    {
                        if (dataItem["edited_at"] == DBNull.Value)
                        {
                            e.Item.Visible = false;
                        }
                    }
                }
                dbconnection.closeConnection();

            }
        }
    }
}
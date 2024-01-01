using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.customer
{
    public partial class Cart : System.Web.UI.Page
    {
        protected override void OnPreRender(EventArgs e)
        {
            Repeater1.DataSource = SqlDataSource1;
            Repeater1.DataBind();
            //Because empty item call databind will not perform some function, so need to do here
            if (Repeater1.Items.Count == 0)
            {
                lblSubtotal.Text = "0.00";
                lblTotal.Text = "0.00";
                lblShipping.Text = "0.00";
                Session["shipping"] = "0.00";
                txtVoucherCode.Text = "";
                successDiv.Style["display"] = "none";
                failedDiv.Style["display"] = "none";
                lblDisplayVoucher.Visible = false;
                lblDiscountCode.Text = "";
                lblDiscount.Text = "0.00";
                Session["discountCode"] = "";
                Session["discountValue"] = "0.00";
                btnCheckout.Visible = false;
                btnDisabledChkOut.Visible = true;
            }
            else 
            {
                btnCheckout.Visible = true;
                btnDisabledChkOut.Visible = false;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                Session["shipping"] = "";
                Session["discountCode"] = "";
                Session["discountValue"] = "0.00";
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
                   
            Response.Redirect($"~/customer/Checkout.aspx");
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {           
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddlQty = (DropDownList)e.Item.FindControl("ddlQty");
                Label lblEachSubtotal = (Label)e.Item.FindControl("lblEachSubtotal");
                Label lblPrice = (Label)e.Item.FindControl("lblPrice");
                Label lblLowStock = (Label)e.Item.FindControl("lblLowStock");

                DataRowView dataItem = (DataRowView)e.Item.DataItem;



                if (ddlQty != null && dataItem != null)
                {
                    if (Convert.ToInt32(dataItem["stock_available"].ToString()) < 10)
                    {
                        lblLowStock.Visible = true;
                    }
                    else
                    {
                        lblLowStock.Visible = false;
                    }

                    ddlQty.SelectedValue = dataItem["quantity"].ToString();
                    double price = Convert.ToDouble(dataItem["price"].ToString());
                    lblPrice.Text = price.ToString("F2");
                    double eachSubtotal = Convert.ToDouble(dataItem["subtotal"].ToString());
                    lblEachSubtotal.Text = eachSubtotal.ToString("F2");
                }
            }



            calculateSubtotal();
            calculateTotal(Convert.ToDouble(lblDiscount.Text.ToString()));
        }

        protected void calculateSubtotal()
        {
            DBconnection dbconnection = new DBconnection();
            //calculate shipping
            if (Session["user_ID"] != null)
            {
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@user_ID", Session["user_ID"])
                };
                dbconnection.createConnection();
                SqlDataReader userDetails = dbconnection.ExecuteQuery(
                    " SELECT * FROM [AspNetUsers] AS u"
                  + " WHERE Id = @user_ID",
                    parameterUrl).ExecuteReader();

                if (userDetails.HasRows)
                {
                    userDetails.Read();

                    if (userDetails["member_points"] != DBNull.Value)
                    {
                        if (Convert.ToInt32(userDetails["member_points"]) >= 1000)
                        {
                            lblShipping.Text = "0.00";
                            Session["shipping"] = "0.00";
                        }
                        else
                        {
                            lblShipping.Text = "12.00";
                            Session["shipping"] = "12.00";
                        }
                    }
                    else
                    {
                        lblShipping.Text = "12.00";
                        Session["shipping"] = "12.00";
                    }
                }
                dbconnection.closeConnection();
            }

            double subtotal = 0;
            SqlParameter[] parameterUrl2 = new SqlParameter[]{
                 new SqlParameter("@user_ID", Session["user_ID"]),
            };
            dbconnection.createConnection();
            SqlDataReader cartDetails = dbconnection.ExecuteQuery(
                " SELECT * FROM [Cart] AS c"
              + " WHERE user_ID = @user_ID",
                parameterUrl2).ExecuteReader();

            if (cartDetails.HasRows)
            {
                while (cartDetails.Read())
                {
                    subtotal += Convert.ToDouble(cartDetails["subtotal"].ToString());
                }
            }
            else 
            {
                subtotal = 0;
            }
            dbconnection.closeConnection();
            lblSubtotal.Text = subtotal.ToString("F2");
        }

        protected void calculateTotal(double discountValue)
        {
            double subtotal = Convert.ToDouble(lblSubtotal.Text.ToString());
            double shipping = Convert.ToDouble(lblShipping.Text.ToString());
            double total = subtotal + shipping - discountValue;
            lblTotal.Text = total.ToString("F2");
        }

        protected void invalidVoucher()
        {
            lblDisplayVoucher.Visible = false;
            lblDiscountCode.Text = "";
            lblDiscount.Text = "0.00";
            successDiv.Style["display"] = "none";
            failedDiv.Style["display"] = "block";
            Session["discountCode"] = "";
            Session["discountValue"] = "0.00";
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            calculateSubtotal();
            DBconnection dbconnection = new DBconnection();
            SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@user_ID", Session["user_ID"]),
                 new SqlParameter("@voucher_name", txtVoucherCode.Text)
            };
            dbconnection.createConnection();
            SqlDataReader voucherDetails = dbconnection.ExecuteQuery(
                " SELECT * FROM [Voucher_Details] AS d"
              + " INNER JOIN [Voucher] AS v ON d.voucher_ID = v.voucher_ID"
              + " WHERE user_ID = @user_ID AND"
              + " voucher_name = @voucher_name",
                parameterUrl).ExecuteReader();
            dbconnection.closeConnection();
            if (voucherDetails.HasRows)
            {
                voucherDetails.Read();
                double discountRate = Convert.ToDouble(voucherDetails["discount_rate"].ToString());
                double minSpend = Convert.ToDouble(voucherDetails["min_spend"].ToString());
                double capAt = Convert.ToDouble(voucherDetails["cap_at"].ToString());
                DateTime expiryDate = Convert.ToDateTime(voucherDetails["expiry_date"]);
                DateTime? usedDate = null;
                if (voucherDetails["used_date"] != DBNull.Value)
                {
                    usedDate = Convert.ToDateTime(voucherDetails["used_date"]);
                }
                else if (expiryDate < DateTime.Now)
                {
                    //voucher expired
                    invalidVoucher();
                    lblErrorMsg.Text = "The voucher has expired.";
                }
                else if (usedDate != null)
                {
                    //voucher used                  
                    invalidVoucher();
                    lblErrorMsg.Text = "The voucher is already used.";
                }
                else if (Convert.ToDouble(lblSubtotal.Text.ToString()) < minSpend)
                {
                    //voucher not meet min spend            
                    invalidVoucher();
                    lblErrorMsg.Text = "Minimum spend required for this voucher.";
                }
                else
                {
                    double discountValue = Convert.ToDouble(lblSubtotal.Text.ToString()) * discountRate;
                    if (capAt != 0)
                    {
                        if (discountValue > capAt)
                        {
                            discountValue = capAt;
                        }
                    }

                    lblDisplayVoucher.Visible = true;
                    lblDiscountCode.Text = voucherDetails["voucher_name"].ToString();
                    lblDiscount.Text = discountValue.ToString("F2");
                    successDiv.Style["display"] = "block";
                    failedDiv.Style["display"] = "none";
                    Session["discountCode"] = voucherDetails["voucher_name"].ToString();
                    Session["discountValue"] = discountValue.ToString();
                    lblVoucherMsg.Text = "The voucher is successfully applied !";
                }

            }
            else
            {
                //voucher not exists              
                invalidVoucher();
                lblErrorMsg.Text = "The voucher is not exist.";
            }
            calculateTotal(Convert.ToDouble(lblDiscount.Text.ToString()));
        }

        protected void ddlQty_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlQty = (DropDownList)sender;
            RepeaterItem repeaterItem = (RepeaterItem)ddlQty.NamingContainer;
            Label lblProductID = (Label)repeaterItem.FindControl("lblProductID");
            Label lblProductDetailsID = (Label)repeaterItem.FindControl("lblProductDetailsID");

            try
            {
                DBconnection dBconnection = new DBconnection();
                string sqlcommand =
                    "UPDATE Cart SET " +
                    "quantity = @quantity, " +
                    "subtotal = @quantity * (SELECT price FROM [Product] WHERE product_ID = @product_ID) " +
                    "WHERE user_ID = @user_ID AND " +
                    "product_details_ID = @product_details_ID";
                SqlParameter[] parameters = {
                new SqlParameter("@quantity", ddlQty.SelectedValue),
                new SqlParameter("@product_ID", lblProductID.Text),
                new SqlParameter("@user_ID", Session["user_ID"]),
                new SqlParameter("@product_details_ID", lblProductDetailsID.Text),
                };
                dBconnection.createConnection();
                if (dBconnection.ExecuteNonQuery(sqlcommand, parameters))
                {

                    //Repeater1.DataBind();
                    btnApply_Click(sender, e);
                    if (txtVoucherCode.Text == "")
                    {
                        successDiv.Style["display"] = "none";
                        failedDiv.Style["display"] = "none";
                    }
                }
                dBconnection.closeConnection();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }


        }

        protected void btnRemoveItem_Click(object sender, EventArgs e)
        {
            Button btnRemoveItem = (Button)sender;
            RepeaterItem repeaterItem = (RepeaterItem)btnRemoveItem.NamingContainer;
            Label lblProductDetailsID = (Label)repeaterItem.FindControl("lblProductDetailsID");
            try
            {
                DBconnection dBconnection = new DBconnection();
                string sqlcommand =
                    "DELETE FROM Cart " +
                    "WHERE user_ID = @user_ID AND " +
                    "product_details_ID = @product_details_ID";
                SqlParameter[] parameters = {
                new SqlParameter("@user_ID", Session["user_ID"]),
                new SqlParameter("@product_details_ID", lblProductDetailsID.Text),
                };
                dBconnection.createConnection();
                if (dBconnection.ExecuteNonQuery(sqlcommand, parameters))
                {

                    //if (!cartDetails.HasRows)
                    //{
                    //    lblSubtotal.Text = "0.00";
                    //}

                    //Repeater1.DataBind();
                    btnApply_Click(sender, e);
                    if (txtVoucherCode.Text == "")
                    {
                        successDiv.Style["display"] = "none";
                        failedDiv.Style["display"] = "none";
                    }
                }
                dBconnection.closeConnection();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }

        }
    }
}
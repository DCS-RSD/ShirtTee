﻿using Stripe;
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
    public partial class AddVoucherForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine(calExpireDate.SelectedDate);
            try
            {
                DBconnection dbconnection = new DBconnection();

                string sqlCommand = "INSERT INTO Voucher (voucher_name, voucher_description, discount_rate, min_spend, cap_at ,expiry_date)" +
                   "VALUES (@voucher_name, @voucher_description, @discount_rate, @min_spend, @cap_at ,@expiry_date)";

                double discount = Convert.ToDouble(txtDiscount.Text) / 100;
                SqlParameter[] parameters = {
                new SqlParameter("@voucher_name", txtVoucherName.Text),
                new SqlParameter("@voucher_description", txtVoucherDesc.Text),
                new SqlParameter("@discount_rate", discount),
                new SqlParameter("@min_spend", Convert.ToDouble(txtMinSpend.Text)),
                new SqlParameter("@expiry_date", calExpireDate.SelectedDate),
                new SqlParameter("@cap_at", Convert.ToInt32(txtCapAt.Text))
                };

                if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                {
                    Session["VoucherAdded"] = "success";
                    StripeConfiguration.ApiKey = ConfigurationManager.AppSettings["StripeSecretKey"];
                    var options = new CouponCreateOptions
                    {
                        Duration = "once",
                        Name = txtVoucherName.Text,
                        Id = txtVoucherName.Text,
                        PercentOff = (decimal)discount,
                        RedeemBy = calExpireDate.SelectedDate,
                    };

                    var service = new CouponService();
                    service.Create(options);
                }
            }
            catch (Exception ex)
            {
                Session["VoucherAdded"] = "error";
            }
            finally
            {
                Response.Redirect(ResolveUrl("~/admin/Voucher.aspx").ToString());
            }

        }
    }
}
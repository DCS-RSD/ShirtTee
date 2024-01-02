using Stripe;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class VoucherDetails : System.Web.UI.Page
    {
        static string voucherName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["voucher_id"] == null)
            {
                Panel1.Visible = false;
                lblError.Visible = true;
                lblError.Text = "<div class=\"grid h-screen place-content-center bg-white px-4\">" +
                    "<h1 class=\"text-center uppercase tracking-widest text-gray-500\">404 | Not Found</h1>" +
                    "</div>";
            }
            else
            {
                if (!IsPostBack)
                {
                    fetchData();
                }


            }
        }

        private void fetchData()
        {
            try
            {
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@voucher_ID", Request.QueryString["voucher_id"])
                };
                dbconnection.createConnection();
                SqlDataReader voucherDetails = dbconnection.ExecuteQuery("SELECT * FROM [Voucher] WHERE voucher_ID = @voucher_ID", parameterUrl)
                    .ExecuteReader();

                if (voucherDetails.HasRows)
                {
                    voucherDetails.Read();
                    voucherName = voucherDetails["voucher_name"].ToString();

                    lblTitle.Text = voucherDetails["voucher_name"].ToString();
                    txtCapAt.Text = voucherDetails["cap_at"].ToString();

                    txtDiscount.Text = ((double)voucherDetails["discount_rate"] * 100).ToString();

                    txtMinSpend.Text = voucherDetails["min_spend"].ToString();
                    txtVoucherDesc.Text = voucherDetails["voucher_description"].ToString();
                    txtVoucherName.Text = voucherDetails["voucher_name"].ToString();
                    txtDate.Text = voucherDetails["expiry_date"].ToString();
                }
                dbconnection.closeConnection();
            }
            catch (Exception)
            {
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                DBconnection dbconnection = new DBconnection();

                string sqlCommand = "UPDATE Voucher SET " +
                       "deleted_at = @deleted_at " +
                       "WHERE voucher_ID = @voucher_ID";

                SqlParameter[] parameters = {
                new SqlParameter("@deleted_at", DateTime.Now),
                new SqlParameter("@voucher_ID",Request.QueryString["voucher_id"])
                };


                if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                {
                    Session["VoucherDeleted"] = "success";

                }
            }
            catch (Exception)
            {
                Session["VoucherDeleted"] = "error";
            }
            finally
            {
                Response.Redirect(ResolveUrl("~/admin/Voucher.aspx").ToString());
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    DBconnection dbconnection = new DBconnection();

                    string sqlCommand = "UPDATE Voucher SET" +
                        " voucher_name = @voucher_name," +
                        " voucher_description = @voucher_description," +
                        " discount_rate = @discount_rate, " +
                        " min_spend = @min_spend, " +
                        " cap_at = @cap_at," +
                        " expiry_date = @expiry_date " +
                        " WHERE voucher_ID = @voucher_ID";

                    double discount = Convert.ToDouble(txtDiscount.Text) / 100;
                    SqlParameter[] parameters = {
                new SqlParameter("@voucher_name", txtVoucherName.Text),
                new SqlParameter("@voucher_description", txtVoucherDesc.Text),
                new SqlParameter("@discount_rate", discount),
                new SqlParameter("@min_spend", Convert.ToDouble(txtMinSpend.Text)),
                new SqlParameter("@expiry_date",SqlDbType.Date){ Value = txtDate.Text},
                new SqlParameter("@cap_at", Convert.ToInt32(txtCapAt.Text)),
                new SqlParameter("@voucher_ID", Request.QueryString["voucher_id"])
                };

                dbconnection.createConnection();
                bool valid= dbconnection.ExecuteNonQuery(sqlCommand, parameters);
                dbconnection.closeConnection();
                if (valid)
{
                        Session["VoucherUpdated"] = "success";

                        StripeConfiguration.ApiKey = ConfigurationManager.AppSettings["StripeSecretKey"];
                        var service = new CouponService();
                        service.Delete(voucherName);

                        StripeConfiguration.ApiKey = ConfigurationManager.AppSettings["StripeSecretKey"];
                        var options = new CouponCreateOptions
                        {
                            Duration = "once",
                            Name = txtVoucherName.Text,
                            Id = txtVoucherName.Text,
                            PercentOff = (decimal)discount,
                            RedeemBy = DateTime.Parse(txtDate.Text)
                        };

                        var service2 = new CouponService();
                        service2.Create(options);

                        fetchData();
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex.Message + "\n>>" + voucherName);
                    Session["VoucherUpdated"] = "error";
                }
                finally
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
                }

            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DBconnection dbconnection = new DBconnection();
            SqlParameter[] parameter = new SqlParameter[]{
                 new SqlParameter("@voucher_name", txtVoucherName.Text),
            };
            dbconnection.createConnection();

            SqlDataReader findVoucher = dbconnection.ExecuteQuery(
                "SELECT * FROM [Voucher] " +
                "WHERE voucher_name = @voucher_name ",
            parameter).ExecuteReader();

            if (findVoucher.HasRows)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
            dbconnection.closeConnection();
        }
    }
}
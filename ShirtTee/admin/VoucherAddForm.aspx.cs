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
    public partial class AddVoucherForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) 
            {
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
                new SqlParameter("@expiry_date", SqlDbType.Date) {Value=txtDate.Text},
                new SqlParameter("@cap_at", Convert.ToInt32(txtCapAt.Text))
                };

                dbconnection.createConnection();

                    System.Diagnostics.Debug.WriteLine(txtDate.Text);


                    if (dbconnection.ExecuteNonQuery(sqlCommand, parameters))
                    {
                        Session["VoucherAdded"] = "success";

                    }
                dbconnection.closeConnection();

                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex.Message);
                    Session["VoucherAdded"] = "error";
                }
                finally
                {
                    Response.Redirect(ResolveUrl("~/admin/Voucher.aspx").ToString());

                }

            }


        }


        protected void CustomValidator1_ServerValidate1(object source, ServerValidateEventArgs args)
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
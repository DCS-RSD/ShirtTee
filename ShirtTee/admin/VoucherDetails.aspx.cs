using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class VoucherDetails : System.Web.UI.Page
    {
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
                DBconnection dbconnection = new DBconnection();
                SqlParameter[] parameterUrl = new SqlParameter[]{
                 new SqlParameter("@voucher_ID", Request.QueryString["voucher_id"])
                };
                SqlDataReader voucherDetails = dbconnection.ExecuteQuery("SELECT * FROM [Voucher] WHERE voucher_ID = @voucher_ID", parameterUrl)
                    .ExecuteReader();


                if (voucherDetails.HasRows)
                {
                    voucherDetails.Read();

                    lblSubTitle.Text = voucherDetails["voucher_ID"].ToString();
                    lblTitle.Text = voucherDetails["voucher_name"].ToString();
                    txtCap.Text = voucherDetails["cap_at"].ToString();
                    txtDiscount.Text = voucherDetails["discount_rate"].ToString();
                    txtMin.Text = voucherDetails["min_spend"].ToString();
                    txtVoucherDesc.Text = voucherDetails["voucher_description"].ToString();
                    txtVoucherName.Text = voucherDetails["voucher_name"].ToString();

                }

            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class Voucher : System.Web.UI.Page
    {

        const string query = "SELECT * FROM [Voucher] ";
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (IsPostBack)
            {
                try
                {
                    if (txtSearch.Text != "" && ddlIsExpired.SelectedIndex != 0)
                    {
                        SqlDataSource1.SelectCommand = query + " AND voucher_name LIKE '%' + @voucher_name + '%'";
                        if (ddlIsExpired.SelectedValue == "active")
                        {
                            SqlDataSource1.SelectCommand += " AND expiry_date >= @today ";

                        }
                        else
                        {
                            SqlDataSource1.SelectCommand += " AND expiry_date < @today ";
                        }
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("product_name", txtSearch.Text);
                        SqlDataSource1.SelectParameters.Add("today", DbType.Date, DateTime.Now.Date.ToString("yyyy-MM-dd"));

                    }
                    else if (ddlIsExpired.SelectedIndex != 0)
                    {
                        if (ddlIsExpired.SelectedValue == "active")
                        {
                            SqlDataSource1.SelectCommand = query + " WHERE expiry_date >= @today  ";

                        }
                        else
                        {
                            SqlDataSource1.SelectCommand += " WHERE expiry_date < @today ";
                        }
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("today", DbType.Date, DateTime.Now.Date.ToString("yyyy-MM-dd"));
                    }
                    else if (txtSearch.Text != "")
                    {
                        SqlDataSource1.SelectCommand = query + " AND voucher_name LIKE '%' + @product_name + '%'";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("voucher_name", txtSearch.Text);
                    }
                    else
                    {
                        SqlDataSource1.SelectCommand = query;
                        SqlDataSource1.SelectParameters.Clear();
                    }

                    ListView1.DataBind();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex.Message + "\n" + query + "\n" + SqlDataSource1.SelectCommand);
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["VoucherAdded"] != null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessToast", "showSuccessToast();", true);
                }
                if (Session["VoucherDeleted"] != null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessDeleteToast", "showSuccessDeleteToast();", true);
                }
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ddlIsExpired_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater2.Visible = false;
            string prodCategory = Request.QueryString["category"];
            string search = Request.QueryString["search"];
            if (prodCategory != null)
            {
                if (prodCategory.Equals("men"))
                {
                    lblProduct.Text = "MEN";
                }
                else if (prodCategory.Equals("women"))
                {
                    lblProduct.Text = "WOMEN";
                }
                else if (prodCategory.Equals("kids"))
                {
                    lblProduct.Text = "KIDS";
                }
                Repeater2.Visible = false;
            }
            else if (search != null)
            {
                lblProduct.Text = "Search Results";
                SqlDataSource newDataSource = new SqlDataSource();
                newDataSource.ID = "NewDataSource";
                newDataSource.ConnectionString = "YourConnectionString";
                newDataSource.SelectCommand = "SELECT * FROM YourNewTable";

                Repeater1.Visible = false;
                Repeater2.Visible = true;
                // Bind the data
                Repeater2.DataBind();
            }

        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            string search = "";
            if (Request.QueryString["search"] != null)
            {
                search = Request.QueryString["search"].ToString();
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                DataRowView dataItem = (DataRowView)e.Item.DataItem;
                if (!string.IsNullOrEmpty(search))
                {
                    string temp = dataItem["product_name"].ToString().ToLower();
                    if (temp.Contains(search.ToLower()))
                    {
                        e.Item.Visible = true;
                    }
                    else { e.Item.Visible = false; }

                }
            }


        }
    }
}
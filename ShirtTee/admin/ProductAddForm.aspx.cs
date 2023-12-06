using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.admin
{
    public partial class AddProductForm : System.Web.UI.Page
    {
        int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProdCategory.Enabled = true;
        }

        protected void btnAddImageInput_Click(object sender, EventArgs e)
        {

            i++;
                FileUpload newFileUpload = new FileUpload();
                //newFileUpload.ID = "fileImageExtra" + (Panel1.Controls.Count + 1);
                Panel1.Controls.Add(newFileUpload);
                test.Text = Panel1.Controls.Count.ToString() + i++;
            
        }
    }
}
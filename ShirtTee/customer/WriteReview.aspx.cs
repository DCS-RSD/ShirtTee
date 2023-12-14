using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShirtTee.customer
{
    public partial class WriteReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmitReview_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/customer/Review.aspx");
            //string editorContent = Label1.Text;
        }
    }
}
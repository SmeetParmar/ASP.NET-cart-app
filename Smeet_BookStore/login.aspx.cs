using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smeet_BookStore
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["firstName"] != null && Session["lastName"] != null)
            {
                Response.Write("<Script>alert('You are already logged in....')</Script>");
                Response.Write("<Script>window.location.href='products.aspx'</Script>");
            }
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            Session["firstName"] = firstName.Text.ToString();
            Session["lastName"] = lastName.Text.ToString();
            Response.Redirect("products.aspx");
        }

        protected void cancleButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}
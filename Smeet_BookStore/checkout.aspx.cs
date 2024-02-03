using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smeet_BookStore
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }   

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            //when all validations will be correct then order will be placed and cart will be empty...
            Response.Write("<script>alert('Order Placed...')</script>");
            Session["finalBookID"] = null;  
            Response.Write("<script>window.location.href='index.aspx'</script>");
        }

        protected void btnGoToCart_Click(object sender, EventArgs e)
        {
            //redirecting to cart page...
            Response.Redirect("cart.aspx");
        }

        protected void btnContinueShoping_Click(object sender, EventArgs e)
        {
            //redirecting to products page...
            Response.Redirect("products.aspx");
        }
    }
}
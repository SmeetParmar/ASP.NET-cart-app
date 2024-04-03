using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smeet_BookStore
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["firstName"] == null && Session["lastName"] == null)
            {
                Response.Write("<Script>alert('Oops!! You need to login first')</Script>");
                Response.Write("<Script>window.location.href='login.aspx'</Script>");
            }
        }

        protected void GenreAdd(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource3.InsertParameters;
                parameters["genreName"].DefaultValue = genreName.Text;
               
                try
                {
                    SqlDataSource3.Insert();
                    genreName.Text = "";
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

 
    }
}
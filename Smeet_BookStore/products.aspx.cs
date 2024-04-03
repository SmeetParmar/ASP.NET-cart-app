using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Smeet_BookStore
{
    public partial class products : System.Web.UI.Page
    {
       
        SqlConnection conncection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["firstName"] == null && Session["lastName"] == null)
            {
                Response.Write("<Script>alert('Oops!! You need to login first')</Script>");
                Response.Write("<Script>window.location.href='login.aspx'</Script>");
            }
            else
            {
                welcomeMsg.Text = "Welcome, " + Session["firstName"];
            }
            if(!IsPostBack)
            {
                //binding dropdoow when page is loaded...
                bindDropDownList();
            }
        }

        protected void bindDropDownList()
        {
            conncection.Open();
            //selecting the genre data and binding it to genre dropdown list...
            SqlCommand cmd = new SqlCommand("select * from [dbo].[genre]", conncection);
            cmd.CommandType = CommandType.Text;
            genreName.DataSource = cmd.ExecuteReader();
            genreName.DataTextField = "genreName";
            genreName.DataValueField = "Id";
            genreName.DataBind();
            genreName.Items.Insert(0, new ListItem("Select Genre"));
            bookName.Items.Insert(0, new ListItem("Select Book"));
        }

        protected void genreName_SelectedIndexChanged(object sender, EventArgs e)
        {
            int genreId = Convert.ToInt32(genreName.SelectedValue);
            conncection.Open();
            //selecting book according to genre selected and binding it to book dropdown list...
            SqlCommand cmd = new SqlCommand("select * from [dbo].[books] where genreID = " + genreId, conncection);
            bookName.DataSource = cmd.ExecuteReader();
            bookName.DataTextField = "bookName";
            bookName.DataValueField = "Id";
            bookName.DataBind();
        }

        protected void bookName_SelectedIndexChanged(object sender, EventArgs e)
        {
            quan.Visible = true;
            quantity.Visible = true;
            quantity.Text = "1";
            int bookId = Convert.ToInt32(bookName.SelectedValue);
            conncection.Open();
            //when book will be selected then data will be shown on labels of book name, description, price and author...
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT * FROM [dbo].[books] WHERE [id]=" +bookId, conncection);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            bookNameLable.Text = "Book Name : " + dt.Rows[0][2].ToString();
            bookDescriptionLable.Text = dt.Rows[0][3].ToString();
            bookPriceLable.Text = "Price : " + dt.Rows[0][4].ToString() + "$";
            bookAuthorNameLable.Text = "Author : " + dt.Rows[0][5].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        { 
            //when add to cart button will be clicked id of book selected will be stored in session...
            int selectedBookId = Convert.ToInt32(bookName.SelectedValue);
            Session["finalBookID"] += selectedBookId.ToString()+":"+quantity.Text.ToString()+",";
            Response.Write("<script>alert('Item Added...')</script>");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //redirecting to cart page...
            Response.Redirect("cart.aspx");
        }
    }
}
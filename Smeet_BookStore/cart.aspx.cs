using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smeet_BookStore
{
    public partial class cart : System.Web.UI.Page
    {
        SqlConnection conncection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Filling the cartListBox...
                checkCart();
            }
        }

        protected void checkCart()
        {
            //checking if seesion of bookIDs is null or not?
            if (Session["finalBookID"] != null)
            { 
                String IDS = Session["finalBookID"].ToString();
                //splitting the string of book id's by comma and assigning it to an array...
                string[] singleID = IDS.Split(',');
                using (conncection)
                {
                    conncection.Open();

                    //iterating through IDS...
                    foreach (string ID in singleID)
                    {
                        if (int.TryParse(ID, out int bookId))
                        {
                            //selecting the data of book according to book ids ordered using SqlDataAdapter object...
                            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM [dbo].[books] WHERE [id]=" + ID, conncection);
                            //making new object to DataTable...
                            DataTable dt = new DataTable();
                            //filling the table with data...
                            adapter.Fill(dt);
                            //assigning name and price of book to a string and adding it to cartListBox...
                            string bookName = dt.Rows[0]["bookName"].ToString();
                            string bookPrice = dt.Rows[0]["bookPrice"].ToString();
                            cartListBox.Items.Add(bookName + ", for " + bookPrice + "$");
                        }
                    }
                }
            }
            else
            {
                //if cart is empty following error will be shown...
                errorMessageCart.Text = "Cart is empty...";
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            //when empty cart button will be clicked session will be null and clearing the cartListBox...
            Session["finalBookID"] = null;
            cartListBox.Items.Clear();
            checkCart();
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            //removing the selected item...
            cartListBox.Items.RemoveAt(cartListBox.SelectedIndex);
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            //redirecting to products page...
            Response.Redirect("products.aspx");
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            //redirect to checkout page...
            Response.Redirect("checkout.aspx");
        }
    }
}
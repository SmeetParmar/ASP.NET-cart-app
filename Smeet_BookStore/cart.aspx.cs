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
    // Checking if session of bookIDs is null or not
    if (Session["finalBookID"] != null)
    {
        string IDS = Session["finalBookID"].ToString();

        // Splitting the string of book IDs by comma and assigning it to an array
        string[] singleID = IDS.Split(',');

                using (conncection)
                {
                    conncection.Open();

                    foreach (string ID in singleID)
                    {
                        // Splitting each pair by colon to separate the two numbers
                        string[] numbers = ID.Split(':');

                        if (numbers.Length == 2 && int.TryParse(numbers[0], out int newID) && int.TryParse(numbers[1], out int quantity))
                        {
                            // Selecting the data of a book according to book ID using SqlDataAdapter
                            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM [dbo].[books] WHERE [id]=" + newID, conncection);

                            // Making a new DataTable
                            DataTable dt = new DataTable();

                            // Filling the table with data
                            adapter.Fill(dt);

                            // Checking if any rows were returned
                            if (dt.Rows.Count > 0)
                            {
                                // Assigning name and price of the book to a string and adding it to cartListBox
                                string bookName = dt.Rows[0]["bookName"].ToString();
                                string bookPrice = dt.Rows[0]["bookPrice"].ToString();
                                double finalPrice = Convert.ToDouble(dt.Rows[0]["bookPrice"]) * Convert.ToDouble(quantity);
                                cartListBox.Items.Add(bookName + " for " + bookPrice + "$" + " ("+bookPrice+"*"+quantity+")"+" Total = "+finalPrice);
                            }
                        }
                    }
                }
    }
    else
    {
        // If the cart is empty, show an error message
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
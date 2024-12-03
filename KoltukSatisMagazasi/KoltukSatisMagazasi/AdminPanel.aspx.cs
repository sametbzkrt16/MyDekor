using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;

namespace KoltukSatisMagazasi
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        public SqlConnection GetConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SignUpDBConnection"].ConnectionString;
            return new SqlConnection(connectionString);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Oturum kontrolü
            if (Session["AdminUsername"] == null)
            {
                Response.Redirect("AdminLogin.aspx"); // Giriş yapılmamışsa giriş sayfasına yönlendir
            }

            if (!IsPostBack)
            {
                LoadProducts(); // Ürünleri yükleme işlemi
                LoadCategories(); // Kategorileri yükleme
            }
        }

        private void LoadProducts()
{
    using (SqlConnection conn = GetConnection())
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT UrunID, UrunAdi, UrunFiyati, UrunResmi, UrunAciklamasi FROM Puflar", conn);
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adapter.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}

        private void LoadCategories()
        {
            using (SqlConnection conn = GetConnection())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT CategoryID, CategoryName FROM categories", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                ddlCategories.DataSource = dt;
                ddlCategories.DataTextField = "CategoryName"; // Görünen metin
                ddlCategories.DataValueField = "CategoryID"; // Değer
                ddlCategories.DataBind();
                ddlCategories.Items.Insert(0, new ListItem("-- Kategori Seçin --", "0")); // İlk öğe
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string productName = txtProductName.Text;
            decimal productPrice = Convert.ToDecimal(txtPrice.Text);
            string productDescription = txtProductDescription.Text;
            string productImage = "";

            // Resim dosyasını yükleme
            if (fileProductImage.HasFile)
            {
                string fileName = Path.GetFileName(fileProductImage.FileName);
                string filePath = Server.MapPath("~/Uploads/") + fileName;
                fileProductImage.SaveAs(filePath);
                productImage = "~/Uploads/" + fileName; // Yüklenen dosyanın yolunu kaydet
            }

            int categoryId = Convert.ToInt32(ddlCategories.SelectedValue);

            using (SqlConnection conn = GetConnection())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Puflar (UrunAdi, UrunFiyati, UrunAciklamasi, UrunResmi, CategoryID) VALUES (@UrunAdi, @UrunFiyati, @UrunAciklamasi, @UrunResmi, @CategoryID)", conn);
                cmd.Parameters.AddWithValue("@UrunAdi", productName);
                cmd.Parameters.AddWithValue("@UrunFiyati", productPrice);
                cmd.Parameters.AddWithValue("@UrunAciklamasi", productDescription);
                cmd.Parameters.AddWithValue("@UrunResmi", productImage);
                cmd.Parameters.AddWithValue("@CategoryID", categoryId);
                cmd.ExecuteNonQuery();
                LoadProducts();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                using (SqlConnection conn = GetConnection())
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM Puflar WHERE UrunID = @Id", conn);
                    cmd.Parameters.AddWithValue("@Id", productId);
                    cmd.ExecuteNonQuery();
                    LoadProducts();
                }
            }
            else if (e.CommandName == "Edit")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                // Düzenleme işlemi için gerekli kodları ekleyin
            }
        }
    }
}

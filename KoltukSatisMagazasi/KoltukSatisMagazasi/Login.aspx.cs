using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KoltukSatisMagazasi
{
    public partial class Login1 : System.Web.UI.Page
    {

        protected void btnLogin_Click(object sender, EventArgs e)
{
    string username = txtLoginUsername.Text;
    string password = txtLoginPassword.Text;

    // Şifreyi hash'leme
    string passwordHash = ComputeSha256Hash(password);

    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SignUpDBConnection"].ConnectionString;

    using (SqlConnection conn = new SqlConnection(connectionString))
    {
        string query = "SELECT COUNT(*) FROM Users WHERE Username=@Username AND PasswordHash=@PasswordHash";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@Username", username);
        cmd.Parameters.AddWithValue("@PasswordHash", passwordHash);

        conn.Open();
        int count = (int)cmd.ExecuteScalar();

        if (count > 0)
        {
            // Giriş başarılı
            Session["Username"] = username;
            Response.Redirect("AnaSayfa.aspx");
        }
        else
        {
            // Hata mesajını lblError kontrolünde göster
            lblError.Text = "Kullanıcı adı veya şifre yanlış.";
            lblError.Visible = true; // Mesajı görünür yap
        }
    }
}


        // Aynı hash fonksiyonu
        private static string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}
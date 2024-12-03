using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Configuration;

namespace KoltukSatisMagazasi
{
    public partial class AdminLogin : Page
    {
        public SqlConnection GetConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SignUpDBConnection"].ConnectionString;
            return new SqlConnection(connectionString);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            using (SqlConnection conn = GetConnection())
            {
                conn.Open();
                // Kullanıcı adı ve şifreyi kontrol eden SQL sorgusu
                SqlCommand cmd = new SqlCommand("SELECT * FROM yöneticiler WHERE kullanıcı_adı = @username AND şifre = @password", conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password); // Şifre hashing yapılmadığı varsayımında

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    Session["IsAdmin"] = true;
                    Response.Redirect("~/Puf.aspx");
                }
                else
                {
                    lblError.Text = "Kullanıcı adı veya şifre yanlış!";
                    // Hata ayıklamak için durumu kontrol edin
                    System.Diagnostics.Debug.WriteLine("Kullanıcı adı veya şifre yanlış!");
                }

            }
        }
    }
}

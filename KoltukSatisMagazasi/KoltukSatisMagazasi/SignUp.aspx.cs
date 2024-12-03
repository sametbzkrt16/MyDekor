using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace KoltukSatisMagazasi
{
    public partial class SignUp : Page
    {
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Kullanıcı adı, şifre ve e-posta alanlarının boş olup olmadığını kontrol et
            if (string.IsNullOrWhiteSpace(txtUsername.Text))
            {
                lblError.Text = "Kullanıcı adı boş olamaz!";
                return; // Hata durumunda işlemi durdur
            }
            if (string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblError.Text = "Şifre boş olamaz!";
                return; // Hata durumunda işlemi durdur
            }
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblError.Text = "E-posta boş olamaz!";
                return; // Hata durumunda işlemi durdur
            }

            string username = txtUsername.Text.Trim(); // Kullanıcı adını al ve boşlukları temizle
            string password = txtPassword.Text; // Parolayı al
            string email = txtEmail.Text.Trim(); // E-posta adresini al ve boşlukları temizle

            // E-posta formatını kontrol et
            if (!IsValidEmail(email))
            {
                lblError.Text = "Geçerli bir e-posta adresi girin!";
                return; // Hata oluştu, işlemi durdur
            }

            // Parolanızı hash'leme işlemleri burada yapılacak
            string passwordHash = ComputeSha256Hash(password);

            // Bağlantı dizesini alın
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SignUpDBConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Kullanıcı adının veritabanında mevcut olup olmadığını kontrol et
                string checkUserSql = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
                using (SqlCommand checkUserCmd = new SqlCommand(checkUserSql, conn))
                {
                    checkUserCmd.Parameters.AddWithValue("@Username", username);
                    int userExists = (int)checkUserCmd.ExecuteScalar();

                    if (userExists > 0)
                    {
                        lblError.Text = "Bu kullanıcı adı zaten alınmış.";
                        return; // Hata oluştu, işlemi durdur
                    }
                }

                string sql = "INSERT INTO Users (Username, PasswordHash, Email, CreatedDate) VALUES (@Username, @PasswordHash, @Email, @CreatedDate)";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@PasswordHash", passwordHash);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now); // CreatedDate değerini ekleyin

                    try
                    {
                        cmd.ExecuteNonQuery(); // Kayıt işlemi
                        lblMessage.Text = "Kayıt işleminiz başarılı. Yönlendiriliyorsunuz..."; // Başarı mesajı
                        Response.Redirect("Login.aspx");
                    }
                    catch (Exception ex)
                    {
                        // Hata işlemleri
                        lblError.Text = "Bir hata oluştu: " + ex.Message; // Hata mesajını göster
                    }
                }
            }
        }

        // SHA-256 ile şifreyi hash'leme fonksiyonu
        private static string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2")); // Hash'lenmiş veriyi hexadecimal formatında ekleyin
                }
                return builder.ToString(); // Hash'lenmiş şifreyi döndürün


            }
        }
        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
    }
}


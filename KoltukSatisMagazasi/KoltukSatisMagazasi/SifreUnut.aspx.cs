using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KoltukSatisMagazasi
{
    public partial class SifreUnut : System.Web.UI.Page
    {


        protected void btnSifirla_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            // Veritabanı bağlantısı
            string connectionString = ConfigurationManager.ConnectionStrings["SignUpDBConnection"].ConnectionString; // Güncellenmiş
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM Users WHERE Email = @Email";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    // E-posta gönderimi için şifre sıfırlama bağlantısı oluştur
                    string resetCode = Guid.NewGuid().ToString();
                    string resetLink = $"http://localhost:44375/SifreSifirla.aspx?code={resetCode}";
                    // E-posta gönder
                    SendEmail(email, resetLink);

                    // Veritabanında resetCode güncelle
                    reader.Close();
                    string updateQuery = "UPDATE Users SET ResetCode = @ResetCode WHERE Email = @Email";
                    SqlCommand updateCommand = new SqlCommand(updateQuery, connection);
                    updateCommand.Parameters.AddWithValue("@ResetCode", resetCode);
                    updateCommand.Parameters.AddWithValue("@Email", email);
                    updateCommand.ExecuteNonQuery();

                    lblMessage.Text = "Şifre sıfırlama bağlantısı e-posta adresinize gönderildi.";
                }
                else
                {
                    lblMessage.Text = "E-posta adresi bulunamadı.";
                }
            }
        }

        private void SendEmail(string toEmail, string resetLink)
        {
            try
            {
                MailMessage mail = new MailMessage("your-email@gmail.com", toEmail);
                mail.Subject = "Şifre Sıfırlama";
                mail.Body = $"Şifrenizi sıfırlamak için lütfen aşağıdaki bağlantıya tıklayın: {resetLink}";
                mail.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
                smtpClient.Port = 587;
                smtpClient.Credentials = new System.Net.NetworkCredential("your-email@gmail.com", "your-email-password");
                smtpClient.EnableSsl = true;


                smtpClient.Send(mail);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "E-posta gönderilirken bir hata oluştu: " + ex.Message;
            }
        }

    }
}
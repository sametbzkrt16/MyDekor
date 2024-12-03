using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KoltukSatisMagazasi
{
    public partial class SifreSifirla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Sayfa yüklendiğinde kod kontrol edilmeli
            if (string.IsNullOrEmpty(Request.QueryString["code"]))
            {
                Response.Redirect("SifreUnut.aspx");
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string newPassword = txtNewPassword.Text.Trim();
            string resetCode = Request.QueryString["code"];

            // Veritabanı bağlantısı
            string connectionString = ConfigurationManager.ConnectionStrings["SignUpDBConnection"].ConnectionString; // Güncellenmiş
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "UPDATE Users SET Password = @Password, ResetCode = NULL WHERE ResetCode = @ResetCode";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Password", newPassword);
                command.Parameters.AddWithValue("@ResetCode", resetCode);

                int rowsAffected = command.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    lblMessage.Text = "Şifreniz başarıyla değiştirildi.";
                }
                else
                {
                    lblMessage.Text = "Geçersiz bağlantı.";
                }
            }
        }
    }
}
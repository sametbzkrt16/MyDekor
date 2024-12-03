using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KoltukSatisMagazasi
{
    public partial class Puf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KontrolAdmin(); // Kullanıcının admin olup olmadığını kontrol et
                UrunleriGetir(); // Sayfa yüklendiğinde ürünleri getir
            }
        }

        private void KontrolAdmin()
        {
            // Admin kontrolü, kullanıcı oturumunu kontrol et
            if (Session["IsAdmin"] != null && (bool)Session["IsAdmin"])
            {
                BtnUrunEkle.Visible = true;
                BtnUrunSil.Visible = true;
                BtnUrunGuncelle.Visible = true;
            }
        }

        private void UrunleriGetir()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["SignUpDBConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT UrunAdi, UrunFiyati, UrunResmi FROM Puflar", conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        // Ürünleri çek ve kaydırıcıda göstermek için ayarla
                        lblUrunAdi.Text = reader["UrunAdi"].ToString();
                        lblUrunFiyati.Text = reader["UrunFiyati"].ToString();
                    }
                }
            }
        }

        protected void SepeteEkle_Click(object sender, EventArgs e)
        {
            // Ürün adını ve fiyatını label'dan al
            string urunAdi = lblUrunAdi.Text; // Ürün adını dinamik olarak al
            decimal urunFiyati = decimal.Parse(lblUrunFiyati.Text); // Ürün fiyatını dinamik olarak al

            // Sepet kontrolü (Session kullanarak)
            if (Session["Sepet"] == null)
            {
                List<Tuple<string, decimal>> sepet = new List<Tuple<string, decimal>>();
                sepet.Add(new Tuple<string, decimal>(urunAdi, urunFiyati));
                Session["Sepet"] = sepet;
            }
            else
            {
                List<Tuple<string, decimal>> sepet = (List<Tuple<string, decimal>>)Session["Sepet"];
                sepet.Add(new Tuple<string, decimal>(urunAdi, urunFiyati));
                Session["Sepet"] = sepet;
            }

            // Sepet güncellendikten sonra sayfayı yenileyelim
            Response.Redirect(Request.RawUrl);
        }

        protected void BtnUrunEkle_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["SignUpDBConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Puflar (UrunAdi, UrunFiyati, UrunResmi) VALUES (@UrunAdi, @UrunFiyati, @UrunResmi)", conn);
                cmd.Parameters.AddWithValue("@UrunAdi", TxtUrunAdi.Text);
                cmd.Parameters.AddWithValue("@UrunFiyati", decimal.Parse(TxtUrunFiyati.Text));
                cmd.Parameters.AddWithValue("@UrunResmi", TxtUrunResmi.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            Response.Redirect(Request.RawUrl); // Sayfayı yenile
        }

        protected void BtnUrunSil_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["SignUpDBConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Puflar WHERE UrunID = @UrunID", conn);
                cmd.Parameters.AddWithValue("@UrunID", int.Parse(TxtUrunID.Text));
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            Response.Redirect(Request.RawUrl); // Sayfayı yenile
        }

        protected void BtnUrunGuncelle_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["SignUpDBConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Puflar SET UrunAdi = @UrunAdi, UrunFiyati = @UrunFiyati, UrunResmi = @UrunResmi WHERE UrunID = @UrunID", conn);
                cmd.Parameters.AddWithValue("@UrunID", int.Parse(TxtUrunIDGuncelle.Text));
                cmd.Parameters.AddWithValue("@UrunAdi", TxtUrunAdiGuncelle.Text);
                cmd.Parameters.AddWithValue("@UrunFiyati", decimal.Parse(TxtUrunFiyatiGuncelle.Text));
                cmd.Parameters.AddWithValue("@UrunResmi", TxtUrunResmiGuncelle.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            Response.Redirect(Request.RawUrl); // Sayfayı yenile
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KoltukSatisMagazasi
{
    public partial class KoseKT : System.Web.UI.Page
    {
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
    }
}
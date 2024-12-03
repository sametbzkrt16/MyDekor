using System.Collections.Generic;
using System.Linq;
using KoltukSatisMagazasi.Models;

namespace KoltukSatisMagazasi.Models
{
    // Sepetteki ürünleri temsil eden sınıf
    public class CartItem
    {
        public string ProductName { get; set; } // Ürün adı
        public decimal Price { get; set; } // Ürün fiyatı
        public int Quantity { get; set; } // Ürün miktarı
    }

    // Sepeti yöneten sınıf
    public class ShoppingCart
    {
        public List<CartItem> Items { get; private set; } = new List<CartItem>(); // Sepetteki ürünler

        // Sepete ürün ekleyen metot
        public void AddToCart(string productName, decimal price)
        {
            var item = Items.FirstOrDefault(i => i.ProductName == productName); // Ürün var mı kontrol et
            if (item != null)
            {
                item.Quantity++; // Miktarı artır
            }
            else
            {
                // Yeni ürün ekle
                Items.Add(new CartItem { ProductName = productName, Price = price, Quantity = 1 });
            }
        }

        // Sepetteki toplam tutarı hesapla
        public decimal TotalAmount => Items.Sum(i => i.Price * i.Quantity);
    }
}

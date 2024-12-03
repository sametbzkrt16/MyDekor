<%@ Page Title="" Language="C#" MasterPageFile="~/Kullanıcı.Master" AutoEventWireup="true" CodeBehind="Ürünler.aspx.cs" Inherits="KoltukSatisMagazasi.Ürünler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Slider Divi ve Görseller -->
    <div class="auto-style16">
        <div class="slider">
            <div class="slides">
                <!-- Koltuk görselleri slider'da gösteriliyor -->
                <div class="slide-item">
                    <div class="slide-content">
                        <img src="img/köşeatalanta.jpg" alt="Koltuk 1" class="slide-image" />
                        <p class="slide-caption">Köşe Koltuk Takımı - Modern ve şık tasarım.</p>
                    </div>
                </div>
                <div class="slide-item">
                    <div class="slide-content">
                        <img src="ches/ches.jpg" alt="Koltuk 2" class="slide-image" />
                        <p class="slide-caption">Atalanta Koltuk - Konforlu oturum alanı sunar.</p>
                        <asp:Label ID="lblUrunAdi" runat="server" Text="atalanta koltuk"></asp:Label>
                        <asp:Label ID="lblUrunFiyati" runat="server" Text="7500"></asp:Label>
                    </div>
                </div>
                <div class="slide-item">
                    <div class="slide-content">
                        <img src="puf/puffypuf.jpg" alt="Koltuk 2" class="slide-image" />
                        <p class="slide-caption">Atalanta Koltuk - Konforlu oturum alanı sunar.</p>
                        <asp:Label ID="Label1" runat="server" Text="pufy puf"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="2500"></asp:Label>
                    </div>
                </div>
                <div class="slide-item">
                    <div class="slide-content">
                        <img src="kanepe/knp.jpg" alt="Koltuk 2" class="slide-image" />
                        <p class="slide-caption">Atalanta Koltuk - Konforlu oturum alanı sunar.</p>
                        <asp:Label ID="Label3" runat="server" Text="Kanepe"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text="500"></asp:Label>
                    </div>
                </div>
                <div class="slide-item">
                    <div class="slide-content">
                        <img src="berjersss/gizaberjer.jpg" alt="Koltuk 2" class="slide-image" />
                        <p class="slide-caption">Atalanta Koltuk - Konforlu oturum alanı sunar.</p>
                        <asp:Label ID="Label5" runat="server" Text="Kanepe"></asp:Label>
                        <asp:Label ID="Label6" runat="server" Text="500"></asp:Label>
                    </div>
                </div>
                <div class="slide-item">
                    <div class="slide-content">
                        <img src="köşe/koş.jpg" alt="Koltuk 2" class="slide-image" />
                        <p class="slide-caption">Atalanta Koltuk - Konforlu oturum alanı sunar.</p>
                        <asp:Label ID="Label7" runat="server" Text="Kanepe"></asp:Label>
                        <asp:Label ID="Label8" runat="server" Text="500"></asp:Label>
                    </div>
                </div>
                <div class="slide-item">
                    <div class="slide-content">
                        <img src="img/armutatalanta.jpg" alt="Koltuk 3" class="slide-image" />
                        <p class="slide-caption">Armut Koltuk - Rahatlığı ve şıklığı bir arada sunar.</p>
                        <asp:Label ID="Label9" runat="server" Text="Kanepe"></asp:Label>
                        <asp:Label ID="Label10" runat="server" Text="500"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <!-- Durdur ve Devam Et Butonları -->
        <div class="button-container">
            <asp:Button ID="Button1" runat="server" Text="Sepete Ekle" OnClick="SepeteEkle_Click" />
            <button class="auto-style15" type="button" onclick="startAutoSlide()">
                <h2><strong style="border-style: inset; border-width: thick">Devam Et</strong></h2>
            </button>
            <button class="auto-style15" type="button" onclick="stopAutoSlide()">
                <h2><strong style="border-style: inset; border-width: thick">Durdur</strong></h2>
            </button>
        </div>
    </div>

    <!-- Slider ile ilgili JavaScript -->
    <script>
        let slideIndex = 0; // Başlangıç slide index
        let autoSlideInterval; // Otomatik kaydırma intervali
        let isAutoSliding = true; // Otomatik kaydırma durumu

        showSlides(); // İlk slide gösterimi

        function showSlides() {
            const slides = document.querySelectorAll('.slides .slide-item');
            // Slide index sınırlarını kontrol et
            if (slideIndex >= slides.length) { slideIndex = 0; }
            if (slideIndex < 0) { slideIndex = slides.length - 1; }

            const slidesContainer = document.querySelector('.slides');
            slidesContainer.style.transform = 'translateY(' + (-slideIndex * 450) + 'px)'; // 450px yüksekliğinde olduğu için çarpıyoruz

            // Otomatik kaydırmayı ayarlayın
            if (isAutoSliding) {
                autoSlideInterval = setTimeout(() => {
                    slideIndex++; // Bir sonraki slayta geç
                    showSlides(); // Yeni slide'ı göster
                }, 3000); // 5 saniye arayla geçiş yap
            }
        }

        function stopAutoSlide() {
            isAutoSliding = false; // Durumunu güncelle
            clearTimeout(autoSlideInterval); // Otomatik kaydırmayı durdur
        }

        function startAutoSlide() {
            if (!isAutoSliding) {
                isAutoSliding = true; // Durumu güncelle
                showSlides(); // Otomatik kaydırmayı başlat
            }
        }
    </script>

    <style>
        .slides {
            display: flex; /* Slide item'ları dikey dizmek için flex kullanıyoruz */
            flex-direction: column; /* Dikey dizim */
            transition: transform 0.5s ease; /* Geçiş efektini ayarlıyoruz */
        }
        .slide-item {
            display: flex; /* Resmi ve metni yan yana dizmek için flex kullanıyoruz */
            align-items: center; /* Dikey ortalama */
            justify-content: center; /* Yatay ortalama */
            height: 450px; /* Her slide'ın yüksekliği */
            box-sizing: border-box; /* Padding ve border'ı genişlik hesaplamasına dahil et */
        }
        .slide-content {
            display: flex; /* İçeriği yan yana dizmek için flex kullanıyoruz */
            align-items: center; /* Dikey ortalama */
            justify-content: flex-start; /* Yatay hizalamayı sola ayarla */
            height: 100%; /* Yüksekliği doldur */
        }
        .slide-image {
            width: 500px; /* Resmin genişliği */
            height: auto; /* Yüksekliği otomatik ayarlıyoruz */
            margin-right: 20px; /* Resim ile metin arasında boşluk */
        }
        .slide-caption {
            font-size: 20px; /* Yazı boyutunu ayarlıyoruz */
            text-align: left; /* Metni sola hizala */
        }
        .button-container {
            display: flex; /* Butonları yan yana dizmek için flex kullanıyoruz */
            justify-content: center; /* Yatay ortalama */
            margin-top: 20px; /* Butonların üstünde boşluk */
        }
        .auto-style15 {
            width: 140px; /* Buton genişliği */
            margin: 5px; /* Butonlar arası boşluk */
        }
        .auto-style16 {
            margin-left: 20px; /* Sol menünün yanında olacak */
            padding: 20px;
            background-color: #e0e0e0;
            width: 400px; /* Slider genişliği */
            float: left;
            text-align: justify;
        }
    </style>
</asp:Content>

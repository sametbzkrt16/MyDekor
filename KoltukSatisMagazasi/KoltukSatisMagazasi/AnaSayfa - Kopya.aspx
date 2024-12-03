<%@ Page Title="Ana Sayfa" Language="C#" MasterPageFile="~/Kullanıcı.master" AutoEventWireup="true" CodeBehind="AnaSayfa.aspx.cs" Inherits="KoltukSatisMagazasi.AnaSayfa" %>
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
                        <img src="img/atalanta.jpg" alt="Koltuk 2" class="slide-image" />

                        <p class="slide-caption">Atalanta Koltuk - Konforlu oturum alanı sunar.</p>
                    </div>
           

                </div>

                <div class="slide-item">
                    <div class="slide-content">
                        <img src="img/armutatalanta.jpg" alt="Koltuk 3" class="slide-image" />
                        <p class="slide-caption">Armut Koltuk - Rahatlığı ve şıklığı bir arada sunar.</p>
                    </div>
                  

                </div>
                <script>
                  
</script>
            </div>
        </div>
        <!-- Durdur ve Devam Et Butonları -->
        <button class="auto-style15" type="button" onclick="startAutoSlide()"><strong>Devam Et</strong></button>
        <button class="auto-style15" type="button" onclick="stopAutoSlide()"><strong>Durdur</strong></button>
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
            slidesContainer.style.transform = 'translateX(' + (-slideIndex * 700) + 'px)'; // 700px genişlikte olduğu için çarpıyoruz

            // Otomatik kaydırmayı ayarlayın
            if (isAutoSliding) {
                autoSlideInterval = setTimeout(() => {
                    slideIndex++; // Bir sonraki slayta geç
                    showSlides(); // Yeni slide'ı göster
                }, 3000); // 5 saniye arayla geçiş yap
            }
        }

       
    </script>

    <style>
        .slides {
            display: flex; /* Slide item'ları yan yana dizmek için flex kullanıyoruz */
            transition: transform 0.5s ease; /* Geçiş efektini ayarlıyoruz */
        }
        .slide-item {
            display: flex; /* Resmi ve metni yan yana dizmek için flex kullanıyoruz */
            align-items: center; /* Dikey ortalama */
            min-width: 700px; /* Her slide'ın genişliği */
            box-sizing: border-box; /* Padding ve border'ı genişlik hesaplamasına dahil et */
        }
        .slide-content {
            display: flex; /* İçeriği yan yana dizmek için flex kullanıyoruz */
            align-items: center; /* Dikey ortalama */
        }
        .slide-image {
            width: 300px; /* Resmin genişliği */
            height: auto; /* Yüksekliği otomatik ayarlıyoruz */
            margin-right: 20px; /* Resim ile metin arasında boşluk */
        }
        .slide-caption {
            font-size: 16px; /* Yazı boyutunu ayarlıyoruz */
        }
        .auto-style15 {
            width: 120px; /* Buton genişliği */
            margin: 5px; /* Butonlar arası boşluk */
        }
        .auto-style16 {
            margin-left: 20px; /* Sol menünün yanında olacak */
            padding: 20px;
            background-color: #e0e0e0;
            width: 700px;
            float: left;
            text-align: justify;
        }
    </style>
</asp:Content>
<%--  --%>


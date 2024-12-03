<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="KoltukSatisMagazasi.SignUp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kayıt Ol</title>
    <style>
        /* Sayfanın genel stili */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f8ff; /* Arka plan rengi */
            font-family: 'Arial', sans-serif;
        }

        /* Form kutusunun stili */
        #SignUpForm {
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
            transition: box-shadow 0.3s ease;
        }

        #SignUpForm:hover {
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3); /* Hover efekti */
        }

        div {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            transition: border 0.3s ease;
            background-color: #f9f9f9;
        }

        input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus {
            border-color: #007BFF; /* Odaklanma efekti */
            outline: none;
        }

        /* Buton stili */
        button, #btnSignUp {
            background-color: #007BFF;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        button:hover, #btnSignUp:hover {
            background-color: #0056b3; /* Hover efekti */
        }

        /* Hata ve mesaj etiketleri */
        #lblMessage {
            font-size: 14px;
            color: green; /* Başarı mesajının rengi */
        }

        #lblError {
            font-size: 14px;
            color: red;
            margin-top: 10px; /* Mesajın görünürlüğünü artırır */
        }

        /* Giriş Yap bağlantısının stili */
        #loginLink {
            display: block;
            margin-top: 10px;
            font-size: 14px;
            color: #007BFF; /* Link rengi */
            text-decoration: none; /* Altı çizgiyi kaldır */
        }

        #loginLink:hover {
            text-decoration: underline; /* Hover'da altı çizgi ekle */
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#SignUpForm").submit(function (event) {
                var username = $("#<%= txtUsername.ClientID %>").val();
                var password = $("#<%= txtPassword.ClientID %>").val();
                var email = $("#<%= txtEmail.ClientID %>").val();

                if (username === "" || password === "" || email === "") {
                    event.preventDefault(); // Formun gönderilmesini engelle
                    alert("Lütfen tüm alanları doldurun!"); // Kullanıcıya uyarı mesajı göster
                }
            });
        });
    </script>
</head>
<body>
    <form id="SignUpForm" runat="server">
        <div>
            <label for="Username">Kullanıcı Adı:</label>
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Kullanıcı Adınızı Girin"></asp:TextBox>
        </div>
        <div>
            <label for="Password">Şifre:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Şifrenizi Girin"></asp:TextBox>
        </div>
        <div>
            <label for="Email">E-posta:</label>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="E-posta Adresinizi Girin" TextMode="Email"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnSignUp" runat="server" Text="Kayıt Ol" OnClick="btnSignUp_Click" />
        </div>
        <div>
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
        <div>
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
        <div>
            <a id="loginLink" href="Login.aspx">Giriş Yap</a> <!-- Giriş Yap butonu -->
        </div>
    </form>
</body>
</html>

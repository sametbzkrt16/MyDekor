<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KoltukSatisMagazasi.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giriş Yap</title>
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
        #LoginForm {
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }

        /* Hata mesajı kutusu */
        .error-message {
            background-color: #ffcccc; /* Hata kutusunun arka plan rengi */
            border: 1px solid #ff0000; /* Kırmızı kenarlık */
            color: #ff0000; /* Kırmızı metin */
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 20px; /* Aşağıda boşluk */
            display: none; /* Başlangıçta gizle */
            text-align: center; /* Metni ortala */
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

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            transition: border 0.3s ease;
            background-color: #f9f9f9;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #007BFF; /* Odaklanma efekti */
            outline: none;
        }

        /* Buton stili */
        button, #btnLogin {
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

        button:hover, #btnLogin:hover {
            background-color: #0056b3; /* Hover efekti */
        }
    </style>
</head>
<body>
    <form id="LoginForm" runat="server">
        <div>
            <asp:Label ID="lblError" runat="server" CssClass="error-message" Visible="false"></asp:Label> <!-- Hata mesajı burada -->
        </div>
        <div>
            <label for="Username">Kullanıcı Adı:</label>
            <asp:TextBox ID="txtLoginUsername" runat="server" placeholder="Kullanıcı Adınızı Girin"></asp:TextBox>
        </div>
        <div>
            <label for="Password">Şifre:</label>
            <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" placeholder="Şifrenizi Girin"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnLogin" runat="server" Text="Giriş Yap" OnClick="btnLogin_Click" />
        </div>
        <div>
    <a id="SignUpLink" href="SignUp.aspx">Kayıt Ol</a> <!-- Giriş Yap butonu -->
</div>
                <div>
    <a id="sifreunut" href="SifreUnut.aspx">ŞİFREMİ UNUTTUM</a> <!-- Giriş Yap butonu -->
</div>
    </form>
</body>
</html>

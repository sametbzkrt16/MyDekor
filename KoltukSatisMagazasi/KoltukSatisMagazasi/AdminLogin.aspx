<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="KoltukSatisMagazasi.AdminLogin" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yönetici Girişi</title>
</head>
<body>
    <form id="form1" runat="server">
        <style>
            body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

form {
    background: white;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    width: 300px; /* İsteğe göre genişliği ayarlayabilirsiniz */
}

label {
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 3px;
}

button {
    background-color: #5cb85c;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    width: 100%;
}

button:hover {
    background-color: #4cae4c; /* Hover durumu için renk değişimi */
}

#error {
    color: red;
    font-size: 14px;
    margin-top: 10px;
}

        </style>
        <div>
            <label>Kullanıcı Adı:</label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox><br />
            <label>Şifre:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
            <asp:Button ID="btnLogin" runat="server" Text="Giriş" OnClick="btnLogin_Click" />
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label> <!-- Hata mesajı için label -->
        </div>
    </form>
</body>
</html>
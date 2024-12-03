<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SifreSifirla.aspx.cs" Inherits="KoltukSatisMagazasi.SifreSifirla" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yeni Şifre Oluştur</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Yeni Şifre Oluşturun</h2>
            <label for="txtNewPassword">Yeni Şifre:</label>
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
            <asp:Button ID="btnChangePassword" runat="server" Text="Şifreyi Değiştir" OnClick="btnChangePassword_Click" />
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SifreUnut.aspx.cs" Inherits="KoltukSatisMagazasi.SifreUnut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Şifre Sıfırlama</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Şifrenizi Sıfırlayın</h2>
            <label for="txtEmail">E-posta Adresi:</label>
            <asp:TextBox ID="txtEmail" runat="server" />
            <asp:Button ID="btnSifirla" runat="server" Text="Şifreyi Sıfırla" OnClick="btnSifirla_Click" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
        </div>
    </form>
</body>
</html>

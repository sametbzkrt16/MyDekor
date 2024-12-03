<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OdemeSayfasi.aspx.cs" Inherits="KoltukSatisMagazasi.OdemeSayfasi" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ödeme Sayfası</title>
    <style>
        /* Sayfa genel stili */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f5f5f5;
            font-family: 'Arial', sans-serif;
        }

        /* Form kutusunun stili */
        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: left;
        }

        h2 {
            text-align: center;
            color: #007BFF;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            background-color: #f9f9f9;
            transition: border 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #007BFF;
            outline: none;
        }

        /* Buton stili */
        button {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #218838;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Ödeme Bilgileri</h2>
        
        <label for="name">Adınız:</label>
        <input type="text" id="name" required /><br />

        <label for="address">Adresiniz:</label>
        <input type="text" id="address" required /><br />

        <label for="card">Kredi Kartı Numarası:</label>
        <input type="text" id="card" required /><br />
        
        <label for="expiry">Son Kullanma Tarihi:</label>
        <input type="text" id="expiry" required /><br />
        
        <label for="cvv">CVV:</label>
        <input type="text" id="cvv" required /><br />
        
        <button type="submit">Ödemeyi Tamamla</button>
    </form>
</body>
</html>

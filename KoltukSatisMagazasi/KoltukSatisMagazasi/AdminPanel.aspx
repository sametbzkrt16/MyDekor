<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="KoltukSatisMagazasi.AdminPanel" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yönetim Paneli</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Ürün Yönetimi</h2>
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="UrunID" HeaderText="Ürün ID" />
        <asp:BoundField DataField="UrunAdi" HeaderText="Ürün Adı" />
        <asp:BoundField DataField="UrunFiyati" HeaderText="Fiyat" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnDelete" runat="server" Text="Sil" CommandName="Delete" CommandArgument='<%# Eval("UrunID") %>' />
                <asp:Button ID="btnEdit" runat="server" Text="Düzenle" CommandName="Edit" CommandArgument='<%# Eval("UrunID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


            <h3>Ürün Ekle</h3>
            <asp:DropDownList ID="ddlCategories" runat="server"></asp:DropDownList>
            <asp:TextBox ID="txtProductName" runat="server" placeholder="Ürün Adı"></asp:TextBox>
            <asp:TextBox ID="txtPrice" runat="server" placeholder="Fiyat"></asp:TextBox>
            <asp:TextBox ID="txtProductDescription" runat="server" placeholder="Açıklama"></asp:TextBox>
            <asp:FileUpload ID="fileProductImage" runat="server" />
            <asp:Button ID="btnAdd" runat="server" Text="Ekle" OnClick="btnAdd_Click" />
        </div>
    </form>
</body>
</html>

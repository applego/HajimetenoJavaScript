<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ページ間におけるデータ受け渡し.aspx.cs" Inherits="WebApplication_初めてのJavaScript._10_行でズバリ___ページ間におけるデータ受け渡し__C__" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" PlaceHolder="Label1"></asp:Label>
            <asp:Label ID="Label2" runat="server" PlaceHolder="Label2"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="Button1" OnClick="Button1_Click"/>
            <asp:Button ID="Button2" runat="server" Text="Button2" OnClick="Button2_Click" />
            <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
        </div>
    </form>
</body>
</html>

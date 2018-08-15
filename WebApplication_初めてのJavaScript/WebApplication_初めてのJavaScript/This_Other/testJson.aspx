<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testJson.aspx.cs" Inherits="WebApplication_初めてのJavaScript.testJson" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:CheckBox ID="CheckBox1" runat="server" />
            <asp:CheckBox ID="CheckBox2" runat="server" />
            <asp:TextBox ID="TextBoxURL" runat="server" PlaceHolder="URL"></asp:TextBox>
            <asp:TextBox ID="TextBoxSearchWord" runat="server" PlaceHolder="検索単語"></asp:TextBox>
            <asp:Button ID="ButtonDo" runat="server" Text="実行" OnClick="ButtonDo_Click" />
            <asp:TextBox ID="TextBoxResult" runat="server" OnTextChanged="TextBoxResult_TextChanged"></asp:TextBox> 
        </div>
    </form>
</body>
</html>

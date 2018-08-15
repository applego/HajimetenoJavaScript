<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DynamicJsonを利用したJSONのパース.aspx.cs" Inherits="WebApplication_初めてのJavaScript.DynamicJsonを利用したJSONのパース" Theme="Light" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="Scripts/isJson.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="テキスト削除" SkinID="sky" OnClientClick="Button1_client_click();" />
            <asp:Button ID="Button2" runat="server" Text="ParseJson" OnClientClick="Button2_client_click();" OnClick="Button2_Click" />
            <asp:TextBox ID="TextBox1" runat="server" Width="900px" Height="200px" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="テーマを変える" OnClick="Button3_Click" PostBackUrl="~/DynamicJsonを利用したJSONのパース.aspx" />
        </div>
        <asp:HiddenField ID="HiddenField1" runat="server" Value="true" />
    </form>
    <script type="text/javascript">
        debugger
        function Button1_client_click() {
            var ret = confirm("テキストを削除してよろしいですか？");
            if (!ret) {
                document.getElementById('HiddenField1').value = 'false';
                return;
            } else {
                document.getElementById('TextBox1').value = "";
            }
        }

        function Button2_client_click() {
            var txtbox1 = document.getElementById('TextBox1').value;
            if (!isJSON(txtbox1)) {
                document.getElementById('HiddenField1').value = 'false';
                alert('テキストがJSON形式ではありません。');
                return;
            } else {

            }
        }

        
    </script>
</body>
</html>

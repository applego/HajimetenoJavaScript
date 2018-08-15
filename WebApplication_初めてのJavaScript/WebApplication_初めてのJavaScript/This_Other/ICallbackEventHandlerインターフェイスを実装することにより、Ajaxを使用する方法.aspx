<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ICallbackEventHandlerインターフェイスを実装することにより、Ajaxを使用する方法.aspx.cs" Inherits="WebApplication_初めてのJavaScript.ICallbackEventHandlerインターフェイスを実装することにより_Ajaxを使用する方法" %>
<%@ IMplements Interface="System.Web.UI.ICallbackEventHandler" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    protected void Page_Load(object sender,EventArgs e)
    {
        //callbackServe関数を作成する
        string callbackReference = Page.ClientScript.GetCallbackEventReference(this, "arg", "receiveServerData", "", "callbackError", true);
        string callbackScript = "function callbackServer(arg,context){" + callbackReference + ";}";
        //callbackServer関数のJavaScriptブロックをページに追加する
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "callbackServer", callbackScript, true);
    }
    #region ICallbackEventHandlerメンバ

    string callbackResult;

    //クライアントから呼び出されるメソッド
    void ICallbackEventHandler.RaiseCallbackEvent(string eventArgument)
    {
        int fee = this.GetYoupackFee(int.Parse(eventArgument));
        this.callbackResult = fee.ToString();
    }

    //結果を返す
    string ICallbackEventHandler.GetCallbackResult()
    {
        return this.callbackResult;
    }
    public int GetYoupackFee(int packSize)
    {
        if (packSize <= 60)
            return 600;
        else if (packSize <= 80)
            return 800;
        else if (packSize <= 100)
            return 1000;
        else if (packSize <= 120)
            return 1200;
        else if (packSize <= 140)
            return 1400;
        else if (packSize <= 160)
            return 1600;
        else if (packSize <= 170)
            return 1700;
        else
            return -1;
    }

    #endregion
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ゆうパック送料検索</title>
    <script type="text/javascript" src="Scripts/callback.js?1127"></script>
</head>
<body>
    <h1>ゆうパック送料検索</h1>
    <p>同一都道府県への配達、重量30㎏まで</p>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="荷物の大きさ（縦・横・高さの合計）：" AssociatedControlID="PackageSizeList"></asp:Label>
            <asp:DropDownList ID="PackageSizeList" runat="server">
                <asp:ListItem Value="0">（選択してください）</asp:ListItem>
                <asp:ListItem Value="60">60cmまで</asp:ListItem>
                <asp:ListItem Value="80">80cmまで</asp:ListItem>
                <asp:ListItem Value="100">100cmまで</asp:ListItem>
                <asp:ListItem Value="120">120cmまで</asp:ListItem>
                <asp:ListItem Value="140">140cmまで</asp:ListItem>
                <asp:ListItem Value="160">160cmまで</asp:ListItem>
                <asp:ListItem Value="170">170cmまで</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="ResultLabel" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>

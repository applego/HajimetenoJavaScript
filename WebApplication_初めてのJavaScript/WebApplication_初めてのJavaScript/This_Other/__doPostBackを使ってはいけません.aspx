<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="__doPostBackを使ってはいけません.aspx.cs" Inherits="WebApplication_初めてのJavaScript.This_Other.__doPostBackを使ってはいけません" %>

<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC>

<%--参考サイトURL（http://surferonwww.info/BlogEngine/post/2012/4/21/How-to-use-GetPostBackEventReference-and-RaisePostBackEvent-methods.aspx）--%>
<%--ASP.NET には、クライアントのイベントでサーバーにデータをポストバックするための、クライアントスクリプトを自動生成する機能があります。

それが表題の __doPostBack という名前の JavaScript の関数です。

例えば、GridView で、AutoGenerateSelectButton プロパティを true に設定すると［選択］ボタンが表示されますが、そのハイパーリンクに __doPostBack 関数が以下のように自動的に設定されます（ASP.NET 4 では ' はエスケープされて &#39; になります）。

1.
<td>
2.
<a href="javascript:__doPostBack('GridView1','Select$0')">
3.
選択
4.
</a>
5.
</td>
引数は、前者がデータを受け取って処置をするサーバーコントロールの UniqueID（上の例では GridView1）、後者がイベントデータ（上の例では Select$0 ⇒ 行インデックス 0 が Select されたという意味）になります。

__doPostBack 関数は、この 2 つの引数をそれぞれ __EVENTTARGET と __EVENTARGUMENT という id を持つ隠しフィールドに格納してから form を submit します。

この __doPostBack 関数や隠しフィールドは公開されてないので、将来なにもアナウンスされず変更される可能性があります。なので、プログラマがこの関数や隠しフィールドを使ってコーディングするのは避けた方がよさそうです。

代わりに、GetPostBackEventReference メソッド と RaisePostBackEvent メソッド を使うのがお勧めです。
--%>

<script runat="server">

    // GridView で[選択]ボタンを使わないでポストバックをかけてSelectIndexChanged イベントで選択された行を取得。
    // ASP.NET AJAX の　UpdatePanel を使っているのはオマケ。

    // 選択された行をチェックして SelectIndexChanged イベントを発生させるため RaisePostBackEvent メソッドを overrideする。
    // そのため GridView を継承したカスタムコントロールを作る。
    public class MyGridView : GridView
    {
        //GetPostBackEventReference メソッドで設定したクライアントスクリプト（この例では、下のmyGridView RowCreated イベントハンドラで設定している）
        //が起動されると、ポストバックがかかり、サーバー側で RaisePostBackEvent メソッドが起動される。
        //引数 arg には、クライアントスクリプトで設定した GridView の行インデックスが渡される。
        protected override void RaisePostBackEvent(string eventArgument)
        {
            int index;
            bool result = Int32.TryParse(eventArgument, out index);

            if (result)
            {
                if (this.SelectedIndex != index)
                {
                    this.SelectedIndex = index;
                    this.OnSelectedIndexChanged(EventArgs.Empty);
                }
            }

            base.RaisePostBackEvent(eventArgument);
        }
    }

    //データソース用の DataTable を作成
    protected DataTable CreateDataTable()
    {
        DataTable dt = new DataTable();
        DataRow dr;

        dt.Columns.Add(new DataColumn("ID", typeof(Int32)));
        dt.Columns.Add(new DataColumn("Name", typeof(string)));
        dt.Columns.Add(new DataColumn("Price", typeof(Int32)));
        dt.Columns.Add(new DataColumn("Qty", typeof(Int32)));
        dt.Columns.Add(new DataColumn("Amount", typeof(Int32)));
        dt.Columns.Add(new DataColumn("Remarks", typeof(string)));

        for (int i = 0; i < 5; i++)
        {
            dr = dt.NewRow();
            dr["ID"] = i;
            dr["Name"] = "Item" + i.ToString();
            dr["Price"] = 123000 * (i + 1);
            dr["Qty"] = i + 1;
            dr["Amount"] = 123000 * (i + 1) * (i + 1);
            dr["Remarks"] = "Remarks " + i.ToString();
            dt.Rows.Add(dr);
        }
        return dt;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        MyGridView myGridView = new MyGridView();
        myGridView.ID = "myGridView1";
        myGridView.RowCreated += 
            new GridViewRowEventHandler(myGridView_RowCreated);
        myGridView.SelectedIndexChanged += 
            new EventHandler(myGridView_SelectedIndexChanged);
        TableItemStyle tableStyle = myGridView.SelectedRowStyle;
        tableStyle.BackColor = System.Drawing.Color.GreenYellow;
        tableStyle.ForeColor = System.Drawing.Color.White;

        PlaceHolder1.Controls.Add(myGridView);

        if (!IsPostBack)
        {
            myGridView.DataSource = CreateDataTable();
            myGridView.DataBind();
        }

    }

    protected void myGridView_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //　__doPostBack("<UniqueID>", "<RowIndex>")という
            // クライアントスクリプトの文字列が生成される。
            string script = Page.ClientScript.GetPostBackEventReference(
                (GridView)sender,
                e.Row.RowIndex.ToString());

            //データ行の tr 要素の onclick 属性に、上で生成したスクリプトを設定する。
            e.Row.Attributes["onclick"] = script;

            //カーソルを指型にする
            e.Row.Style["cursor"] = "pointer";
        }
    }

    protected void myGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = "SelectedIndex :" +
            ((GridView)sender).SelectedIndex.ToString();
    }



</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

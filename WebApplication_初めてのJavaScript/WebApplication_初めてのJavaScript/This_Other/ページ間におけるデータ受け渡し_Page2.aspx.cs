using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_初めてのJavaScript
{
    public partial class _10_行でズバリ___ページ間におけるデータ受け渡し__C___Page2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Request.QueryString["state"]; //クエリ文字列を参照
            Label2.Text = Request.Cookies["Data1"].Value; //クッキーを参照
            Label3.Text = (string)Session["Data2"];    //セッション情報を参照
        }
    }
}
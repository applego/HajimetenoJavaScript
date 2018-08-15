using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_初めてのJavaScript
{
    public partial class _10_行でズバリ___ページ間におけるデータ受け渡し__C__ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Cookies.Add(new HttpCookie("Data1", "Hello!")); //クッキー設定
                Session["Data2"] = "こんにちは！"; //セッション情報設定
            }
            Label1.Text = Response.Cookies["Data1"].Value;
            Label2.Text = (string)Session["Data2"];
        }

        protected void Button1_Click(object sender,EventArgs e)
        {
            Response.Cookies["Data1"].Value = TextBox1.Text;
            Response.Redirect("~/ページ間におけるデータ受け渡し_Page2.aspx?state=1");
        }

        protected void Button2_Click(object sender,EventArgs e)
        {
            Session["Data2"] = TextBox1.Text;
            Response.Redirect("~/ページ間におけるデータ受け渡し_Page2.aspx?state=2");
        }
    }
}
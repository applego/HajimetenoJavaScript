using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Codeplex.Data;


namespace WebApplication_初めてのJavaScript
{
    public partial class DynamicJsonを利用したJSONのパース : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string json = TextBox1.Text;
            if(HiddenField1.Value == "true")
            {
                dynamic obj = DynamicJson.Parse(json);

                TextBox1.Text += "-----\r\n\r\n";
                TextBox1.Text += "Item-Name : " + obj.Item.Name + "\r\n";
                TextBox1.Text += "Item-Price : " + obj.Item.Price + "\r\n";
                TextBox1.Text += "Item-Alias : ";
                foreach (var elem in obj.Item.Alias)
                {
                    TextBox1.Text += elem + ", ";
                }
                TextBox1.Text += "\r\n";

                TextBox1.Text += "Item-AddInfo-Region : " + obj.Item.AddInfo.Region + "\r\n";
                TextBox1.Text += "Item-AddInfo-Lang : " + obj.Item.AddInfo.Lang + "\r\n";
            }
            else
            {
                return;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            var pageTheme = Page.Theme;
            switch (pageTheme)
            {
                case "Dark":
                    Page.Theme = "Light";
                    break;
                case "Light":
                    Page.Theme = "Dark";
                    break;
                default:
                    Page.Theme = "";
                    break;
            }
        }
    }
}
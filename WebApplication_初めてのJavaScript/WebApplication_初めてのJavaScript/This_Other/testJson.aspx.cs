using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_初めてのJavaScript
{
    public partial class testJson : System.Web.UI.Page
    {
        private string txturl;
        public string TxtUrl { get { return txturl; } }
        private string txtsearchword;
        public string TxtSearchWord { get { return txtsearchword; } }
        private string txtresult;
        public string TxtResult { get { return txtresult; } }
        testJson()
        {
            txturl = TextBoxURL.Text;
            //htmlのidやらで要素を特定できるように？
            txtsearchword = TextBoxSearchWord.Text;
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonDo_Click(object sender, EventArgs e)
        {
            string txtUrl = TextBoxURL.Text;
            

        }

        protected void TextBoxResult_TextChanged(object sender, EventArgs e)
        {

        }

        
        
    }
}
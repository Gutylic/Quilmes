using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace WebApplication1
{
    public partial class metodo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetDataAjax(string nombre, string apellido)
        {
            return string.Format("Bienvenido al mundo AJAX {0} {1}", nombre, apellido);
        }
    }
}
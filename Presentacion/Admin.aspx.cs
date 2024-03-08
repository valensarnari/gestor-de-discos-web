using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Seguridad.EsAdmin(Session["user"])))
            {
                Session.Add("error", "No tenes permisos para acceder a esta página.");
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}
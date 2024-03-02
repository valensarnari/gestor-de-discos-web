using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace Presentacion
{
    public partial class Listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DiscoNegocio negocio = new DiscoNegocio();
            dgvDiscos.DataSource = negocio.ListarConSP();
            dgvDiscos.DataBind();
        }

        protected void dgvDiscos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvDiscos.SelectedDataKey.Value.ToString();
            Response.Redirect("Alta.aspx?id=" + id);
        }
    }
}
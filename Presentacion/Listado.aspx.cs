using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace Presentacion
{
    public partial class Listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // cargo listado cada ve que actualiza
            DiscoNegocio negocio = new DiscoNegocio();

            Session.Add("listaDiscos", negocio.ListarConSP());
            dgvDiscos.DataSource = Session["listaDiscos"];
            dgvDiscos.DataBind();

            // cargo criterio solo por primera vez
            if (!IsPostBack)
            {
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
                ddlCriterio.Items.Add("Contiene");
            }
            
        }

        protected void dgvDiscos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvDiscos.SelectedDataKey.Value.ToString();
            Response.Redirect("Alta.aspx?id=" + id);
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Disco> listaDiscos = (List<Disco>)Session["listaDiscos"];
            List<Disco> listaDiscosFiltrada = listaDiscos.FindAll(x => x.Titulo.ToUpper().Contains(txtFiltro.Text.ToUpper()));

            dgvDiscos.DataSource = listaDiscosFiltrada;
            dgvDiscos.DataBind();
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            
            if (ddlCampo.SelectedItem.ToString() == "Título")
            {
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
                ddlCriterio.Items.Add("Contiene");
            }
            else
            {
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
                ddlCriterio.Items.Add("Igual a");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                DiscoNegocio discoNegocio = new DiscoNegocio();

                dgvDiscos.DataSource = discoNegocio.Filtrar(
                    ddlCampo.SelectedValue.ToString(),
                    ddlCriterio.SelectedValue.ToString(),
                    txtFiltroAvanzado.Text
                    );
                dgvDiscos.DataBind();

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }
    }
}
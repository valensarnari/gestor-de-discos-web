using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Alta : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ConfirmaEliminacion = false;
            txtId.Enabled = false;

            try
            {
                if (!IsPostBack)
                {
                    EstiloNegocio estiloNegocio = new EstiloNegocio();
                    TipoNegocio tipoNegocio = new TipoNegocio();

                    ddlEstilo.DataSource = estiloNegocio.listar();
                    ddlEstilo.DataValueField = "Id";
                    ddlEstilo.DataTextField = "Descripcion";
                    ddlEstilo.DataBind();
                    ddlTipoEdicion.DataSource = tipoNegocio.listar();
                    ddlTipoEdicion.DataValueField = "Id";
                    ddlTipoEdicion.DataTextField = "Descripcion";
                    ddlTipoEdicion.DataBind();
                }

                if (Request.QueryString["id"] != null && !IsPostBack)
                {
                    btnAgregar.Visible = false;
                    btnModificar.Visible = true;
                    btnEliminar.Visible = true;

                    DiscoNegocio discoNegocio = new DiscoNegocio();
                    Disco disco = discoNegocio.FiltrarPorID(Request.QueryString["id"]);

                    txtId.Text = Request.QueryString["id"];
                    txtTitulo.Text = disco.Titulo;
                    txtFecha.Text = String.Format("{0:yyyy-MM-dd}", disco.FechaLanzamiento);
                    txtCantidad.Text = disco.CantidadCanciones.ToString();
                    txtUrlImagen.Text = disco.UrlImagen;
                    ddlEstilo.SelectedValue = disco.Estilo.Id.ToString();
                    ddlTipoEdicion.SelectedValue = disco.TipoEdicion.ToString();
                    imgDisco.ImageUrl = txtUrlImagen.Text;

                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
                // redireccion a pantalla de error
            }
        }

        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            imgDisco.ImageUrl = txtUrlImagen.Text;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                DiscoNegocio discoNegocio = new DiscoNegocio();
                Disco disco = new Disco();

                disco.Titulo = txtTitulo.Text;
                disco.FechaLanzamiento = DateTime.Parse(txtFecha.Text);
                disco.CantidadCanciones = int.Parse(txtCantidad.Text);
                disco.UrlImagen = txtUrlImagen.Text;
                disco.Estilo = new Estilo();
                disco.Estilo.Id = int.Parse(ddlEstilo.SelectedValue);
                disco.TipoEdicion = new TipoEdicion();
                disco.TipoEdicion.Id = int.Parse(ddlTipoEdicion.SelectedValue);

                discoNegocio.AgregarConSP(disco);

                Response.Redirect("Listado.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                DiscoNegocio discoNegocio = new DiscoNegocio();
                Disco disco = new Disco();

                disco.Id = int.Parse(txtId.Text);
                disco.Titulo = txtTitulo.Text;
                disco.FechaLanzamiento = DateTime.Parse(txtFecha.Text);
                disco.CantidadCanciones = int.Parse(txtCantidad.Text);
                disco.UrlImagen = txtUrlImagen.Text;
                disco.Estilo = new Estilo();
                disco.Estilo.Id = int.Parse(ddlEstilo.SelectedValue);
                disco.TipoEdicion = new TipoEdicion();
                disco.TipoEdicion.Id = int.Parse(ddlTipoEdicion.SelectedValue);

                discoNegocio.ModificarConSP(disco);

                Response.Redirect("Listado.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }

        protected void btnConfirmaEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfirmaEliminar.Checked)
                {
                    DiscoNegocio discoNegocio = new DiscoNegocio();
                    discoNegocio.Eliminar(int.Parse(txtId.Text));
                    Response.Redirect("Listado.aspx");
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }
    }
}
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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            try
            {
                usuario = new Usuario(txtUsuario.Text, txtContrasena.Text);

                if (usuarioNegocio.Loguear(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("Listado.aspx", false);
                }
                else
                {
                    Session.Add("error", "Usuario o Contraseña incorrecta");
                    Response.Redirect("Error.aspx");
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_administrador_AgregarUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        if (!Page.IsPostBack)
        {
            conexionSQL.getTipoEmpleado(ref ddlTipoUsu);
            conexionSQL.desconectar();
        }
    }
    protected void guardarUsuario_Click(object sender, EventArgs e)
    {
        try
        {
            String nombre = txtNombUsu.Text;
            String apellido = txtApelUsu.Text;
            String correo = txtCorreUsu.Text;
            int tipo = int.Parse(ddlTipoUsu.SelectedValue);
            if (nombre != "")
            {
                if (apellido != "")
                {
                    if (correo != "")
                    {
                        if (tipo > 0)
                        {
                            conexion conexionSQL = new conexion();
                            conexionSQL.conectar();
                            generadorContra c = new generadorContra();
                            String contra = c.generarContra();
                            encriptacion enc = new encriptacion();
                            String contraEnc = enc.encriptarContra(contra);
                            int resp = conexionSQL.agregarUsuario(nombre, apellido, correo, contraEnc, tipo);
                            conexionSQL.desconectar();
                            if (resp > 0)
                            {
                                correo enviarCo = new correo(correo, "Credeciales de Usuario", "Estimado/a: " + nombre + ". Su password es: " + contra);
                                if (enviarCo.Estado)
                                {
                                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "modificarCarrera();", true);
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "modificarCarrera();", true);
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
        }
    }
}
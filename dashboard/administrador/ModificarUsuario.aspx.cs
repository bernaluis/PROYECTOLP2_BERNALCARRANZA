using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_administrador_ModificarUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        if (!Page.IsPostBack)
        {

            if (Request.QueryString["id"] != null)
            {
                int codi = int.Parse(Request.QueryString["id"]);
                conexionSQL.getTipoEmpleado(ref ddlTipoUsu);
                conexionSQL.readUsuario(codi, ref txtNombUsu, ref txtApelUsu, ref ddlTipoUsu);
                conexionSQL.desconectar();
            }
            else
            {
                Response.Redirect("Usuarios.aspx");
            }
        }
    }
    protected void modificarUsuario_Click(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["id"]);
        String nomb = txtNombUsu.Text;
        String apel = txtApelUsu.Text;
        int combo = ddlTipoUsu.SelectedIndex+1;
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        try
        {
            if (nomb != null)
            {
                if (apel != null)
                {
                    int resp = conexionSQL.modificarUsuario(id, nomb, apel, combo);
                    if (resp == 1)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "modificarUsuario();", true);
                        conexionSQL.desconectar();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                        conexionSQL.getTipoEmpleado(ref ddlTipoUsu);
                        conexionSQL.readUsuario(id, ref txtNombUsu, ref txtApelUsu, ref ddlTipoUsu);
                        conexionSQL.desconectar();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
        }
    }
}
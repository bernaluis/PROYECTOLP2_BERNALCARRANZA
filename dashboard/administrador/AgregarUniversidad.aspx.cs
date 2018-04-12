using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_administrador_AgregarUniversidad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void guardarUniversidad_Click(object sender, EventArgs e)
    {
        try
        {
            String nombre = txtNombUni.Text;
            if (nombre != "")
            {
                conexion conexionSQL = new conexion();
                conexionSQL.conectar();
                int resp = conexionSQL.agregarUniversidad(nombre);
                conexionSQL.desconectar();
                if (resp > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "modificarCarrera();", true);
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
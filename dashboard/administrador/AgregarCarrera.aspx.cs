using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_administrador_EditarCarrera : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void guardarCarrera_Click(object sender, EventArgs e)
    {
        
        String nombre = txtNombCarr.Text;
        if (nombre != "")
        {
            conexion conexionSQL = new conexion();
            conexionSQL.conectar();
            try
            {
                int resp = conexionSQL.agregarCarrera(nombre);
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
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                Response.Redirect("Carrera.aspx");
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
        }
    }
}
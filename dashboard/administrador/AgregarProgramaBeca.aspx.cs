using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_administrador_AgregarProgramaBeca : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void guardarProgramaBeca_Click(object sender, EventArgs e)
    {
        String codi = txtCodiProg.Text;
        String nomb = txtNombProg.Text;
        String descr = txtDescProg.Text;
        if (codi != "")
        {
            if (nomb != "")
            {
                if (descr != "")
                {
                    conexion conexionSQL = new conexion();
                    conexionSQL.conectar();
                    try
                    {
                        int resp = conexionSQL.agregarProgramaBeca(codi, nomb, descr);
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
}
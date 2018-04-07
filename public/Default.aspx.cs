using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["codigo"]!=null){
            Response.Redirect("MenuEstudiante.aspx");
        }else{

        }
            
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        String correo = txtCorreo.Text;
        String contra = txtContra.Text;
        String resp = conexionSQL.LoginEstudiante(correo, contra);
        conexionSQL.desconectar();
        if (resp == "Nada")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "Incorrecto();", true);
            txtContra.Text = null;
            txtCorreo.Text = null;
        }
        else
        {
            Session["codigo"] = resp;
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "Correcto();", true);
        }
    }
}
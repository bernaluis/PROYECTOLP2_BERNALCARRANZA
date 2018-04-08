using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Response.Write(Session["tipoUsuario"]);
            Response.Write(Session["codigoUsuario"]);
            if (Session["tipoUsuario"] != null)
            {
                switch (Session["tipoUsuario"].ToString())
                {
                    case "1":
                        Response.Redirect("administrador/MenuAdmin.aspx");
                        break;
                    case "2":
                        Response.Redirect("gestor/MenuGestorEducativo.aspx");
                        break;
                    case "3":
                        Response.Redirect("contador/MenuContador.aspx");
                        break;
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        String correo = txtCorreo.Text;
        String contra = txtContra.Text;
        encriptacion enc = new encriptacion();
        String contraEnc = enc.encriptarContra(contra);
        int resp = conexionSQL.LoginUsuarios(correo, contraEnc);
        conexionSQL.desconectar();
        if (resp != 0)
        {
            switch (resp)
            {
                case 1:
                    Session["codigoUsuario"] = conexionSQL.idUsuario;
                    Session["tipoUsuario"] = resp;
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "CorrectoAdmin();", true);
                    break;
                case 2:
                    Session["codigoUsuario"] = conexionSQL.idUsuario;
                    Session["tipoUsuario"] = resp;
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "CorrectoGestor();", true);
                    break;
                case 3:
                    Session["codigoUsuario"] = conexionSQL.idUsuario;
                    Session["tipoUsuario"] = resp;
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "CorrectoContador();", true);
                    break;
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "Incorrecto();", true);
            txtContra.Text = null;
            txtCorreo.Text = null;
        }
    }
}
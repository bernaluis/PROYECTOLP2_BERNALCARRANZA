using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_gestor_EditarIncidente : System.Web.UI.Page
{
    int codi = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        if (!Page.IsPostBack)
        {

            if (Request.QueryString["id"] != null)
            {
                codi = int.Parse(Request.QueryString["id"]);
                conexionSQL.getDatosComboB(ref ddlAlumno, "select * from becario where estado=1");
                conexionSQL.getDatosComboB(ref ddlEncargado, "select * from usuario where id_tipo=2");
                conexionSQL.readIncidente(codi,ref this.txtDetalle,ref this.ddlEncargado,ref this.ddlAlumno);
                conexionSQL.desconectar();

            }
            else
            {
                Response.Redirect("PresupuestoBecario.aspx");
            }
        }
    }
    protected void modificarIncidente_Click(object sender, EventArgs e)
    {
        if (txtDetalle.Text != "")
        {
            if (ddlAlumno.SelectedIndex > 0)
            {
                conexion conexionSQL = new conexion();
                conexionSQL.conectar();
                DateTime yourDateTime = DateTime.Now; //February 16th 2013 at 4:51PM
                string formattedDateTime = yourDateTime.ToString("yyyy-MM-dd"); //"2013-02-16"
                int resp = conexionSQL.modificarIncidente(this.codi,txtDetalle.Text,int.Parse(ddlAlumno.SelectedValue),int.Parse(ddlEncargado.SelectedValue),formattedDateTime);
                if (resp > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "modificarCarrera();", true);
                }
                else {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                }
            }
            else {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
            }
        }
        else {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
        }
    }
    }

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_contador_AgregarAspectoBecario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["codi"] != null)
            {
                String codi = Request.QueryString["codi"];
                conexionSQL.getAspectosAll(ref ddlAspectos);
                int resp = conexionSQL.verificarExistenciaBecario(codi);
                conexionSQL.desconectar();
                if (resp<= 0)
                {
                    Response.Redirect("PresupuestoBecario.aspx");
                }
            }
            else
            {
                Response.Redirect("PresupuestoBecario.aspx");
            }
        }
    }
    protected void guardarMontoAspecto_Click(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        try
        {
            String codi = Request.QueryString["codi"];
            int aspe = int.Parse(ddlAspectos.SelectedValue);
            double mont = double.Parse(txtMonto.Text);
            int res = conexionSQL.verificarAspectoPresupuestoBecario(codi, aspe);
            conexionSQL.desconectar();
            if(res == 0)
            {
                conexion conexionSQL2 = new conexion();
                conexionSQL2.conectar();
                int resp = conexionSQL2.agregarAspectoPresupuestoBecario(codi, aspe, mont);
                conexionSQL2.desconectar();
                if (resp > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "agregarMonto();", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                txtMonto.Text = null;
            }
        }
        catch (Exception ex)
        {
        }
    }
}
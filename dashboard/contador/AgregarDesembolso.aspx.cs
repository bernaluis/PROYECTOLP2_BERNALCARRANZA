using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_contador_AgregarDesembolso : System.Web.UI.Page
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
                conexionSQL.getAspectosBecario(ref ddlAspectos, codi);
                int resp = conexionSQL.verificarExistenciaBecario(codi);
                conexionSQL.desconectar();
                if (resp <= 0)
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
    protected void guardarDesembolso_Click(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        try
        {
            int aspe = int.Parse(ddlAspectos.SelectedValue);
            double mont = double.Parse(txtMonto.Text);
            int resp1 = conexionSQL.verificarExistenciaMonto(aspe);
            conexionSQL.desconectar();
            if (resp1> 0)
            {
                conexion conexionSQL2 = new conexion();
                conexionSQL2.conectar();
                int res = conexionSQL2.verificarMontoIngresado(aspe, mont);
                conexionSQL2.desconectar();
                if (res == 1)
                {
                    conexion conexionSQL4 = new conexion();
                    conexionSQL4.conectar();
                    int res4 = conexionSQL4.agregarDesembolso(aspe, mont);
                    conexionSQL4.desconectar();
                    if (res4 > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "agregarDesembolso();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                    }
                }
            }
            else
            {
                conexion conexionSQL3 = new conexion();
                conexionSQL3.conectar();
                int res2 =conexionSQL3.verificarMontoIngresadoNUll(aspe, mont);
                conexionSQL3.desconectar();
                if (res2 == 1)
                {
                    conexion conexionSQL5 = new conexion();
                    conexionSQL5.conectar();
                    int res5 = conexionSQL5.agregarDesembolso(aspe, mont);
                    conexionSQL5.desconectar();
                    if (res5 > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "agregarDesembolso();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            txtMonto.Text = ex.Source.ToString();
        }
    }
}
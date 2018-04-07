using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarMateria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["codigo"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            conexion conexionSQL = new conexion();
            conexionSQL.conectar();
            if (!Page.IsPostBack)
            {
                conexionSQL.getCiclosAll(ref ddlCiclo);
            }
            conexionSQL.desconectar();
        }
    }
    protected void guardarMateria_Click(object sender, EventArgs e)
    {
        int resultado = 0;
        String nombreM = txtNombMate.Text;
        double notaM = double.Parse(txtNotaMate.Text);
        int estadoT = int.Parse(ddlEstaTerc.SelectedValue);
        int idCiclo = int.Parse(ddlCiclo.SelectedValue);
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        resultado = conexionSQL.agregarMateria(Session["codigo"],nombreM,notaM,estadoT,idCiclo);
        conexionSQL.desconectar();
        if (resultado == 1)
        {
            Response.Redirect("AcademiaBecario.aspx");
        }
    }
}
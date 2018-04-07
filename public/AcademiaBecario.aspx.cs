using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AcademiaBecario : System.Web.UI.Page
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
                conexionSQL.getCiclos(ref ddlCiclos,Session["codigo"]);
                conexionSQL.desconectar();
            }
        }
    }
    protected void buscarMaterias_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
}
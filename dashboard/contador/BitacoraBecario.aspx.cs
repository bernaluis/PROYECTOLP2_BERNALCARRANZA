using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_contador_BitacoraBecario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        if (!Page.IsPostBack)
        {
            conexionSQL.getProgramasAll(ref ddlProgramasBecas);
            conexionSQL.getUniversidadesAll(ref ddlUniversidad);
            conexionSQL.getCarrerasAll(ref ddlCarrera);
            int programa = int.Parse(ddlProgramasBecas.SelectedValue);
            int universidad = int.Parse(ddlUniversidad.SelectedValue);
            int carrera = int.Parse(ddlCarrera.SelectedValue);
            int estado = int.Parse(ddlEstado.SelectedValue);
            conexionSQL.getAlumnosContador(ref ddlAlumnos, programa, universidad, carrera, estado);
            conexionSQL.desconectar();
        }
    }
    protected void btnBuscarAlumnos_Click(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        int programa = int.Parse(ddlProgramasBecas.SelectedValue);
        int universidad = int.Parse(ddlUniversidad.SelectedValue);
        int carrera = int.Parse(ddlCarrera.SelectedValue);
        int estado = int.Parse(ddlEstado.SelectedValue);
        conexionSQL.getAlumnosContador(ref ddlAlumnos, programa, universidad, carrera, estado);
        conexionSQL.desconectar();
    }
    protected void btnBuscarExpediente_Click(object sender, EventArgs e)
    {
        codigo.Visible = true;
        codigo.Text = ddlAlumnos.SelectedItem.ToString();
        datosP.Visible = true;
        GridView1.Visible = true;
        GridView1.DataBind();
    }
}
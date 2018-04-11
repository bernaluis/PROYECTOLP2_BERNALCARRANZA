using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_contador_Becario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        if (!Page.IsPostBack)
        {
            try
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
            catch (Exception ex)
            {
            }
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
        lblCiclos.Visible = false;
        codigo.Visible = false;
        datosA.Visible = false;
        datosP.Visible = false;
        ddlCiclos.Visible = false;
        btnBuscarNota.Visible = false;
    }
    protected void btnBuscarExpediente_Click(object sender, EventArgs e)
    {
        codigo.Visible = true;
        codigo.Text = ddlAlumnos.SelectedItem.ToString();
        datosA.Visible = true;
        datosP.Visible = true;
        lblCiclos.Visible = true;
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        Object codigoX = ddlAlumnos.SelectedItem.ToString();
        conexionSQL.getCiclos(ref ddlCiclos, codigoX);
        conexionSQL.desconectar();
        ddlCiclos.Visible = true;
        btnBuscarNota.Visible = true;
        GridView1.Visible = true;
        GridView1.DataBind();
    }
    protected void btnBuscarNota_Click(object sender, EventArgs e)
    {
        GridView2.Visible = true;
        GridView2.DataBind();
    }
}
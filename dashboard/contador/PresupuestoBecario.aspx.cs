using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_contador_PresupuestoBecario : System.Web.UI.Page
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
        try
        {
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
    protected void btnBuscarExpediente_Click(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        try
        {
            String codi = ddlAlumnos.SelectedItem.ToString();
            int resp = conexionSQL.verificarExistenciaPresupuestoBecario(codi);
            conexionSQL.desconectar();
            if (resp > 0)
            {
                codigo.Visible = true;
                codigo.Text = codi;
                datosP.Visible = true;
                agregarAspecto.Visible = true;
                agregarDesembolso.Visible = true;
                GridView1.Visible = true;
                GridView1.DataBind();
            }
            else
            {
                conexion conexionSQL2 = new conexion();
                conexionSQL2.conectar();
                conexionSQL2.agregarPresupuestoBecario(codi);
                Response.Redirect(string.Format("AgregarAspectoBecario.aspx?codi={0}", codi));
                conexionSQL2.desconectar();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void agregarAspecto_Click(object sender, EventArgs e)
    {
        try
        {
            String codi = ddlAlumnos.SelectedItem.ToString();
            Response.Redirect(string.Format("AgregarAspectoBecario.aspx?codi={0}", codi));
        }
        catch (Exception ex)
        {
        }
    }
    protected void agregarDesembolso_Click(object sender, EventArgs e)
    {
        try
        {
            String codi = ddlAlumnos.SelectedItem.ToString();
            Response.Redirect(string.Format("AgregarDesembolso.aspx?codi={0}", codi));
        }
        catch (Exception ex)
        {
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_administrador_Usuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        if (!Page.IsPostBack)
        {
            conexionSQL.getTipoEmpleado(ref ddlTipoUsuario);
            conexionSQL.desconectar();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlDataSource1.DeleteCommand = "DELETE FROM usuario WHERE id=@codi";
        SqlDataSource1.DeleteParameters.Add("codi", GridView1.DataKeys[e.RowIndex].Values["id"].ToString());
        SqlDataSource1.Delete();
        GridView1.DataBind();
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "eliminarCarrera();", true);
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
       
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
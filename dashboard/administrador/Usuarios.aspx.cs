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
        try
        {

            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            SqlDataSource1.DeleteCommand = "DELETE FROM usuario WHERE id=@codi";
            SqlDataSource1.DeleteParameters.Add("codi", GridView1.DataKeys[e.RowIndex].Values["id"].ToString());
            SqlDataSource1.Delete();
            GridView1.DataBind();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "eliminarCarrera();", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
        }
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Value);
        Response.Redirect(string.Format("ModificarUsuario.aspx?id={0}",id));
    }
}
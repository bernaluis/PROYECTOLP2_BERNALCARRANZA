using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_gestor_BitacoraEstudiante : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
        SqlDataSource2.DeleteCommand = "DELETE FROM incidentes WHERE id =@id"; 
        SqlDataSource2.DeleteParameters.Add("id",GridView1.DataKeys[e.RowIndex].Values["id"].ToString());
        SqlDataSource2.Delete();
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Value);
        Response.Redirect(string.Format("EditarIncidente.aspx?id={0}", id));
    }
}
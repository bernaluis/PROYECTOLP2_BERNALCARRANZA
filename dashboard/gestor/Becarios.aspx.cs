using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_gestor_Becarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Value);
        Response.Redirect(string.Format("EditarBecario.aspx?id={0}", id));
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlDataSource2.UpdateCommand = "update becario set estado=2 WHERE id =@id";
        SqlDataSource2.UpdateParameters.Add("id", GridView1.DataKeys[e.RowIndex].Values["id"].ToString());
        SqlDataSource2.Update();
        GridView1.DataBind();
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "eliminar();", true);
    }
}
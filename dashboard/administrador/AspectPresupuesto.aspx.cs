using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_administrador_AspectPresupuesto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            SqlDataSource2.UpdateCommand = "UPDATE aspecto SET nombre=@nomb WHERE id=@codi";
            string nomb = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            if (nomb != null)
            {
                SqlDataSource2.UpdateParameters.Add("nomb", nomb);
                SqlDataSource2.UpdateParameters.Add("codi", GridView1.DataKeys[e.RowIndex].Values["id"].ToString());
                SqlDataSource2.Update();
                GridView1.DataBind();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "modificarCarrera();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
        }
    }
}
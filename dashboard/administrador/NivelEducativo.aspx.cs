﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_administrador_NivelEducativo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            SqlDataSource2.DeleteCommand = "UPDATE nivel_educativo SET estado=0 WHERE id=@codi";
            SqlDataSource2.DeleteParameters.Add("codi", GridView1.DataKeys[e.RowIndex].Values["id"].ToString());
            SqlDataSource2.Delete();
            GridView1.DataBind();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "eliminarCarrera();", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            SqlDataSource2.UpdateCommand = "UPDATE nivel_educativo SET nivel=@nomb WHERE id=@codi";
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_gestor_PresupuestoBecarioD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        if (!Page.IsPostBack)
        {

            if (Request.QueryString["id"] != null)
            {
                int codi = int.Parse(Request.QueryString["id"]);
               
            }
            else
            {
                Response.Redirect("PresupuestoBecario.aspx");
            }
        }
    }
}
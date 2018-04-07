using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_DestruirSessionUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["codigoUsuario"]=null;
        Session["tipoUsuario"] = null;
        Response.Redirect("Default2.aspx");
    }
}
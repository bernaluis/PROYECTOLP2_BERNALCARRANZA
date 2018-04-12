using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_gestor_EditarBecario : System.Web.UI.Page
{
    int codi = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        if (!Page.IsPostBack)
        {

            if (Request.QueryString["id"] != null)
            {
                codi = int.Parse(Request.QueryString["id"]);
                conexionSQL.getDatosComboB(ref ddlCarreras, "select * from carrera where estado=1");
                conexionSQL.getDatosComboB(ref ddlNivel, "select * from nivel_educativo where estado=1");
                conexionSQL.getDatosComboB(ref ddlUniversidades, "select * from universidad where estado=1");
                conexionSQL.getProgramas(ref ddlPrograma);
                conexionSQL.readBecario(codi, ref this.txtNombre,ref this.txtApellidos,ref this.txtContra,ref this.txtCorreo, ref this.txtDui,ref this.txtDireccion,ref this.txtTelefono, ref this.txtFechaN,ref this.fechaInicio,ref this.fechaFin,ref this.ddlPrograma,ref this.ddlUniversidades,ref this.ddlCarreras, ref this.ddlNivel);
                conexionSQL.desconectar();

            }
            else
            {
                Response.Redirect("PresupuestoBecario.aspx");
            }
        }
    }
    protected void actualizarUsuario_Click(object sender, EventArgs e)
    {
        String nombre = this.txtNombre.Text;
        String apellido = this.txtApellidos.Text;
        String correo = this.txtCorreo.Text;
        String fecha = this.txtFechaN.Text;
        String tel = this.txtTelefono.Text;
        String direccion = this.txtDireccion.Text;
        String duracion = this.txtContra.Text;
        String dui = this.txtDui.Text;
        String fechai = this.fechaInicio.Text;
        String fechaf = this.fechaFin.Text;
        int univ = int.Parse(ddlUniversidades.SelectedValue);
        int carr = int.Parse(ddlCarreras.SelectedValue);
        int nivel = int.Parse(ddlNivel.SelectedValue);
        int beca = int.Parse(this.ddlPrograma.SelectedValue);
        if (nombre != "")
        {
            if (apellido != "")
            {
                if (correo != "" && fecha != "" && tel != "" && direccion != "" && dui != "" && fechai != "" && fechaf != "")
                {
                    if (beca > 0 && nivel > 0 && carr > 0 && univ > 0)
                    {
                        conexion conexionSQL = new conexion();
                        conexionSQL.conectar();
                        
                        int resp = conexionSQL.update(codi,nombre, apellido, correo, univ, nivel, carr, beca, fecha, fechai, fechaf, tel, direccion, dui, duracion);
                        conexionSQL.desconectar();
                        if (resp > 0)
                        {
                           
                                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "modificarCarrera();", true);
                           
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
        }
    }
}
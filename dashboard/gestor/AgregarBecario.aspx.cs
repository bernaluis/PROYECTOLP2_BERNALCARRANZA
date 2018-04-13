using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard_gestor_AgregarBecario : System.Web.UI.Page
{
    String codigoB = "";
    String codi = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        conexion conexionSQL = new conexion();
        conexionSQL.conectar();
        if (!Page.IsPostBack)
        {
            conexionSQL.getDatosComboB(ref ddlCarreras, "select * from carrera where estado=1");
            conexionSQL.getDatosComboB(ref ddlNivel, "select * from nivel_educativo where estado=1");
            conexionSQL.getDatosComboB(ref ddlUniversidades, "select * from universidad where estado=1");
            conexionSQL.getProgramas(ref ddlPrograma);
            conexionSQL.desconectar();
        }
    }
    protected void guardarUsuario_Click(object sender, EventArgs e)
    {
        String nombre = this.txtNombre.Text;
        String apellido = this.txtApellidos.Text;
        String correo = this.txtCorreo.Text;
        String fecha = this.txtFechaN.Text;
        String tel = this.txtTelefono.Text;
        String direccion = this.txtDireccion.Text;
       String duracion=this.txtContra.Text;
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
                if (correo != ""&&fecha!=""&&tel!=""&&direccion!=""&&dui!=""&&fechai!=""&&fechaf!="")
                {
                    if (beca > 0&&nivel>0&&carr>0&&univ>0)
                    {
                        conexion conexionSQL = new conexion();
                        conexionSQL.conectar();
                        generadorContra c = new generadorContra();
                        String contra = c.generarContra();
                        encriptacion enc = new encriptacion();
                        String contraEnc = enc.encriptarContra(contra);
                        String codB=conexionSQL.getCodigoB(beca);
                        int codigo=conexionSQL.codigoMax()+1;
                        this.metodoCodigo(codB, codigo);
                        int resp = conexionSQL.agregarBecario(nombre, apellido, correo, contra, univ, nivel, carr, beca, fecha, fechai, fechaf, tel, direccion, this.codigoB, dui, duracion);
                        conexionSQL.desconectar();
                        if (resp > 0)
                        {
                            correo enviarCo = new correo(correo, "Credeciales de Usuario", "Estimado/a: " + nombre + ". Su password es: " + contra);
                            if (enviarCo.Estado)
                            {
                                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "modificarCarrera();", true);
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "modificarCarrera();", true);
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
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Popup", "error();", true);
        }
    }
    void metodoCodigo(String codigo,int code)
    {
        codi=code.ToString();
        if(codi.Length==1)
        {
            codi = String.Concat(0, 0, 0, codi);
            this.codigoB=String.Concat(codigo,DateTime.Now.Year.ToString(),codi);
        }
        else if (codi.Length == 2)
        {
            codi = String.Concat(0, 0,  codi);
            this.codigoB = String.Concat(codigo, DateTime.Now.Year.ToString(), codi);
        }
        else if (codi.Length == 3)
        {
            codi = String.Concat(0,  codi);
            this.codigoB = String.Concat(codigo, DateTime.Now.Year.ToString(), codi);
        }
        else if (codi.Length == 4)
        {
            this.codigoB = String.Concat(codigo, DateTime.Now.Year.ToString(), codi);
        }

    }
}
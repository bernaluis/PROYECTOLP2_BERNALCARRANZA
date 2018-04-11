using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data;

/// <summary>
/// Descripción breve de conexion
/// </summary>
public class conexion
{
    private String cadenaConexion;
    private SqlConnection conexionSQL;
    public conexion()
    {
        this.cadenaConexion = ConfigurationManager.ConnectionStrings["CadenaConexion"].ConnectionString;
    }
    public bool conectar()
    {
        try
        {
            this.conexionSQL = new SqlConnection(this.cadenaConexion);
            this.conexionSQL.Open();
            return true;
        }
        catch (Exception e)
        {

            return false;
        }
    }
    public bool estadoConexion()
    {
        switch (this.conexionSQL.State)
        {
            case System.Data.ConnectionState.Broken:
                return true;
            case System.Data.ConnectionState.Open:
                return true;
            default:
                return false;
        }
    }
    public void desconectar()
    {
        this.conexionSQL.Close();
    }
    public void getTipoEmpleado(ref DropDownList combobox)
    {
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT * FROM tipo_usuario";
        comando.Connection = this.conexionSQL;
        try
        {
            combobox.Items.Clear();
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    combobox.Items.Add(new ListItem(lector.GetString(1), lector.GetInt32(0).ToString()));
                }
                lector.Close();
            }
        }
        catch (SqlException e)
        {

        }
    }
    public void getCiclos(ref DropDownList combobox, Object codigoBecario)
    {
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT DISTINCT ciclo.* from notas,ciclo,becario where notas.id_ciclo=ciclo.id AND notas.id_becario=becario.id AND becario.codigo=@codi order by nombre asc";
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@codi", codigoBecario);
            combobox.Items.Clear();
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    combobox.Items.Add(new ListItem(lector.GetString(1), lector.GetInt32(0).ToString()));
                }
                lector.Close();
            }
        }
        catch (SqlException e)
        {

        }
    }
    public void getCiclosAll(ref DropDownList combobox)
    {
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT ciclo.* from ciclo WHERE nombre LIKE @anio order by nombre asc";
        comando.Connection = this.conexionSQL;
        try
        {
            String anio = "%" + DateTime.Now.ToString("yyyy") + "%";
            comando.Parameters.AddWithValue("@anio", anio);
            combobox.Items.Clear();
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    combobox.Items.Add(new ListItem(lector.GetString(1), lector.GetInt32(0).ToString()));
                }
                lector.Close();
            }
        }
        catch (SqlException e)
        {

        }
    }
    public int agregarMateria(Object codigoBecario, String nombreM, double notaM, int estadoT, int idCiclo)
    {
        String queryInsert = "INSERT INTO notas(id_becario,nombre_materia,nota_materia,estado_tercioS,id_ciclo) VALUES ((select id from becario where codigo=@codiBeca),@nombMate,@notaMate,@estaTerc,@codiCicl)";
        SqlCommand comando = new SqlCommand();
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = queryInsert;
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@codiBeca", codigoBecario);
            comando.Parameters.AddWithValue("@nombMate", nombreM);
            comando.Parameters.AddWithValue("@notaMate", notaM);
            comando.Parameters.AddWithValue("@estaTerc", estadoT);
            comando.Parameters.AddWithValue("@codiCicl", idCiclo);
            return comando.ExecuteNonQuery();
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    public String LoginEstudiante(String correo, String contra)
    {
        String resp = "Nada";
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT codigo FROM becario WHERE correo=@correo AND contra=@contra AND estado=1";
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@correo", correo);
            comando.Parameters.AddWithValue("@contra", contra);
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    resp = lector.GetString(0);
                }
                lector.Close();
            }
            return resp;
        }
        catch (SqlException e)
        {
            return resp;
        }
    }
    //Login Usuario
    public int idUsuario;
    public int LoginUsuarios(String correo, String contra)
    {
        int resp = 0;
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "select id, id_tipo from usuario where correo=@correo AND contra=@contra";
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@correo", correo);
            comando.Parameters.AddWithValue("@contra", contra);
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    idUsuario = lector.GetInt32(0);
                    resp = lector.GetInt32(1);
                }
                lector.Close();
            }
            return resp;
        }
        catch (SqlException e)
        {
            return resp;
        }
    }
    //Programa de Beca
    public int agregarProgramaBeca(String codi, String nomb, String descr)
    {
        String queryInsert = "INSERT INTO programa_beca(codigo,nombre,descripcion) VALUES (@codi,@nomb,@descr)";
        SqlCommand comando = new SqlCommand();
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = queryInsert;
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@codi", codi);
            comando.Parameters.AddWithValue("@nomb", nomb);
            comando.Parameters.AddWithValue("@descr", descr);
            return comando.ExecuteNonQuery();
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    //Mantenimientos
    //Carrera
    public int agregarCarrera(String nomb)
    {
        String queryInsert = "INSERT INTO carrera(nombre,estado) VALUES (@nomb,1)";
        SqlCommand comando = new SqlCommand();
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = queryInsert;
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@nomb", nomb);
            return comando.ExecuteNonQuery();
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    //Universidad
    public int agregarUniversidad(String nomb)
    {
        String queryInsert = "INSERT INTO universidad(nombre,estado) VALUES (@nomb,1)";
        SqlCommand comando = new SqlCommand();
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = queryInsert;
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@nomb", nomb);
            return comando.ExecuteNonQuery();
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    //Nivel Educativo
    public int agregarNivelEducativo(String nomb)
    {
        String queryInsert = "INSERT INTO nivel_educativo(nivel,estado) VALUES (@nomb,1)";
        SqlCommand comando = new SqlCommand();
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = queryInsert;
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@nomb", nomb);
            return comando.ExecuteNonQuery();
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    //Ciclo
    public int agregarCiclo(String nomb)
    {
        String queryInsert = "INSERT INTO ciclo(nombre) VALUES (@nomb)";
        SqlCommand comando = new SqlCommand();
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = queryInsert;
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@nomb", nomb);
            return comando.ExecuteNonQuery();
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    //Aspecto Presupuesto
    public int agregarAspecto(String nomb)
    {
        String queryInsert = "INSERT INTO aspecto(nombre) VALUES (@nomb)";
        SqlCommand comando = new SqlCommand();
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = queryInsert;
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@nomb", nomb);
            return comando.ExecuteNonQuery();
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    //Usuario
    public int agregarUsuario(String nombre, String apellido, String correo, String contra, int tipo)
    {
        String queryInsert = "INSERT INTO usuario(nombres,apellidos,correo,contra,id_tipo) VALUES (@nombre,@apellido,@correo,@contra,@tipo)";
        SqlCommand comando = new SqlCommand();
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = queryInsert;
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.Parameters.AddWithValue("@apellido", apellido);
            comando.Parameters.AddWithValue("@correo", correo);
            comando.Parameters.AddWithValue("@contra", contra);
            comando.Parameters.AddWithValue("@tipo", tipo);
            return comando.ExecuteNonQuery();
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    //Programas Todos
    public void getProgramasAll(ref DropDownList combobox)
    {
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT id, codigo from programa_beca ORDER BY id asc";
        comando.Connection = this.conexionSQL;
        try
        {
            combobox.Items.Clear();
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    combobox.Items.Add(new ListItem(lector.GetString(1), lector.GetInt32(0).ToString()));
                }
                lector.Close();
            }
        }
        catch (SqlException e)
        {

        }
    }
    //Universidades Todos
    public void getUniversidadesAll(ref DropDownList combobox)
    {
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT id, nombre from universidad ORDER BY id asc";
        comando.Connection = this.conexionSQL;
        try
        {
            combobox.Items.Clear();
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    combobox.Items.Add(new ListItem(lector.GetString(1), lector.GetInt32(0).ToString()));
                }
                lector.Close();
            }
        }
        catch (SqlException e)
        {

        }
    }
    //Carreras Todos
    public void getCarrerasAll(ref DropDownList combobox)
    {
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT id, nombre from carrera where estado=1 ORDER BY id asc";
        comando.Connection = this.conexionSQL;
        try
        {
            combobox.Items.Clear();
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    combobox.Items.Add(new ListItem(lector.GetString(1), lector.GetInt32(0).ToString()));
                }
                lector.Close();
            }
        }
        catch (SqlException e)
        {

        }
    }
    public void getAlumnosContador(ref DropDownList combo, int programa, int universidad, int carrera, int estado)
    {
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT b.id, b.codigo FROM becario as b,programa_beca as pb, universidad as u, carrera as c WHERE b.id_programaBeca= pb.id AND b.id_universidad= u.id AND b.id_carrera=c.id AND b.id_carrera=@car AND b.id_programaBeca=@pro AND b.id_universidad=@uni AND b.estado=@est";
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@pro", programa);
            comando.Parameters.AddWithValue("@uni", universidad);
            comando.Parameters.AddWithValue("@car", carrera);
            comando.Parameters.AddWithValue("@est", estado);
            combo.Items.Clear();
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    combo.Items.Add(new ListItem(lector.GetString(1), lector.GetInt32(0).ToString()));
                }
                lector.Close();
            }
        }
        catch (SqlException e)
        {

        }
    }
    public void readUsuario(int id, ref TextBox nomb, ref TextBox apell, ref DropDownList combo)
    {
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT usuario.nombres,usuario.apellidos,usuario.id_tipo FROM usuario inner join tipo_usuario ON usuario.id_tipo=tipo_usuario.id WHERE usuario.id=@id";
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@id", id);
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    nomb.Text = lector.GetString(0);
                    apell.Text = lector.GetString(1);
                    combo.SelectedIndex = lector.GetInt32(2) - 1;
                }
                lector.Close();
            }
        }
        catch (SqlException e)
        {
        }
    }
    public int modificarUsuario(int id, String nomb, String apel, int combo)
    {
        String queryUpdate = "UPDATE usuario SET nombres=@nomb, apellidos=@apel, id_tipo=@tipo WHERE id=@id";
        SqlCommand comando = new SqlCommand();
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = queryUpdate;
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@nomb", nomb);
            comando.Parameters.AddWithValue("@apel", apel);
            comando.Parameters.AddWithValue("@tipo", combo);
            comando.Parameters.AddWithValue("@id", id);
            return comando.ExecuteNonQuery();
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    public int verificarExistenciaPresupuestoBecario(String codi)
    {
        int res=0;
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT COUNT(*) as conteo FROM presupuesto_maestro WHERE id_becario = (SELECT id from becario where codigo = @codi)";
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@codi", codi);
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    res = lector.GetInt32(0);
                }
                lector.Close();
            }
            return res;
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    public int agregarPresupuestoBecario(String codi)
    {
        String queryUpdate = "insert into presupuesto_maestro(id_becario) VALUES((SELECT id from becario where codigo = @codi))";
        SqlCommand comando = new SqlCommand();
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = queryUpdate;
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@codi", codi);
            return comando.ExecuteNonQuery();
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    public int agregarAspectoPresupuestoBecario(String codi, int aspe, double mont)
    {
        String queryUpdate = "insert into presupuesto_detalle(id_maestro,id_aspecto,monto) VALUES ((SELECT TOP 1 id from presupuesto_maestro WHERE id_becario=(SELECT id from becario where codigo = @codi) ORDER BY id desc),@aspe,@mont)";
        SqlCommand comando = new SqlCommand();
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = queryUpdate;
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@codi", codi);
            comando.Parameters.AddWithValue("@aspe", aspe);
            comando.Parameters.AddWithValue("@mont", mont);
            return comando.ExecuteNonQuery();
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    public int verificarAspectoPresupuestoBecario(String codi, int aspe)
    {
        int res = 0;
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT COUNT(*) AS conteo FROM ((presupuesto_detalle AS pd INNER JOIN presupuesto_maestro AS pm ON pd.id_maestro=pm.id)INNER JOIN becario AS b ON pm.id_becario= b.id) WHERE b.codigo=@codi AND pd.id_aspecto=@aspe";
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@codi", codi);
            comando.Parameters.AddWithValue("@aspe", aspe);
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    res = lector.GetInt32(0);
                }
                lector.Close();
            }
            return res;
        }
        catch (SqlException ex)
        {
            return 0;
        }
    }
    public int verificarExistenciaBecario(String codi)
    {
        int res = 0;
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT COUNT(*) AS conteo FROM becario WHERE codigo=@codi";
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@codi", codi);
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    res = lector.GetInt32(0);
                }
                lector.Close();
            }
            return res;
        }
        catch (SqlException ex)
        {
            return 0;
        }
    }
    //Carreras Todos
    public void getAspectosAll(ref DropDownList combobox)
    {
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT id, nombre from aspecto ORDER BY id asc";
        comando.Connection = this.conexionSQL;
        try
        {
            combobox.Items.Clear();
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    combobox.Items.Add(new ListItem(lector.GetString(1), lector.GetInt32(0).ToString()));
                }
                lector.Close();
            }
        }
        catch (SqlException e)
        {

        }
    }
    public void getAspectosBecario(ref DropDownList combobox, String codi)
    {
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT DISTINCT pd.id,a.nombre FROM ((((desembolso as d FULL OUTER JOIN presupuesto_detalle AS pd ON d.id_presupuestoD=pd.id)INNER JOIN aspecto AS a ON pd.id_aspecto=a.id)INNER JOIN presupuesto_maestro AS pm ON pd.id_maestro=pm.id)INNER JOIN becario AS b ON pm.id_becario=b.id) WHERE b.codigo=@codi";
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@codi", codi);
            combobox.Items.Clear();
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    combobox.Items.Add(new ListItem(lector.GetString(1), lector.GetInt32(0).ToString()));
                }
                lector.Close();
            }
        }
        catch (SqlException e)
        {

        }
    }
    public int verificarMontoIngresado(int aspe, double mont)
    {
        int res = 0;
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT DISTINCT ((pd.monto - (SELECT SUM(desembolso.monto) FROM desembolso WHERE desembolso.id_presupuestoD=@aspe))-@mont) as monto FROM desembolso AS d FULL OUTER JOIN presupuesto_detalle AS pd ON d.id_presupuestoD=pd.id WHERE pd.id=@aspe GROUP BY pd.monto, d.monto";
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@mont", mont);
            comando.Parameters.AddWithValue("@aspe", aspe);
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                double valor=0;
                while (lector.Read())
                {
                    valor = lector.GetDouble(0);
                }
                if (valor >= 0)
                {
                    res = 1;
                }
                lector.Close();
            }
            return res;
        }
        catch (SqlException ex)
        {
            return 0;
        }
    }
    public int agregarDesembolso(int aspe, double mont)
    {
        String queryUpdate = "insert into desembolso(id_presupuestoD,monto,fecha) VALUES (@pd,@mont,@fech)";
        SqlCommand comando = new SqlCommand();
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = queryUpdate;
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@pd", aspe);
            comando.Parameters.AddWithValue("@mont", mont);
            comando.Parameters.AddWithValue("@fech", DateTime.Now.ToString("yyyy-MM-dd"));
            return comando.ExecuteNonQuery();
        }
        catch (SqlException e)
        {
            return 0;
        }
    }
    public int verificarMontoIngresadoNUll(int aspe, double mont)
    {
        int res = 0;
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT DISTINCT (pd.monto-@mont) as monto FROM desembolso AS d FULL OUTER JOIN presupuesto_detalle AS pd ON d.id_presupuestoD=pd.id WHERE pd.id=@aspe GROUP BY pd.monto, d.monto";
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@mont", mont);
            comando.Parameters.AddWithValue("@aspe", aspe);
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                double valor = 0;
                while (lector.Read())
                {
                    valor = lector.GetDouble(0);
                }
                if (valor >= 0)
                {
                    res = 1;
                }
                lector.Close();
            }
            return res;
        }
        catch (SqlException ex)
        {
            return 0;
        }
    }

    public int verificarExistenciaMonto(int aspe)
    {
        int res = 0;
        SqlCommand comando = new SqlCommand();
        SqlDataReader lector;
        comando.CommandType = System.Data.CommandType.Text;
        comando.CommandText = "SELECT COUNT(monto) FROM desembolso WHERE id_presupuestoD = @aspe";
        comando.Connection = this.conexionSQL;
        try
        {
            comando.Parameters.AddWithValue("@aspe", aspe);
            lector = comando.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    res = lector.GetInt32(0);
                }
                lector.Close();
            }
            return res;
        }
        catch (SqlException ex)
        {
            return 0;
        }
    }
}
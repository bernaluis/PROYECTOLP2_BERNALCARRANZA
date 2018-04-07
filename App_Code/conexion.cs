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
        comando.CommandText = "SELECT * FROM tipo_usuario order by tipo asc";
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
        comando.CommandText = "SELECT ciclo.* from ciclo order by nombre asc";
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
    public int agregarMateria(Object codigoBecario, String nombreM, double notaM, int estadoT, int idCiclo)
    {
        String queryInsert = "INSERT INTO notas(id,id_becario,nombre_materia,nota_materia,estado_tercioS,id_ciclo) VALUES ((select top 1 (id+1) as ultiId from notas order by id desc),(select id from becario where codigo=@codiBeca),@nombMate,@notaMate,@estaTerc,@codiCicl)";
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
        String queryInsert = "INSERT INTO programa_beca(id,codigo,nombre,descripcion) VALUES ((select top 1 (id+1) as ultiId from programa_beca order by id desc),@codi,@nomb,@descr)";
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
        String queryInsert = "INSERT INTO carrera(id,nombre,estado) VALUES ((select top 1 (id+1) as ultiId from carrera order by id desc),@nomb,1)";
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
        String queryInsert = "INSERT INTO universidad(id,nombre,estado) VALUES ((select top 1 (id+1) as ultiId from universidad order by id desc),@nomb,1)";
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
        String queryInsert = "INSERT INTO nivel_educativo(id,nivel,estado) VALUES ((select top 1 (id+1) as ultiId from nivel_educativo order by id desc),@nomb,1)";
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
        String queryInsert = "INSERT INTO ciclo(id,nombre) VALUES ((select top 1 (id+1) as ultiId from ciclo order by id desc),@nomb)";
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
        String queryInsert = "INSERT INTO aspecto(id,nombre) VALUES ((select top 1 (id+1) as ultiId from aspecto order by id desc),@nomb)";
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
        String queryInsert = "INSERT INTO usuario(id,nombres,apellidos,correo,contra,id_tipo) VALUES ((select top 1 (id+1) as ultiId from usuario order by id desc),@nombre,@apellido,@correo,@contra,@tipo)";
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
        comando.CommandText = "SELECT id, codigo from programa_beca order by id";
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
        comando.CommandText = "SELECT id, nombre from universidad order by id";
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
        comando.CommandText = "SELECT id, nombre from carrera where estado=1 order by id";
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
            if(lector.HasRows)
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
}
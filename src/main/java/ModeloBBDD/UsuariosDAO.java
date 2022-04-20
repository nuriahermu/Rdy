package ModeloBBDD;


import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.Statement;

import Controlador.Conexion;
import Modelo.Usuarios;
import Modelo.UsuariosJuegos;

public class UsuariosDAO {
    
    private Connection connection;
    private final Conexion con;
    
    public UsuariosDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) throws SQLException {
		con = new Conexion(jdbcURL, jdbcUsername, jdbcPassword);
    }
    
  
    // insertar usuario
    public boolean insertar(Usuarios usuario) throws SQLException {
            String sql = "INSERT INTO usuarios (id, usuario, clave, rol) VALUES (?, ?, ?, ?)";
            System.out.println(usuario.getUsuario());
            con.conectar();
            connection = con.getJdbcConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, null);
            statement.setString(2, usuario.getUsuario());
            statement.setString(3, usuario.getClave());
            statement.setString(4, usuario.getRol());

            boolean rowInserted = statement.executeUpdate() > 0;
            statement.close();
            con.desconectar();
            return rowInserted;
    }

    // listar todos los usuarios
    public List<Usuarios> listarUsuarios() throws SQLException {

            List<Usuarios> listaUsuarios = new ArrayList<Usuarios>();
            String sql = "SELECT * FROM usuarios";
            con.conectar();
            connection = con.getJdbcConnection();
            Statement statement = (Statement) connection.createStatement();
            ResultSet resulSet = ((java.sql.Statement) statement).executeQuery(sql);

            while (resulSet.next()) {
                    int id = resulSet.getInt("id");
                    String usuario = resulSet.getString("usuario");
                    String clave = resulSet.getString("clave");
                    String rol = resulSet.getString("rol");
                    
                    Usuarios usuarioNew = new Usuarios(id, usuario, clave, rol);
                    listaUsuarios.add(usuarioNew);
            }
            con.desconectar();
            return listaUsuarios;
    }

    // obtener por id
    public Usuarios obtenerPorId(int id) throws SQLException {
            Usuarios usuario = null;

            String sql = "SELECT * FROM usuarios WHERE id= ? ";
            con.conectar();
            connection = con.getJdbcConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            ResultSet res = statement.executeQuery();
            if (res.next()) {
                    usuario = new Usuarios(res.getInt("id"), res.getString("usuario"), res.getString("clave"),
                                    res.getString("rol"));
            }
            res.close();
            con.desconectar();

            return usuario;
    }

    // actualizar
    public boolean actualizar(Usuarios usuario) throws SQLException {
            boolean rowActualizar = false;
            String sql = "UPDATE usuarios SET usuario=?,clave=?,rol=? WHERE id=?";
            con.conectar();
            connection = con.getJdbcConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, usuario.getUsuario());
            statement.setString(2, usuario.getClave());
            statement.setString(3, usuario.getRol());
            System.out.println(usuario.getUsuario());

            rowActualizar = statement.executeUpdate() > 0;
            statement.close();
            con.desconectar();
            return rowActualizar;
    }

    //eliminar
    public boolean eliminar(Usuarios usuario) throws SQLException {
            boolean rowEliminar = false;
            String sql = "DELETE FROM usuarios WHERE ID=?";
            con.conectar();
            connection = con.getJdbcConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, usuario.getId());

            rowEliminar = statement.executeUpdate() > 0;
            statement.close();
            con.desconectar();

            return rowEliminar;
    }
    
    // consultar
    public Usuarios consultar(String nombre, String clave) throws SQLException {
            Usuarios usuario = null;

            String sql = "SELECT * FROM usuarios WHERE usuario= ? AND clave=? ";
            con.conectar();
            connection = con.getJdbcConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, clave);

            ResultSet res = statement.executeQuery();
            if (res.next()) {
                    usuario = new Usuarios(res.getInt("id"), res.getString("usuario"), res.getString("clave"),
                                    res.getString("rol"));
            }
            res.close();
            con.desconectar();

            return usuario;
    }
    
    // insertar en usuario la descarga
    public boolean insertarDescarga(UsuariosJuegos usuario) throws SQLException {
    	String sql = "INSERT INTO usuariosjuegos (id,id_usuario,id_juego,fecha) VALUES (?, ?, ?, ?)";
        con.conectar();
        connection = con.getJdbcConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
    	try {
            
            statement.setString(1, null);
            statement.setInt(2, usuario.getId_usuario());
            statement.setInt(3, usuario.getId_juego());
            
            java.util.Date date = new java.util.Date();
            java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
            
            statement.setTimestamp(4, timestamp);

           
            
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 boolean rowInserted = statement.executeUpdate() > 0;
         statement.close();
         con.desconectar();
    	return rowInserted;
    }

    
}


package ModeloBBDD;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.Statement;

import Controlador.Conexion;
import Modelo.Usuarios;

public class UsuariosDAO {
    
    private Connection connection;
    private final Conexion con;
    
    public UsuariosDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) throws SQLException {
		System.out.println(jdbcURL);
		con = new Conexion(jdbcURL, jdbcUsername, jdbcPassword);
    }
    
  
    // insertar usuario
    public boolean insertar(Usuarios usuario) throws SQLException {
            String sql = "INSERT INTO usuarios (id, usuario, clave, rol, memoria) VALUES (?, ?, ?, ?, ?)";
            System.out.println(usuario.getUsuario());
            con.conectar();
            connection = con.getJdbcConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, null);
            statement.setString(2, usuario.getUsuario());
            statement.setString(3, usuario.getClave());
            statement.setString(4, usuario.getRol());
            statement.setInt(5, usuario.getMemoria());

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
                    int memoria = resulSet.getInt("memoria");
                    
                    Usuarios usuarioNew = new Usuarios(id, usuario, clave, rol, memoria);
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
                                    res.getString("rol"), res.getInt("memoria"));
            }
            res.close();
            con.desconectar();

            return usuario;
    }

    // actualizar
    public boolean actualizar(Usuarios usuario) throws SQLException {
            boolean rowActualizar = false;
            String sql = "UPDATE usuarios SET usuario=?,clave=?,rol=?, memoria=? WHERE id=?";
            con.conectar();
            connection = con.getJdbcConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, usuario.getUsuario());
            statement.setString(2, usuario.getClave());
            statement.setString(3, usuario.getRol());
            statement.setInt(4, usuario.getMemoria());
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
                                    res.getString("rol"), res.getInt("memoria"));
            }
            res.close();
            con.desconectar();

            return usuario;
    }

    
}


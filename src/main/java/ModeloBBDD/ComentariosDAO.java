package ModeloBBDD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Controlador.Conexion;
import Modelo.ComentarioBlog;
import Modelo.ComentarioJuego;

public class ComentariosDAO {

	private Connection connection;
	private final Conexion con;

	public ComentariosDAO(Connection connection, Conexion con) {
		super();
		this.connection = connection;
		this.con = con;
	}

	public ComentariosDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		con = new Conexion(jdbcURL, jdbcUsername, jdbcPassword);
	}

	// insertar comentario noticia
	public boolean insertar(ComentarioBlog comentario) throws SQLException {
		String sql = "INSERT INTO blog_comentario (id, id_blog, nombre, mensaje) VALUES (?, ?, ?, ?)";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, null);
		statement.setString(2, comentario.getId_blog());
		statement.setString(3, comentario.getNombre());
		statement.setString(4, comentario.getMensaje());

		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		con.desconectar();
		return rowInserted;
	}
	
	// Borramos la noticia y los comentarios asociados
	public boolean eliminarNoticia(String id) throws SQLException {
		
	    String sql1 = "delete from blog where id="+Integer.parseInt(id);
	    String sql2 = "delete from blog_comentario where id_blog="+Integer.parseInt(id);
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql1);
		statement.execute();
		statement.close();
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		statement2.execute();
		statement2.close();
		con.desconectar();
		return true;
	}
	
	// insertar comentario juego
	public boolean insertarComentarioJuego(ComentarioJuego comentario) throws SQLException {
		String sql = "INSERT INTO juego_comentario (id, id_juego, nombre, mensaje) VALUES (?, ?, ?, ?)";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, null);
		statement.setString(2, comentario.getId_juego());
		statement.setString(3, comentario.getNombre());
		statement.setString(4, comentario.getMensaje());

		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		con.desconectar();
		return rowInserted;
	}
	
	// Eliminar comentario del juego
		public boolean eliminarComentarioJuego(Integer id) throws SQLException {
			
		    String sql2 = "delete from juego_comentario where id="+id;
			con.conectar();
			connection = con.getJdbcConnection();
			PreparedStatement statement2 = connection.prepareStatement(sql2);
			statement2.execute();
			statement2.close();
			con.desconectar();
			return true;
		}
		
	// Eliminar comentario del juego
		public boolean eliminarComentarioBlog(Integer id) throws SQLException {
			
		    String sql2 = "delete from blog_comentario where id="+id;
			con.conectar();
			connection = con.getJdbcConnection();
			PreparedStatement statement2 = connection.prepareStatement(sql2);
			statement2.execute();
			statement2.close();
			con.desconectar();
			return true;
		}
}

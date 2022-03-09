package ModeloBBDD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Controlador.Conexion;
import Modelo.ComentarioBlog;

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
}

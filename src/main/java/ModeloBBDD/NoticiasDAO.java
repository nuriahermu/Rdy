package ModeloBBDD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Controlador.Conexion;
import Modelo.Blog;
import Modelo.Juego;

public class NoticiasDAO {

	private Connection connection;
	private final Conexion con;

	public NoticiasDAO(Connection connection, Conexion con) {
		super();
		this.connection = connection;
		this.con = con;
	}

	public NoticiasDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		con = new Conexion(jdbcURL, jdbcUsername, jdbcPassword);
	}
	
	//Insertar juego nuevo
	public void insertarNoticia(Blog j) throws SQLException {

		String sql = "insert into blog values(?,?,?,?,?)";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, null);
		statement.setString(2, j.getTitulo());
		statement.setString(3, j.getDescripcion());
		statement.setBlob(4, j.getFoto());
		statement.setString(5, j.getYoutube());

		statement.executeUpdate();
		statement.close();
		con.desconectar();
	}
}

package ModeloBBDD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Controlador.Conexion;
import Modelo.Juego;

public class JuegosDAO {

	private Connection connection;
	private final Conexion con;

	public JuegosDAO(Connection connection, Conexion con) {
		super();
		this.connection = connection;
		this.con = con;
	}

	public JuegosDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		con = new Conexion(jdbcURL, jdbcUsername, jdbcPassword);
	}

	// Modificar juego
	public void modificar(Juego juego) throws SQLException {
		String sql = "update juegos set nombre='" + juego.getNombre().trim() + "', anio=" + juego.getAnio()
				+ ", caracteristicas='" + juego.getCaracteristicas().trim() + "', plataforma_id="
				+ juego.getPlataforma_id() + ", exclusivo=" + juego.getExclusivo() + " where id=" + juego.getId();
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.execute();
		statement.close();
		con.desconectar();
	}

	// Borramos el juego y los comentarios asociados
	public boolean eliminarJuego(String id) throws SQLException {

		String sql1 = "delete from juegos where id=" + Integer.parseInt(id);
		String sql2 = "delete from juego_comentario where id_juego=" + Integer.parseInt(id);
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

	
	//Insertar juego nuevo
	public void insertarJuego(Juego j) throws SQLException {

		String sql = "insert into juegos values(?,?,?,?,?,?,?,?,?)";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, null);
		statement.setString(2, j.getNombre());
		statement.setInt(3, j.getAnio());
		statement.setInt(4, j.getPlataforma_id());
		statement.setBlob(5, j.getFoto_portada2());
		statement.setString(6, j.getCaracteristicas());
		statement.setBlob(7, j.getFoto_juego11());
		statement.setBlob(8, j.getFoto_juego22());
		statement.setInt(9, j.getExclusivo());

		statement.executeUpdate();
		statement.close();
		con.desconectar();
	}
}

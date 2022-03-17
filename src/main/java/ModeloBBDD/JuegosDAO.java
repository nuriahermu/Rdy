package ModeloBBDD;

import java.sql.Connection;

import Controlador.Conexion;

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
}

package ModeloBBDD;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Controlador.Conexion;
import Modelo.Blog;
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
	public void modificar(Juego juego) throws SQLException, IOException {
		String modImagenPortada="";
		String modImagenFoto1="";
		String modImagenFoto2="";
		
		if(juego.getFoto_portada2() != null) {
			modImagenPortada = ", foto_portada = ? ";
		}
		
		if(juego.getFoto_juego11() != null) {
			modImagenFoto1= ", foto_juego1 = ? ";
		}
		
		if(juego.getFoto_juego22() != null) {
			modImagenFoto2= ", foto_juego2= ? ";
		}
		
		
		String sql = "UPDATE juegos SET nombre = ? , anio = ?, caracteristicas = ?, plataforma_id = ?, exclusivo = ?"+ 
						modImagenPortada + modImagenFoto1+ modImagenFoto2+ " where id=" + juego.getId();
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, juego.getNombre().trim());
		statement.setInt(2, juego.getAnio());
		statement.setString(3, juego.getCaracteristicas().trim());
		statement.setInt(4, juego.getPlataforma_id());
		statement.setInt(5, juego.getExclusivo());
		
		if(modImagenPortada != "") {
			statement.setBlob(6, juego.getFoto_portada2());
		}
		
		if(modImagenPortada != "" && modImagenFoto1 != "" ) {
			statement.setBlob(7, juego.getFoto_juego11());
		}
		
		if(modImagenPortada == "" && modImagenFoto1 != "" ) {
			statement.setBlob(6, juego.getFoto_juego11());
		}

		if(modImagenPortada != "" && modImagenFoto1 != "" && modImagenFoto2 != "" ) {
			statement.setBlob(8, juego.getFoto_juego22());
		}else if((modImagenPortada != "" || modImagenFoto1 != "") && modImagenFoto2 != "" ) {
			statement.setBlob(7, juego.getFoto_juego22());
		}
		
		if(modImagenPortada == "" && modImagenFoto1 == "" && modImagenFoto2 != "") {
			statement.setBlob(6, juego.getFoto_juego22());
		}
		
		
		
		statement.executeUpdate();
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
	
	// Modificar blog
		public void modificar(Blog blog) throws SQLException, IOException {
			String modImagen="";
			
			if(blog.getFoto() != null) {
				modImagen = ", imagen = ? ";
			}

			String sql = "UPDATE blog SET titulo = ? , descripcion = ?, youtube = ?"+ modImagen + " where id=" + blog.getId();
			con.conectar();
			connection = con.getJdbcConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, blog.getTitulo().trim());
			statement.setString(2, blog.getDescripcion().trim());
			statement.setString(3, blog.getYoutube().trim());
			
			if(modImagen != "") {
				statement.setBlob(4, blog.getFoto());
			}
						
			statement.executeUpdate();
			statement.close();
			con.desconectar();
		}
}

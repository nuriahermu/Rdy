package ModeloBBDD;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;

import Modelo.Blog;

public class BlogDAO {

	private Connection con;
	private Statement sentencia = null;
	private ResultSet resulSet = null;

	public BlogDAO() {

	}

	// insertar blog
	public void insertar(Blog blog) throws SQLException {
		String sql = "INSERT INTO blog (id, titulo, descripcion, imagen, youtube) VALUES (?,?,?,?,?)";
		System.out.println("Se va a insertar una entrada de blog");
		conectar();
		sentencia = con.prepareStatement(sql);
		//sentencia.setString(2, blog.getTitulo());
//		sentencia.setInt(3, j.getAnio());
//		sentencia.setInt(4, j.getPlataforma_id());
//		sentencia.setBlob(5, j.getFoto_portada2());
//		sentencia.setString(6, j.getCaracteristicas());
//		sentencia.setBlob(7, j.getFoto_juego11());
//		sentencia.setBlob(8, j.getFoto_juego22());
//		sentencia.setInt(9, j.getExclusivo());

		sentencia.executeUpdate(sql);
		sentencia.close();
		desconectar();
	}

	// listar todas las entradas de blog
	public ArrayList<Blog> listarBlog() throws SQLException {

		ArrayList<Blog> listaBlog = null;
		String sql = "SELECT * FROM blog";
		try {
			conectar();
			sentencia = con.createStatement();
			listaBlog = new ArrayList<Blog>();
			resulSet = sentencia.executeQuery(sql);

			while (resulSet.next()) {
				Blog b = new Blog();

				b.setId(resulSet.getInt(1));
				b.setTitulo(resulSet.getString(2));
				b.setDescripcion(resulSet.getString(3));
				b.setImagen(resulSet.getBlob(4));

				String nom = Integer.toString(resulSet.getInt(1));
				Blob bytesImagen = resulSet.getBlob(4);
				InputStream is = bytesImagen.getBinaryStream();

				FileOutputStream fos = new FileOutputStream("copia_" + nom);
				byte bytes[] = new byte[1024];
				int leidos = is.read(bytes);
				while (leidos > 0) {
					fos.write(bytes);
					leidos = is.read(bytes);
				}
				fos.close();
				is.close();

				listaBlog.add(b);
			}
			sentencia.close();
			desconectar();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listaBlog;
	}

	public static LinkedList<Blog> getBlog() {
		LinkedList<Blog> listaEntradas = new LinkedList<Blog>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/rdy", "root", "");
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from blog");

			while (rs.next()) {
				Blog blog = new Blog();
				blog.setId(rs.getInt("id"));
				blog.setTitulo(rs.getString("titulo"));
				blog.setDescripcion(rs.getString("descripcion"));
				listaEntradas.add(blog);
			}
			rs.close();
			st.close();
			conexion.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listaEntradas;
	}

	// obtener por id
	public Blog obtenerPorId(int id) throws SQLException {
		Blog blog = null;

		String sql = "SELECT * FROM blog WHERE id= ? ";
		conectar();
		resulSet = sentencia.executeQuery(sql);

		if (resulSet.next()) {
			blog = new Blog(resulSet.getInt("id"), resulSet.getString("titulo"), resulSet.getString("descripcion"),
					resulSet.getBlob("imagen"));
		}
		resulSet.close();
		desconectar();

		return blog;
	}

	
	// eliminar
	public void eliminar(int id) throws SQLException {
		try {
			String sql = "DELETE FROM blog WHERE ID=?";
			conectar();
			sentencia = con.createStatement();
			sentencia.execute(sql);
			sentencia.close();
			desconectar();
		} catch (Exception e) {
			System.exit(0);
		}
	}
	
	// Modificar blog
	public void modificar(Blog blog) throws SQLException, IOException {
		String modImagen="";
		
		if(blog.getFoto() != null) {
			modImagen = ", imagen = ? ";
		}

		String sql = "UPDATE blog SET titulo = ? , descripcion = ?, youtube = ?"+ modImagen + " where id=" + blog.getId();
		conectar();
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, blog.getTitulo().trim());
		statement.setString(2, blog.getDescripcion().trim());
		statement.setString(3, blog.getYoutube().trim());
		
		if(modImagen != "") {
			statement.setBlob(4, blog.getFoto());
		}
					
		statement.executeUpdate();
		statement.close();
		desconectar();
	}

	public void conectar() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = ("jdbc:mysql://localhost:3306/rdy");
			con = DriverManager.getConnection(url, "root", "");
		} catch (ClassNotFoundException e) {
			throw new SQLException(e);
		}

	}

	public void desconectar() throws SQLException {
		con.close();
	}

}

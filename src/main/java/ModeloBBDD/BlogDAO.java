package ModeloBBDD;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.protocol.a.BinaryResultsetReader;

import java.awt.Image;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import Controlador.Conexion;
import Modelo.Blog;
import Modelo.Usuarios;

public class BlogDAO {

	private Connection con;
	private Statement sentencia = null;
	private ResultSet resulSet = null;

	public BlogDAO() {

	}

	// insertar blog
	public void insertar(Blog blog) throws SQLException {
		String sql = "INSERT INTO blog (id, titulo, descripcion, imagen) VALUES (" + blog.getTitulo() + ","
				+ blog.getDescripcion() + "," + blog.getImagen() + ")";
		System.out.println("Se va a insertar una entrada de blog");
		conectar();
		sentencia = con.createStatement();
		sentencia.execute(sql);
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

//			int id = resulSet.getInt("id");
//			String titulo = resulSet.getString("titulo");
//			String descripcion = resulSet.getString("descripcion");
//			Blob imageBlob = resulSet.getBina("imagen");
//
//			// recuperamos la imagen
//			Image imagenConvertida = null;
//			try {
//				imagenConvertida = javax.imageio.ImageIO.read(imageBlob.getBinaryStream());
//				Blog blogNew = new Blog(id, titulo, descripcion, imagenConvertida);
//				listaBlog.add(blogNew);
//
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}

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

	public void listarImg(int id, HttpServletResponse response) {

		String sql = "select * from blog where id = " + id;
		InputStream is = null;
		OutputStream os = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		response.setContentType("image/*");
		try {
			conectar();
			sentencia = con.createStatement();
			resulSet = sentencia.executeQuery(sql);

			if (resulSet.next()) {
				is = resulSet.getBinaryStream("imagen");
			}
			bis = new BufferedInputStream(is);
			bos = new BufferedOutputStream(os);
			int i = 0;
			while ((i = bis.read()) != -1) {
				bos.write(i);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

//	// actualizar
//	public boolean actualizar(Usuarios usuario) throws SQLException {
//		boolean rowActualizar = false;
//		String sql = "UPDATE usuarios SET usuario=?,clave=?,rol=?, memoria=? WHERE id=?";
//		conectar();
//		connection = con.getJdbcConnection();
//		PreparedStatement statement = connection.prepareStatement(sql);
//		statement.setString(1, usuario.getUsuario());
//		statement.setString(2, usuario.getClave());
//		statement.setString(3, usuario.getRol());
//		statement.setInt(4, usuario.getMemoria());
//		System.out.println(usuario.getUsuario());
//
//		rowActualizar = statement.executeUpdate() > 0;
//		statement.close();
//		desconectar();
//		return rowActualizar;
//	}
//
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
//
//	// consultar
//	public Usuarios consultar(String nombre, String clave) throws SQLException {
//		Usuarios usuario = null;
//
//		String sql = "SELECT * FROM usuarios WHERE usuario= ? AND clave=? ";
//		conectar();
//		connection = con.getJdbcConnection();
//		PreparedStatement statement = connection.prepareStatement(sql);
//		statement.setString(1, nombre);
//		statement.setString(2, clave);
//
//		ResultSet res = statement.executeQuery();
//		if (res.next()) {
//			usuario = new Usuarios(res.getInt("id"), res.getString("usuario"), res.getString("clave"),
//					res.getString("rol"), res.getInt("memoria"));
//		}
//		res.close();
//		desconectar();
//
//		return usuario;
//	}

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

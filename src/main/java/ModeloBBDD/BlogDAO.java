package ModeloBBDD;


import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.awt.Image;


import Controlador.Conexion;
import Modelo.Blog;
import Modelo.Usuarios;

public class BlogDAO {

	private Connection connection;
	private final Conexion con;

	public BlogDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) throws SQLException {
		System.out.println(jdbcURL);
		con = new Conexion(jdbcURL, jdbcUsername, jdbcPassword);
	}

	// insertar blog
	public boolean insertar(Blog blog) throws SQLException {
		String sql = "INSERT INTO blog (id, titulo, descripcion, imagen) VALUES (?, ?, ?, ?)";
		System.out.println("Se va a insertar una entrada de blog");
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, null);
		statement.setString(2, blog.getTitulo());
		statement.setString(3, blog.getDescripcion());
		statement.setBlob(4, blog.getImagen());

		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		con.desconectar();
		return rowInserted;
	}

	// listar todas las entradas de blog
	public List<Blog> listarBlog() throws SQLException {

		List<Blog> listaBlog = new ArrayList<Blog>();
		String sql = "SELECT * FROM blog";
		con.conectar();
		connection = con.getJdbcConnection();
		Statement statement = (Statement) connection.createStatement();
		ResultSet resulSet = ((java.sql.Statement) statement).executeQuery(sql);

		while (resulSet.next()) {
			int id = resulSet.getInt("id");
			String titulo = resulSet.getString("titulo");
			String descripcion = resulSet.getString("descripcion");
			Blob imageBlob = resulSet.getBlob("imagen");

			// recuperamos la imagen
			Image imagenConvertida = null;
			try {
				imagenConvertida = javax.imageio.ImageIO.read(imageBlob.getBinaryStream());
				Blog blogNew = new Blog(id, titulo, descripcion, imagenConvertida);
				listaBlog.add(blogNew);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		con.desconectar();
		return listaBlog;
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

	// eliminar
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

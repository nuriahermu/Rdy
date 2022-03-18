package Controlador;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;

import Modelo.ComentarioBlog;
import Modelo.ComentarioJuego;
import Modelo.Juego;
import Modelo.Usuarios;
import ModeloBBDD.ComentariosDAO;
import ModeloBBDD.JuegosDAO;
import ModeloBBDD.UsuariosDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "rdyController", urlPatterns = {"/rdyController"})
public class RdyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	UsuariosDAO usuariosDao;
	ComentariosDAO comentariosDao;
	JuegosDAO juegosDao;

	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
		try {

			usuariosDao = new UsuariosDAO(jdbcURL, jdbcUsername, jdbcPassword);
			comentariosDao = new ComentariosDAO(jdbcURL, jdbcUsername, jdbcPassword);
			juegosDao = new JuegosDAO(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RdyController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println(action);
		try {
			switch (action) {
			case "index":
				index(request, response);
				break;
			case "inicio":
				goToInicio(request, response);
				break;
			case "nuevo":
				nuevo(request, response);
				break;
			case "register":
				registrarUsuario(request, response);
				break;
			case "borrarBlog":
				borrarBlog(request, response);
				break;
			case "comentarioBlog":
				comentarioBlog(request, response);
				break;
			case "mostrarBlog":
				mostrarBlog(request, response);
				break;
			case "comentarioJuego":
				comentarioJuego(request, response);
				break;
			case "insertarJuego":
				insertarJuego(request, response);
				break;
			case "editarJuego":
				editarJuego(request, response);
				break;
			case "borrarJuego":
				eliminarJuego(request, response);
				break;
			case "showedit":
				showEditar(request, response);
				break;
			case "editar":
				editar(request, response);
				break;
			case "eliminar":
				eliminar(request, response);
				break;
			default:
				break;
			}
		} catch (SQLException e) {
			e.getStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void index(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		Usuarios usuarioEncontrado = usuariosDao.consultar(request.getParameter("usuario"),
				request.getParameter("clave"));
		if (usuarioEncontrado != null) {
			request.getSession().setAttribute("usuario", usuarioEncontrado);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/VISTAS/index.jsp");
			dispatcher.forward(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Usuario o clave incorrectos');");
			out.println("location='index.jsp';");
			out.println("</script>");
		}

	}
	private void goToInicio(HttpServletRequest request, HttpServletResponse response) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/VISTAS/index.jsp");
			try {
				dispatcher.forward(request, response);
			} catch (Exception e) {
				// Auto-generated catch block
				e.printStackTrace();
			} 
	}

	private void registrarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		Usuarios usuario = new Usuarios(0, request.getParameter("usuario"), request.getParameter("clave"),
				request.getParameter("rol"));
		usuariosDao.insertar(usuario);
		request.getSession().setAttribute("usuario", usuario);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/VISTAS/index.jsp");
		dispatcher.forward(request, response);
	}

	private void nuevo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/vista/register.jsp");
		dispatcher.forward(request, response);
	}
	
	private void borrarBlog(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		String id = request.getParameter("id");
		comentariosDao.eliminarNoticia(id);
				
		RequestDispatcher dispatcher = request.getRequestDispatcher("/VISTAS/noticias_servlet.jsp");
		dispatcher.forward(request, response);
	}

	private void comentarioBlog(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		ComentarioBlog comentario = new ComentarioBlog(0, request.getParameter("id_blog"), request.getParameter("nombre"), request.getParameter("mensaje"));
		comentariosDao.insertar(comentario);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/VISTAS/pagina-blog-servlet.jsp?id="+request.getParameter("id_blog"));
		dispatcher.forward(request, response);
	}
	
	private void comentarioJuego(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		ComentarioJuego comentario = new ComentarioJuego(0, request.getParameter("id_juego"), request.getParameter("nombre"), request.getParameter("mensaje"));
		comentariosDao.insertarComentarioJuego(comentario);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/VISTAS/pagina-juego-ver-servlet.jsp?id="+request.getParameter("id_juego"));
		dispatcher.forward(request, response);
	}
	
	private void insertarJuego(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		Juego juego = new Juego(null, request.getParameter("nombre"), request.getParameter("anio"), request.getParameter("plataforma_id"), request.getParameter("caracteristicas"), 
				request.getParameter("exclusivo"));
		
		Part part = request.getPart("foto_portada");
		InputStream is = part.getInputStream();
		
		juego.setFoto_portada2(is);	
		
		Part part2 = request.getPart("foto_juego1");
		InputStream is2 = part2.getInputStream();
		
		juego.setFoto_juego11(is2);	
		
		Part part3 = request.getPart("foto_juego2");
		InputStream is3 = part3.getInputStream();
		
		juego.setFoto_juego22(is3);
		
		juegosDao.insertarJuego(juego);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/VISTAS/juegos-servlet.jsp");
		dispatcher.forward(request, response);
	}
	
	private void editarJuego(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Juego juego = new Juego(request.getParameter("id"), request.getParameter("nombre"), request.getParameter("anio"), request.getParameter("plataforma_id"), request.getParameter("caracteristicas"), 
				request.getParameter("exclusivo"));
		juegosDao.modificar(juego);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/VISTAS/juegos-servlet.jsp");
		dispatcher.forward(request, response);
	}
	
	private void eliminarJuego(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String id = request.getParameter("id");
		juegosDao.eliminarJuego(id);		
				
		RequestDispatcher dispatcher = request.getRequestDispatcher("/VISTAS/juegos-servlet.jsp");
		dispatcher.forward(request, response);
	}

	
	private void mostrarBlog(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("VISTAS/noticias.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		Usuarios usuario = usuariosDao.obtenerPorId(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("usuario", usuario);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/vista/editar.jsp");
		dispatcher.forward(request, response);
	}

	private void editar(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		Usuarios usuario = new Usuarios(Integer.parseInt(request.getParameter("id")), request.getParameter("usuario"),
				request.getParameter("clave"), request.getParameter("rol"));
		usuariosDao.actualizar(usuario);
		index(request, response);
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		Usuarios usuario = usuariosDao.obtenerPorId(Integer.parseInt(request.getParameter("id")));
		usuariosDao.eliminar(usuario);
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);

	}
}

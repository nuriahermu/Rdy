package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.swing.JOptionPane;

import Modelo.ComentarioBlog;
import Modelo.Usuarios;
import ModeloBBDD.ComentariosDAO;
import ModeloBBDD.UsuariosDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletControlador", urlPatterns = {"/ServletControlador"})
public class RdyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	UsuariosDAO usuariosDao;
	ComentariosDAO comentariosDao;

	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
		try {

			usuariosDao = new UsuariosDAO(jdbcURL, jdbcUsername, jdbcPassword);
			comentariosDao = new ComentariosDAO(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RdyController() {
		super();
		// TODO Auto-generated constructor stub
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
			request.getSession().setAttribute("user", request.getParameter("usuario"));
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
				request.getParameter("rol"), Integer.parseInt(request.getParameter("memoria")));
		usuariosDao.insertar(usuario);
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
//		PrintWriter out = response.getWriter();
//		out.println("<script type=\"text/javascript\">");
//		out.println("alert('Usuario o clave incorrectos');");
//		out.println("location='noticias.jsp';");
//		out.println("</script>");
		
		JOptionPane.showConfirmDialog(null, "Realmente desea salir de Hola Swing?", "Confirmar salida", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher("/VISTAS/noticias.jsp");
		//dispatcher.forward(request, response);
	}

	private void comentarioBlog(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		//TODO
		ComentarioBlog comentario = new ComentarioBlog(0, request.getParameter("id_blog"), request.getParameter("nombre"), request.getParameter("mensaje"));
		comentariosDao.insertar(comentario);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/VISTAS/noticias.jsp");
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
				request.getParameter("clave"), request.getParameter("rol"),
				Integer.parseInt(request.getParameter("memoria")));
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

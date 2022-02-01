package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Modelo.Blog;
import Modelo.Usuarios;
import ModeloBBDD.BlogDAO;
import ModeloBBDD.UsuariosDAO;

//@WebServlet("/usuarios")
public class RdyControllerUsuarios extends HttpServlet {

	private static final long serialVersionUID = 1L;
	UsuariosDAO usuariosDao;
	BlogDAO blogDao;

	public void init() {
		System.out.println("Estoy en el init del servlet");
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
		try {

			usuariosDao = new UsuariosDAO(jdbcURL, jdbcUsername, jdbcPassword);
			blogDao = new BlogDAO(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RdyControllerUsuarios() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Hola Servlet..");
		String action = request.getParameter("action");
		System.out.println(action);
		try {
			switch (action) {
			case "index":
				index(request, response);
				break;
			case "nuevo":
				nuevo(request, response);
				break;
			case "register":
				registrar(request, response);
				break;
			case "mostrar":
				mostrar(request, response);
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
		System.out.println("Hola Servlet.. do post");
		doGet(request, response);
	}

	private void index(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		Usuarios usuarioEncontrado = usuariosDao.consultar(request.getParameter("usuario"),
				request.getParameter("clave"));
		if (usuarioEncontrado != null) {
			request.getSession().setAttribute("user", request.getParameter("usuario"));
			RequestDispatcher dispatcher = request.getRequestDispatcher("/PRINCIPAL/index.html");
			dispatcher.forward(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Usuario o clave incorrectos');");
			out.println("location='index.jsp';");
			out.println("</script>");
		}

	}

	private void registrar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		Usuarios usuario = new Usuarios(0, request.getParameter("usuario"), request.getParameter("clave"),
				request.getParameter("rol"), Integer.parseInt(request.getParameter("memoria")));
		usuariosDao.insertar(usuario);

		System.out.println(usuario);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/PRINCIPAL/index.html");
		dispatcher.forward(request, response);
	}

	private void nuevo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/vista/register.jsp");
		dispatcher.forward(request, response);
	}

	private void mostrar(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/vista/mostrar.jsp");
		List<Usuarios> listaUsuarioss = usuariosDao.listarUsuarios();
		request.setAttribute("lista", listaUsuarioss);
		dispatcher.forward(request, response);
	}
	
	private void mostrarBlog(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("ESTILOS/principal/categories.html");
		List<Blog> listaBlog = blogDao.listarBlog();
		request.setAttribute("lista", listaBlog);
		System.out.println(listaBlog);                                                        
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

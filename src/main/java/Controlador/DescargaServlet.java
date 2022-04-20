package Controlador;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelo.UsuariosJuegos;
import ModeloBBDD.UsuariosDAO;

@WebServlet(name = "descarga", urlPatterns = {"/descarga"})
public class DescargaServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	UsuariosDAO usuariosDao;
	
	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
		try {

			usuariosDao = new UsuariosDAO(jdbcURL, jdbcUsername, jdbcPassword);
			
		} catch (Exception e) {
			System.out.println("Error al realizar el init "+e);
			e.getStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			UsuariosJuegos uj = new UsuariosJuegos(1, request.getParameter("idUsuario"), request.getParameter("idJuego"));
			usuariosDao.insertarDescarga(uj);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

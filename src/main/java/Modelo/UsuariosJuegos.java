package Modelo;


public class UsuariosJuegos {

	private int id;
	private int id_usuario;
	private int id_juego;
	private String fecha;
	
	public UsuariosJuegos(int id, String id_usuario, String id_juego) {
		super();
		this.id = id;
		this.id_usuario = Integer.parseInt(id_usuario);
		this.id_juego = Integer.parseInt(id_juego);		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}

	public int getId_juego() {
		return id_juego;
	}

	public void setId_juego(int id_juego) {
		this.id_juego = id_juego;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	@Override
	public String toString() {
		return "UsuariosJuegos [id=" + id + ", id_usuario=" + id_usuario + ", id_juego=" + id_juego + ", fecha=" + fecha
				+ "]";
	}

}

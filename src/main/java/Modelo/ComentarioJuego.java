package Modelo;

public class ComentarioJuego {

	private int id;
	private String id_juego;
	private String nombre;
	private String mensaje;

	public ComentarioJuego(int id, String id_juego, String nombre, String mensaje) {
		super();
		this.id = id;
		this.id_juego = id_juego;
		this.nombre = nombre;
		this.mensaje = mensaje;
	}

	public ComentarioJuego() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getId_juego() {
		return id_juego;
	}

	public void setId_juego(String id_juego) {
		this.id_juego = id_juego;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	@Override
	public String toString() {
		return "ComentarioJuego [id=" + id + ", id_juego=" + id_juego + ", nombre=" + nombre + ", mensaje=" + mensaje
				+ "]";
	}

}

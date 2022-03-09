package Modelo;

public class ComentarioBlog {

	private int id;
	private String id_blog;
	private String nombre;
	private String mensaje;

	public ComentarioBlog(int id, String id_blog, String nombre, String mensaje) {
		super();
		this.id = id;
		this.id_blog = id_blog;
		this.nombre = nombre;
		this.mensaje = mensaje;
	}

	public ComentarioBlog() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getId_blog() {
		return id_blog;
	}

	public void setId_blog(String id_blog) {
		this.id_blog = id_blog;
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
		return "ComentarioBlog [id=" + id + ", id_blog=" + id_blog + ", nombre=" + nombre + ", mensaje=" + mensaje
				+ "]";
	}

}

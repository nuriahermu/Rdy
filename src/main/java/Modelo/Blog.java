package Modelo;

import java.io.InputStream;
import java.sql.Blob;

public class Blog {

	private int id;
	private String titulo;
	private String descripcion;
	private Blob imagen;
	private InputStream foto;
	private String youtube;

	public Blog() {
	}

	public Blog(int id2, String titulo2, String descripcion2, Blob imagen) {
		super();
		this.id = id2;
		this.titulo = titulo2;
		this.descripcion = descripcion2;
		this.imagen = imagen;
	}

	public Blog(int id2, String titulo2, String descripcion2, String youtube) {
		super();
		this.id = id2;
		this.titulo = titulo2;
		this.descripcion = descripcion2;
		this.youtube = youtube;
	}
	

	public Blog(int id) {
		this.id = id;
	}
	
	public Blog(String id2, String titulo2, String descripcion2, String youtube) {
		super();
		this.id = Integer.parseInt(id2);
		this.titulo = titulo2;
		this.descripcion = descripcion2;
		this.youtube = youtube;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Blob getImagen() {
		return imagen;
	}

	public void setImagen(Blob imagen) {
		this.imagen = imagen;
	}

	public InputStream getFoto() {
		return foto;
	}

	public void setFoto(InputStream foto) {
		this.foto = foto;
	}

	public String getYoutube() {
		return youtube;
	}

	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}

	@Override
	public String toString() {
		return "Blog [id=" + id + ", titulo=" + titulo + ", descripcion=" + descripcion + ", imagen=" + imagen
				+ ", youtube=" + youtube + "]";
	}

}

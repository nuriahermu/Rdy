package Modelo;

import java.awt.Image;
import java.sql.Blob;

public class Blog {

	private int id;
	private String titulo;
	private String descripcion;
	private Blob imagen;
	private Image imagenConvert;

	public Blog(int id2, String titulo2, String descripcion2, Image imagenConvertida) {
		// TODO Auto-generated constructor stub
		this.id = id2;
		this.titulo = titulo2;
		this.descripcion = descripcion2;
		this.imagenConvert = imagenConvertida;
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

	public Image getImagenConvert() {
		return imagenConvert;
	}

	public void setImagenConvert(Image imagenConvert) {
		this.imagenConvert = imagenConvert;
	}

	@Override
	public String toString() {
		return "Blog [id=" + id + ", titulo=" + titulo + ", descripcion=" + descripcion + ", imagen=" + imagen
				+ ", imagenConvert=" + imagenConvert + "]";
	}

}

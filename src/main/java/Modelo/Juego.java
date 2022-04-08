package Modelo;

import java.io.InputStream;
import java.sql.Blob;

public class Juego {
	
	private int id;
	private String nombre;
	private int anio;
	private int plataforma_id;
	private Blob foto_portada;
	private InputStream foto_portada2;
	private String caracteristicas;
	private Blob foto_juego1;
	private Blob foto_juego2;
	private InputStream foto_juego11;
	private InputStream foto_juego22;
	private int exclusivo;
	
	
	public Juego() {
	}
	
	public Juego(int id, String nombre, int anio, int plataforma_id, Blob foto_portada, String caracteristicas,
			Blob foto_juego1, Blob foto_juego2, int exclusivo) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.anio = anio;
		this.plataforma_id = plataforma_id;
		this.foto_portada = foto_portada;
		this.caracteristicas = caracteristicas;
		this.foto_juego1 = foto_juego1;
		this.foto_juego2 = foto_juego2;
		this.exclusivo = exclusivo;
	}
	
	public Juego(String id, String nombre, String anio, String plataforma_id, String caracteristicas, String exclusivo) {
		// TODO Auto-generated constructor stub
		super();
		this.id = Integer.parseInt(id);
		this.nombre = nombre;
		this.anio = Integer.parseInt(anio);
		this.plataforma_id = Integer.parseInt(plataforma_id);
		this.caracteristicas = caracteristicas;
		this.exclusivo = Integer.parseInt(exclusivo);
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getAnio() {
		return anio;
	}
	public void setAnio(int anio) {
		this.anio = anio;
	}
	public int getPlataforma_id() {
		return plataforma_id;
	}
	public void setPlataforma_id(int plataforma_id) {
		this.plataforma_id = plataforma_id;
	}
	public Blob getFoto_portada() {
		return foto_portada;
	}
	public void setFoto_portada(Blob foto_portada) {
		this.foto_portada = foto_portada;
	}
	public String getCaracteristicas() {
		return caracteristicas;
	}
	public void setCaracteristicas(String caracteristicas) {
		this.caracteristicas = caracteristicas;
	}
	public Blob getFoto_juego1() {
		return foto_juego1;
	}
	public void setFoto_juego1(Blob foto_juego1) {
		this.foto_juego1 = foto_juego1;
	}
	public Blob getFoto_juego2() {
		return foto_juego2;
	}
	public void setFoto_juego2(Blob foto_juego2) {
		this.foto_juego2 = foto_juego2;
	}
	public int getExclusivo() {
		return exclusivo;
	}
	public void setExclusivo(int exclusivo) {
		this.exclusivo = exclusivo;
	}
	
	public InputStream getFoto_portada2() {
		return foto_portada2;
	}

	public void setFoto_portada2(InputStream foto_portada2) {
		this.foto_portada2 = foto_portada2;
	}

	public InputStream getFoto_juego11() {
		return foto_juego11;
	}

	public void setFoto_juego11(InputStream foto_juego11) {
		this.foto_juego11 = foto_juego11;
	}

	public InputStream getFoto_juego22() {
		return foto_juego22;
	}

	public void setFoto_juego22(InputStream foto_juego22) {
		this.foto_juego22 = foto_juego22;
	}

	@Override
	public String toString() {
		return "Juego [id=" + id + ", nombre=" + nombre + ", anio=" + anio + ", plataforma_id=" + plataforma_id
				+ ", foto_portada=" + foto_portada + ", caracteristicas=" + caracteristicas + ", foto_juego1="
				+ foto_juego1 + ", foto_juego2=" + foto_juego2 + ", exclusivo=" + exclusivo + "]";
	}
	


}

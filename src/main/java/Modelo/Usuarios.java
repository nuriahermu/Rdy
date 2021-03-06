package Modelo;

public class Usuarios {
    
    private int id;
    private String usuario;
    private String clave;
    private String rol;
    
    //contructor por defecto
    public Usuarios(){
        
    }

    //constructor ampliado

    public Usuarios(int id, String usuario, String clave, String rol) {
        this.id = id;
        this.usuario = usuario;
        this.clave = clave;
        this.rol = rol;
    }
   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }


    @Override
    public String toString() {
        return "Usuario{" +
                "id=" + id + 
                ", usuario=" + usuario +
                ", clave=" + clave +
                ", rol=" + rol + 
                '}';
    }
    
}


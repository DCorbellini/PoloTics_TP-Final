package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class Empleado extends Persona implements Serializable {
    
    @Basic
    private String cargo;
    private Double sueldo;
    
    @OneToOne
    private Usuario user;

    public Empleado() {
        super();
    }

    public Empleado(String cargo, Double sueldo, Usuario user, int id, String nombre, String apellido, String direccion, String dni, Date fechaNac, String nacionalidad, String celular, String email) {
        super(id, nombre, apellido, direccion, dni, fechaNac, nacionalidad, celular, email);
        this.cargo = cargo;
        this.sueldo = sueldo;
        this.user = user;
    }

    public String getCargo() {
        return cargo;
    }

    public Double getSueldo() {
        return sueldo;
    }

    public Usuario getUser() {
        return user;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public void setSueldo(Double sueldo) {
        this.sueldo = sueldo;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }
    
}

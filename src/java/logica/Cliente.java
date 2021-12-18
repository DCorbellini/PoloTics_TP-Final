package logica;

import java.util.Date;
import javax.persistence.Entity;

@Entity
public class Cliente extends Persona{
    public Cliente() {
    }

    public Cliente(int id, String nombre, String apellido, String direccion, String dni, Date fechaNac, String nacionalidad, String celular, String email) {
        super(id, nombre, apellido, direccion, dni, fechaNac, nacionalidad, celular, email);
    }
}

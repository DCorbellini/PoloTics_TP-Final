package logica;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistencia.ControladoraPersistencia;

public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void crearEmpleado(String nombre, String apellido, String direccion, String dni, String fechaNac, String nacionalidad, String celular, String email, String cargo, String sueldo, String username, String pass) throws ParseException {
        
        SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
        
        Usuario user = new Usuario(0, username, pass);
        Empleado emp = new Empleado(cargo, Double.parseDouble(sueldo), user, 0, nombre, apellido, direccion, dni, parser.parse(fechaNac), nacionalidad, celular, email);
    
        controlPersis.crearEmpleado(emp, user);
    }
}

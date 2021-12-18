package logica;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import persistencia.ControladoraPersistencia;

public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void crearEmpleado(String nombre, String apellido, String direccion, String dni, String fechaNacStr, String nacionalidad, String celular, String email, String cargo, String sueldoStr, String username, String pass) throws Exception {
        
        SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNac;
        Double sueldo;
        
        // puse estas validaciones antes de descubrir que existia el atributo required
        // lo deje porque me parecio que no esta de más verificar en ambos lados
        if (nombre.isEmpty()) throw new Exception("Ingrese el nombre");
        if (apellido.isEmpty()) throw new Exception("Ingrese el apellido");
        if (direccion.isEmpty()) throw new Exception("Ingrese la direccion");
        if (dni.isEmpty()) throw new Exception("Ingrese el dni");
        if (fechaNacStr.isEmpty()) throw new Exception("Ingrese la fecha de nacimiento");
        if (nacionalidad.isEmpty()) throw new Exception("Ingrese la nacionalidad");
        if (celular.isEmpty()) throw new Exception("Ingrese el celular");
        if (email.isEmpty()) throw new Exception("Ingrese el email");
        if (cargo.isEmpty()) throw new Exception("Ingrese el cargo");
        if (sueldoStr.isEmpty()) throw new Exception("Ingrese el sueldo");
        if (username.isEmpty()) throw new Exception("Ingrese el nombre de usuario");
        if (pass.isEmpty()) throw new Exception("Ingrese la contraseña");
        
        // teoricamente esto nunca va a fallar, pero...
        try {
            fechaNac = parser.parse(fechaNacStr);
        } catch (ParseException ex) {
            throw new Exception("La fecha ingresada es invalida, por favor use el formato aaaa-mm-dd");
        }
        try {
            sueldo = Double.parseDouble(sueldoStr);
        } catch (NumberFormatException ex) {
            throw new Exception("El sueldo ingresado no es valido");
        }
        
        Usuario user = new Usuario(username, pass);
        Empleado emp = new Empleado(cargo, sueldo, user, 0, nombre, apellido, direccion, dni, fechaNac, nacionalidad, celular, email);
    
        try {
            controlPersis.crearEmpleado(emp);
        } catch (Exception e) {
            throw new Exception("Nombre de usuario ya esta en uso");
        }
    }
}

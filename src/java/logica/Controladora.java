package logica;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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

    public List<Empleado> traerEmpleados() {
        return controlPersis.traerEmpleados();
    }

    public void eliminarEmpleado(int id) {
        controlPersis.eliminarEmpleado(id);
    }

    public Empleado traerEmpleado(int id) {
        return controlPersis.traerEmpleado(id);
    }

    public void editarEmpleado(Empleado emp) throws Exception { 
        
    
        try {
            controlPersis.editarEmpleado(emp);
        } catch (Exception e) {
            throw new Exception("Nombre de usuario ya esta en uso");
        }
    
    }

    public List<Cliente> traerClientes() {
        return controlPersis.traerClientes();
    }

    public void crearCliente(String nombre, String apellido, String direccion, String dni, String fechaNacStr, String nacionalidad, String celular, String email) throws Exception {

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
        
        // teoricamente esto nunca va a fallar, pero...
        try {
            fechaNac = parser.parse(fechaNacStr);
        } catch (ParseException ex) {
            throw new Exception("La fecha ingresada es invalida, por favor use el formato aaaa-mm-dd");
        }
        
        Cliente cli = new Cliente(0, nombre, apellido, direccion, dni, fechaNac, nacionalidad, celular, email);
    
        controlPersis.crearCliente(cli);
    }

    public void editarCliente(Cliente cli) throws Exception {
        controlPersis.editarCliente(cli);
    }

    public Cliente traerCliente(int id) {
        return controlPersis.traerCliente(id);
    }

    public Empleado traerEmpleado(String user, String pass) {
        
        List<Empleado> empleados = controlPersis.traerEmpleados();
        
        if (!empleados.isEmpty())
        {
            for (Empleado emp : empleados) {
                if (user.equals(emp.getUser().getUser()) && pass.equals(emp.getUser().getPass())) {
                    return emp;
                }
            }
        }
        
        /* TODO 
         *  
         * Si no hay usuario tendrias que dejarlo pasar para que cree un usuario
         * Podes hacer un empleado con id invalida
         * 
         */
        
        return null;
        
    }

    public List<Servicio> traerServicios() {
        return controlPersis.traerServicios();
    }

    public void crearServicio(String nombre, String descripcion, String destino, String fechaStr, String precioStr, String tipo) throws Exception {
        
        SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha;
        Double precio = Double.parseDouble(precioStr);
        
        // puse estas validaciones antes de descubrir que existia el atributo required
        // lo deje porque me parecio que no esta de más verificar en ambos lados
        if (nombre.isEmpty()) throw new Exception("Ingrese el nombre");
        if (descripcion.isEmpty()) throw new Exception("Ingrese la descripcion");
        if (destino.isEmpty()) throw new Exception("Ingrese el destino");
        if (fechaStr.isEmpty()) throw new Exception("Ingrese la fecha");
        if (precioStr.isEmpty()) throw new Exception("Ingrese el precio");
        if (tipo.isEmpty()) throw new Exception("Ingrese el tipo");
        
        // teoricamente esto nunca va a fallar, pero...
        try {
            fecha = parser.parse(fechaStr);
        } catch (ParseException ex) {
            throw new Exception("La fecha ingresada es invalida, por favor use el formato aaaa-mm-dd");
        }
        
        Servicio ser = new Servicio(0, nombre, descripcion, destino, precio, tipo, fecha);
    
        controlPersis.crearServicio(ser);
        
    }

    public Servicio traerServicio(int id) {
        return controlPersis.traerServicio(id);
    }

    public void editarServicio(Servicio ser) throws Exception {
        controlPersis.editarServicio(ser);
    }

    public void eliminarCliente(int id) {
        controlPersis.eliminarCliente(id);
    }

    public void eliminarServicio(int id) {
        controlPersis.eliminarServicio(id);
    }

    public List<Paquete> traerPaquetes() {
        return controlPersis.traerPaquetes();
    }
}

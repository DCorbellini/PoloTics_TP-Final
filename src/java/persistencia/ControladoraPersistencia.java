package persistencia;

import logica.Empleado;
import logica.Usuario;

public class ControladoraPersistencia {
    
    EmpleadoJpaController empJPA = new EmpleadoJpaController();
    UsuarioJpaController userJPA = new UsuarioJpaController();
    ClienteJpaController perJPA = new ClienteJpaController();

    public void crearEmpleado(Empleado emp) throws Exception {
        userJPA.create(emp.getUser());
        empJPA.create(emp);
    }
    
}

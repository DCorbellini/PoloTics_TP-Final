package persistencia;

import logica.Empleado;
import logica.Usuario;

public class ControladoraPersistencia {
    
    EmpleadoJpaController empJPA = new EmpleadoJpaController();
    UsuarioJpaController userJPA = new UsuarioJpaController();
    PersonaJpaController perJPA = new PersonaJpaController();

    public void crearEmpleado(Empleado emp) {                
        userJPA.create(emp.getUser());
        empJPA.create(emp);
    }
    
}

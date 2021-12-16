package persistencia;

import logica.Empleado;
import logica.Usuario;

public class ControladoraPersistencia {
    
    EmpleadoJpaController empJPA = new EmpleadoJpaController();
    UsuarioJpaController userJPA = new UsuarioJpaController();
    PersonaJpaController perJPA = new PersonaJpaController();

    public void crearEmpleado(Empleado emp, Usuario user) {                
        userJPA.create(user);
        empJPA.create(emp);
    }
    
}

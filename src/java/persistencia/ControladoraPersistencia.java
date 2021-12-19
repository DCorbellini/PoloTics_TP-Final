package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Empleado;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
    
    EmpleadoJpaController empJPA = new EmpleadoJpaController();
    UsuarioJpaController userJPA = new UsuarioJpaController();
    ClienteJpaController perJPA = new ClienteJpaController();

    public void crearEmpleado(Empleado emp) throws Exception {
        userJPA.create(emp.getUser());
        empJPA.create(emp);
    }

    public List<Empleado> traerEmpleados() {
        return empJPA.findEmpleadoEntities();
    }

    public void eliminarEmpleado(int id) {
        try {
            userJPA.destroy(empJPA.findEmpleado(id).getUser().getUser());
            empJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

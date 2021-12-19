package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Cliente;
import logica.Empleado;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
    
    EmpleadoJpaController empJPA = new EmpleadoJpaController();
    UsuarioJpaController userJPA = new UsuarioJpaController();
    ClienteJpaController cliJPA = new ClienteJpaController();

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

    public Empleado traerEmpleado(int id) {
        return empJPA.findEmpleado(id);
    }

    public void editarEmpleado(Empleado emp) throws Exception {
        // user es la primary key de el usuario, entonces no puedo editarla
        // por eso me fijo si se esta intentando cambiar el nombre de usuario
        // si es asi intento crear el nuevo usuario
        // si ese nombre no esta en uso elimino el usuario anterior y guardo el nuevo empleado
        // si ya esta en uso se levanta una excepcion
        // si no se cambia el nombre de usuario edito el usuario de forma normal
        
        // el usuario anterior es distinto al nuevo usuario?
        if (empJPA.findEmpleado(emp.getId()).getUser().getUser() != emp.getUser().getUser()) {
            
            // crear nuevo usuario
            // si create falla la excepcion se delega a la controladora
            userJPA.create(emp.getUser());
            
            // eliminar usuario anterior
            userJPA.destroy(empJPA.findEmpleado(emp.getId()).getUser().getUser());
            
        }
        else {
            
            // edutar usuario
            // no hace falta ninguna verificacion especial
            userJPA.edit(emp.getUser());
            
        }
        
        empJPA.edit(emp);
    }

    public List<Cliente> traerClientes() {
        return cliJPA.findClienteEntities();
    }

    public void crearCliente(Cliente cli) {
        cliJPA.create(cli);
    }

    public Cliente traerCliente(int id) {
        return cliJPA.findCliente(id);
    }

    public void editarCliente(Cliente cli) throws Exception {
        cliJPA.edit(cli);
    }
    
}

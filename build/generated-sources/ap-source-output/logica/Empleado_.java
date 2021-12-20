package logica;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Usuario;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-12-20T03:33:19")
@StaticMetamodel(Empleado.class)
public class Empleado_ extends Persona_ {

    public static volatile SingularAttribute<Empleado, Double> sueldo;
    public static volatile SingularAttribute<Empleado, String> cargo;
    public static volatile SingularAttribute<Empleado, Usuario> user;

}
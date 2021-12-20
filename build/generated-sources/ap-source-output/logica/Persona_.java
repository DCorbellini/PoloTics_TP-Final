package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-12-20T03:33:19")
@StaticMetamodel(Persona.class)
public abstract class Persona_ { 

    public static volatile SingularAttribute<Persona, Date> fechaNac;
    public static volatile SingularAttribute<Persona, String> apellido;
    public static volatile SingularAttribute<Persona, String> direccion;
    public static volatile SingularAttribute<Persona, String> celular;
    public static volatile SingularAttribute<Persona, Integer> id;
    public static volatile SingularAttribute<Persona, Boolean> habilitado;
    public static volatile SingularAttribute<Persona, String> nombre;
    public static volatile SingularAttribute<Persona, String> dni;
    public static volatile SingularAttribute<Persona, String> email;
    public static volatile SingularAttribute<Persona, String> nacionalidad;

}
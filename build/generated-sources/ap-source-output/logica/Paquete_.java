package logica;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Servicio;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-12-20T03:33:19")
@StaticMetamodel(Paquete.class)
public class Paquete_ { 

    public static volatile ListAttribute<Paquete, Servicio> servicios;
    public static volatile SingularAttribute<Paquete, Double> precio;
    public static volatile SingularAttribute<Paquete, Integer> id;
    public static volatile SingularAttribute<Paquete, Boolean> habilitado;

}
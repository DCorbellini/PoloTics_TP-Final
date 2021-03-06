package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Transient;
import org.eclipse.persistence.annotations.AdditionalCriteria;

@Entity
@AdditionalCriteria("this.habilitado <> false")
public class Paquete implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Basic
    private Double precio;
    private Boolean habilitado = true;
    @ManyToMany
    @JoinTable(name = "paquete_servicio", joinColumns = @JoinColumn(name = "id_paquete"), inverseJoinColumns = @JoinColumn(name = "id_servicio"))
    private List<Servicio> servicios;
    
    // descuento del 10% que comparten todos los paquetes y no es guardado en la db
    @Transient
    private final static Double descuento = 0.1;

    public Paquete() {
    }

    public Paquete(int id, List<Servicio> servicios) {
        this.id = id;
        this.servicios = servicios;
        
        this.precio = 0.0;
        for (Servicio serv : servicios) {
            // Sum(precios)*10% === Sum(precios*10%)
            // precio*100% - precio*10% === precio * (100%-10%)
            this.precio += (serv.getPrecio() * (1.0-descuento));
        }
    }

    public int getId() {
        return id;
    }

    public Double getPrecio() {
        return precio;
    }

    public List<Servicio> getServicios() {
        return servicios;
    }

    public static Double getDescuento() {
        return descuento;
    }

    public Boolean getHabilitado() {
        return habilitado;
    }
    
    
    public void setHabilitado(Boolean habilitado) {
        this.habilitado = habilitado;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setServicios(List<Servicio> servicios) {
        this.servicios = servicios;
    }
    
}

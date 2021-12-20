package logica;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import org.eclipse.persistence.annotations.AdditionalCriteria;

@Entity
@AdditionalCriteria("this.habilitado <> false")
public class Servicio implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Basic
    private String nombre;
    private String descripcion;
    private String destino;
    private Double precio;
    private String tipo;
    private Boolean habilitado = true;
    @Temporal(TemporalType.DATE)
    private Date fecha;

    // lista de tipos disponibles
    @Transient
    private final static List<String> tipos = Arrays.asList(
            "Hotel por noche/s",
            "Alquiler de auto",
            "Pasajes de colectivo",
            "Pasajes de avión",
            "Pasajes de tren",
            "Excursiones",
            "Entradas a Eventos"
            );

    ;

    public Servicio() {
    }

    public Servicio(int id, String nombre, String descripcion, String destino, Double precio, String tipo, Date fecha) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.destino = destino;
        this.precio = precio;
        this.tipo = tipo;
        this.fecha = fecha;
    }

    public static List<String> getTipos() {
        return tipos;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getDestino() {
        return destino;
    }

    public Double getPrecio() {
        return precio;
    }

    public String getTipo() {
        return tipo;
    }

    public Date getFecha() {
        return fecha;
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

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

}

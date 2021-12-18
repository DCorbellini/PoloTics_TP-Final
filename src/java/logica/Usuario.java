package logica;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Usuario implements Serializable {
    
    
    @Id
    private String user;
    @Basic
    private String pass;

    public Usuario() {
    }

    public Usuario(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }
    
    public String getUser() {
        return user;
    }

    public String getPass() {
        return pass;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
}

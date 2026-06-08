/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Educación
 */
public class Zona {
    private String localidad;
    private String partido;
    private String provincia;

    
    public Zona(String localidad, String partido, String provincia) {
        this.localidad = localidad;
        this.partido = partido;
        this.provincia = provincia;
    }

    
    public String getLocalidad() {
        return localidad;
    }

    private void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getPartido() {
        return partido;
    }

    private void setPartido(String partido) {
        this.partido = partido;
    }

    public String getProvincia() {
        return provincia;
    }

    private void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    
    @Override
    public String toString() {
        return "Zona{" + "localidad: " + localidad + ", partido: " + partido + ", provincia: " + provincia + "} \n";
    }
    
    
    
}

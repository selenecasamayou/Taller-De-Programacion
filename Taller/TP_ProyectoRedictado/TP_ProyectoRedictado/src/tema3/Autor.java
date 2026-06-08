/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Educación
 */
public class Autor {
    private String nombre;
    private String biografia;
    private String origen;
    
    
    public Autor (String unNombre, String unaBiografia, String unOrigen) {
        nombre = unNombre;
        biografia = unaBiografia;
        origen = unOrigen;
    }
    
    
    public String getNombre () {
        return nombre;
    }
    
    private void setNombre (String nombre) {
        this.nombre = nombre;
    }
    
    public String getBiografia () {
        return biografia;
    }
    
    private void setBiografia (String biografia) {
        this.biografia = biografia;
    }
    
    public String getOrigen () {
        return origen;
    }
    
    private void setOrigen (String origen) {
        this.origen = origen;
    }
    
    
    public String toString () {
        return ("nombre: " + this.nombre + " biografia: " + this.biografia + " origen: " + this.origen);
    }
    
}

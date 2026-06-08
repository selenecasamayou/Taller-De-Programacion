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
public class Trabajador extends Persona{
    private String tarea;
    
    
    public Trabajador (String unaTarea, String unNombre, int unDNI, int unaEdad) {
        super(unNombre, unDNI, unaEdad);
        setTarea(unaTarea);
    }

    
    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }
    
    
    public String toString () {
        return (super.toString() + ". Soy " + this.tarea);
    }
    
    
}

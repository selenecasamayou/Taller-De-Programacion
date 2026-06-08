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

    public Trabajador(String tarea, String unNombre, int unDni, int unaEdad) {
        super(unNombre, unDni, unaEdad);
        this.tarea = tarea;
    }
    
    
    public String getTarea () {
        return tarea;
    }
    
    public void setTarea (String unaTarea) {
        tarea = unaTarea;
    }
    
    public String toString () {
        return (super.toString()+ ". Soy " + this.getTarea());  // revisar
    }
}

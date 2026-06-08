/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repaso;

/**
 *
 * @author Educación
 */
public abstract class Coro {
    private String nombre;
    private Director direcc;
    
    
    public Coro (String unNombre, Director unDirecc) {
        nombre = unNombre;
        direcc = unDirecc;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getDirecc() {
        return direcc;
    }

    public void setDirecc(Director direcc) {
        this.direcc = direcc;
    }
    
    
    public abstract boolean verCoro ();  // PUNTO B.II
    
    public abstract boolean formacionCoro (); // esta bien, solo si hacen lo mismo o si les llega lo mismo

    @Override
    public String toString() {  // PUNTO B.IV
        return "Coro{" + "nombre=" + nombre + direcc.toString() + '}';
    }
    
    
}

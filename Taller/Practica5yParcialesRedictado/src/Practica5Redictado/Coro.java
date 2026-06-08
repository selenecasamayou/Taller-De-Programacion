/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5Redictado;

/**
 *
 * @author Educación
 */
public abstract class Coro {
    private String nombre;
    private Director direc;  // tendria que hacer una clase abstracta persona y sus hijos son direc y corista
    private int cantCoristas;
    
    
    public Coro (String unNombre, Director D, int dimCoristas) {
        nombre = unNombre;
        direc = D;
        cantCoristas = dimCoristas;
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getDirec() {
        return direc;
    }

    private void setDirec(Director direc) {
        this.direc = direc;
    }

    public int getCantCoristas() {
        return cantCoristas;
    }
    
    
    public abstract boolean verCoristas ();  // PUNTO B.II
    
    public abstract boolean coroOrdenado();  // PUNTO B.III

    @Override
    public String toString() {   // PUNTO B.IV
        return "Coro: " + nombre + " direc: " + direc + "\n";
    }
    
    
    
    
}

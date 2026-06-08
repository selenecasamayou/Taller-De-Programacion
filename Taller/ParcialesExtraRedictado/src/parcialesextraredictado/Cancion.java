/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialesextraredictado;

/**
 *
 * @author Educación
 */
public class Cancion {
    private String nombre;
    private String compositor;
    private int identificador;
    private Estudiante estGanador;
    private double puntaje;

    
    public Cancion(String nombre, String compositor, int identificador, Estudiante E) {
        this.nombre = nombre;
        this.compositor = compositor;
        this.identificador = identificador;
        estGanador = E;
        puntaje = 0;
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCompositor() {
        return compositor;
    }

    private void setCompositor(String compositor) {
        this.compositor = compositor;
    }

    public int getIdentificador() {
        return identificador;
    }

    private void setIdentificador(int identificador) {
        this.identificador = identificador;
    }

    public Estudiante getEstGanador() {
        return estGanador;
    }

    private void setEstGanador(Estudiante estGanador) {
        this.estGanador = estGanador;
    }

    public double getPuntaje() {
        return puntaje;
    }

    private void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }
    
    
    public void puntajeMayor (Estudiante E, double puntaje) {
        if (puntaje > this.puntaje) {  // actualizo estudiante ganador
            this.setEstGanador(E);
        }
    }
    
    
    
}

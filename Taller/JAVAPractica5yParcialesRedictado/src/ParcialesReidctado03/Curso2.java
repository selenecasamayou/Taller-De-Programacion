/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesReidctado03;

/**
 *
 * @author Educación
 */
public class Curso2 {
    private String descripcion;
    private Turno Online;
    private Turno Prensencial;
    
    
    public Curso2 (String descripcion, Turno online, Turno prensencial) {
        this.descripcion = descripcion;
        this.Online = online;
        this.Prensencial = prensencial;
    }

    
    public String getDescripcion() {
        return descripcion;
    }

    private void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Turno getOnline() {
        return Online;
    }

    private void setOnline(Turno online) {
        this.Online = online;
    }

    public Turno getPrensencial() {
        return Prensencial;
    }

    private void setPrensencial(Turno prensencial) {
        this.Prensencial = prensencial;
    }
    
    
    public double gananciaMensual () {  // PUNTO 2.B
        return (this.Online.obtenerGanancia() + this.Prensencial.obtenerGanancia());
    }
    
    public String toString () {  // PUNTO 2.C
        return ("Curso: " + this.descripcion + ", Ganancia Neta: " + this.gananciaMensual() + "\n" + 
                "Turno Online: " + this.Online.toStting() + "\n Turno Presencial: " + this.Prensencial.toStting());
    }
    
    public boolean isRentable () {  // PUNTO 2.D
        boolean rentable = false;
        if (this.gananciaMensual() > 800000) {
            rentable = true;
        }
        return rentable;
    }
    
    
}

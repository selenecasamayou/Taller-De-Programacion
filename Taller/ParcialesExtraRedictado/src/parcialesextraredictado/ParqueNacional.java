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
public class ParqueNacional extends Parque{
    private int cantAreas;
    private Guardaparques guard;
    
    
    public ParqueNacional (int cantAreas, Guardaparques G, String nombre, String provincia, int cantEspecies) {
        super(nombre, provincia, cantEspecies);
        this.cantAreas = cantAreas;
        this.guard = G;
    }

    
    public int getCantAreas() {
        return cantAreas;
    }

    private void setCantAreas(int cantAreas) {
        this.cantAreas = cantAreas;
    }

    public Guardaparques getGuard() {
        return guard;
    }

    private void setGuard(Guardaparques guard) {
        this.guard = guard;
    }
    
    public void agregarEspecie (Especie E) {
        if (E.getCantEj() > 50) {
             super.agregarEspecie(E);
        }
    }
    
    public String toString () {
        return (super.toString() + "Cant Areas: " + this.cantAreas + this.guard.toString()); 
    }
    
    
}

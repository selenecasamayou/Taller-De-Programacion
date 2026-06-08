/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5;

/**
 *
 * @author Educación
 */
public class Investigador{
    private String nombre;
    private int categoria;
    private String especialidad;
    private int DF;
    private int DL;
    private Subsidio [] vecSub;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.DF = 5;
        this.DL = 0;
        this.vecSub = new Subsidio[DF];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    
    public void agregarSubsidio (Subsidio S) {  // PUNTO II.B
        this.vecSub [DL] = S;
        DL++;
    }
    
    public double recorrerVecInv () {  // recorro subsidios de 1 investigador
        double cantInv = 0;
        for (int i=0; i<DL; i++) {
            cantInv += this.vecSub[i].getMontoPedido();
        }
        return cantInv;
    }
    
    public double subOtorgado () {  // solo guarda los montos de los que estan otorgados
        double cantInvOtor = 0;
        for (int i=0; i<DL; i++) {
            if (this.vecSub[i].isOtorgado()) {
                cantInvOtor += this.vecSub[i].getMontoPedido();
            }
        }
        return cantInvOtor;
    }
    
    public void cambiarAOtorgado () {  // recorro vec de subsidios y me cambio los no otorgados
        for (int i=0; i<DL; i++) {
            if (!(vecSub[i].isOtorgado())) 
                vecSub[i].setOtorgado(true);
        }
    }

    @Override
    public String toString() {
        return "Investigador{" + "nombre=" + nombre + ", categoria=" + categoria + ", especialidad=" + especialidad + 
                this.subOtorgado() + '}';
    }
    
    
}

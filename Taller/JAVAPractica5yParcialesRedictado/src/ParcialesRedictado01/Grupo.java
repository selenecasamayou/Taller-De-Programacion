/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado01;

/**
 *
 * @author Educación
 */
public abstract class Grupo {
    private String nombre;
    private double sueldoInst;
    private double costo;
    private int cantChicos;
    private int DL;
    private Chico [] vector;
    
    
    public Grupo (String unNombre, double unSueldoInst, double unCosto, int cantChicos) {
        nombre = unNombre;
        sueldoInst = unSueldoInst;
        costo = unCosto;
        this.cantChicos = cantChicos;
        DL = 0;
        vector = new Chico [cantChicos];
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoInst() {
        return sueldoInst;
    }

    private void setSueldoInst(double sueldoInst) {
        this.sueldoInst = sueldoInst;
    }

    public double getCosto() {
        return costo;
    }

    private void setCosto(double costo) {
        this.costo = costo;
    }

    public int getCantChicos() {
        return cantChicos;
    }

    public int getCantChicosActual() {
        return DL;
    }
    
    
    public boolean agregarChico (Chico C) {  // PUNTO 2.A
        boolean entro = false;
        if (DL < this.cantChicos){
            this.vector[DL] = C;
            DL++;
            entro = true;
        }    
        return entro;
    } 
    
    public double gananciaNeta () {  // PUNTO 2.B
        double costo = 0;
        costo = (this.costo * this.DL) - this.sueldoInst;
        return costo;
    }
    
    public String toString () {  // PUNTO 2.C
        String aux = "Nombre Inst: " + this.nombre + ", cant chicos " + this.cantChicos + "\n";
        for (int i=0; i<DL; i++) {
            aux += vector[i].toString() + "\n";
        }
        return aux += "Ganancia neta: " + this.gananciaNeta();
    }
    
    public boolean isRentable () {  // PUNTO 2.D
        if (this.gananciaNeta() > 5000000) {
            return true;
        }
        else
            return false;
    }
    
    
}

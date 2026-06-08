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
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirec;
    private int DF;
    private int DL;  // cantInvestigadores
    private Investigador [] vecInvestigadores;
    
    
    public Proyecto (String unNombre, int unCod, String unNombreDirec) {
        nombre = unNombre;
        codigo = unCod;
        nombreDirec = unNombreDirec;
        DF = 50;
        DL = 0;
        vecInvestigadores = new Investigador [DF];
    }
    

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    private void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirec() {
        return nombreDirec;
    }

    private void setNombreDirec(String nombreDirec) {
        this.nombreDirec = nombreDirec;
    }

    public int getCantInvestigadores() {
        return DF;
    }

    public int getCantInvestigadoresActual() {
        return DL;
    }
    
    
    public void agregarInvestigador(Investigador I) {  // PUNTO 2.A
        if (DL < DF) {
            this.vecInvestigadores[DL] = I;
            DL++;
        }
    }
    
    public double dineroTotalOtorgado () {  // PUNTO 2.C
        double monTotal = 0;
        for (int i=0; i<DL; i++) {
            monTotal += this.vecInvestigadores[i].montoInvestigador();
        }
        return monTotal;
    }
    
    public void otorgarTodos (String nombreInv) {  // PUNTO 2.D
        int i=0;
        while ((i < DL) && (!(this.vecInvestigadores[i].getNombre().equals(nombre)))) {
            i++;
        }
        if (i < DL) {  // lo encontre
            this.vecInvestigadores[i].otorgarSubsidios();
        }
    }
    
    public String toString () {
        String aux = "Proyecto: " + this.nombre + " , " + this.codigo + " director: " + this.nombreDirec
                      + ", total dinero otorgado: " + this.dineroTotalOtorgado() + " /n";
        for (int i=0; i<DL; i++) {
            aux += this.vecInvestigadores[i].toString();
        }
        return aux;
    }
    
    
}

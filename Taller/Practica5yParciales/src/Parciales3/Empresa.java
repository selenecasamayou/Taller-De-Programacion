/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales3;

/**
 *
 * @author Educación
 */
public class Empresa {
    private String nombreEmpresa;
    private ProgramadorLider PL;
    private Programador [] vecProgramador;
    private int programadoresN;
    
    
    public Empresa (String unNombreEmpresa, ProgramadorLider unPL, int cantProgramadores) {
        nombreEmpresa = unNombreEmpresa;
        PL = unPL;
        programadoresN = cantProgramadores;
        vecProgramador = new Programador [programadoresN];
        for (int i=0; i<this.programadoresN; i++) {  // inicializo el vector
            vecProgramador[i] = null;
        }
    }
    

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    private void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public ProgramadorLider getProgramadorLider() {
        return PL;
    }

    private void setPL(ProgramadorLider PL) {
        this.PL = PL;
    }

    public int getCantidadProgramadores() {
        return programadoresN;
    }
    
    
    public void asignarProgramador (Programador P, int puestoX) {  // PUNTO 2.A
        vecProgramador[puestoX-1] = P;
    } 
    
    public double montoTotalSueldos () {  // PUNTO 2.B
        double aux = 0;
        for (int i=0; i<this.programadoresN; i++) {
            if (vecProgramador[i] != null) {
                aux += vecProgramador[i].sueldoFinal();
            }
        }
        return aux += PL.sueldoFinal();
    }
    
    public void aumentarSueldos (double monto) {  // PUNTO 2.C
        for (int i=0; i<this.programadoresN; i++) {
            if (vecProgramador[i] != null) {
                vecProgramador[i].aumentarSueldoProgramador(monto);
            }
        }
        PL.aumentarSueldoProgramador(monto);
    }
    
    public String toString () {  // PUNTO 2.D
        String aux = ("Empresa:" + this.nombreEmpresa + "\n" + " Programador Lider: " + PL.toString());
        for (int i=0; i<this.programadoresN; i++) {
            aux += ( "Programador asignado al puesto " + i++ + ": ");  // incremento en uno la posicion para que no se imprima la posicion 0 y se imprima la "correcta" 1
            if (vecProgramador[i] != null) {
                aux += vecProgramador[i].toString();
            }
            else
                aux += "sin asignar";
        }
        return aux;
    }
    
}

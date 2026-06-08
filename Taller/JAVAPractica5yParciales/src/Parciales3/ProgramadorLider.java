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
public class ProgramadorLider extends Programador{
    private int antiguedad;
    private int cantProyectos;

    
    public ProgramadorLider(int antiguedad, int cantProyectos, String nombre, int dni, double sueldoBasico, int lineasXHora, String lenguaje) {
        super(nombre, dni, sueldoBasico, lineasXHora, lenguaje);
        this.antiguedad = antiguedad;
        this.cantProyectos = cantProyectos;
    }

    
    public int getAntiguedad() {
        return antiguedad;
    }

    private void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public int getCantProyectos() {
        return cantProyectos;
    }

    private void setCantProyectos(int cantProyectos) {
        this.cantProyectos = cantProyectos;
    }
    
    
    public double sueldoFinal () {
        return (super.sueldoFinal() + (this.antiguedad * 10000) + (this.cantProyectos * 20000));
    }
    
    
    
}

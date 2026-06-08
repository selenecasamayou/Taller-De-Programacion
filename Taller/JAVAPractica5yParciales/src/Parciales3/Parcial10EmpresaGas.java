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
public class Parcial10EmpresaGas {
    
    
    public static void main (String [] args) {
        
        Empresa2 E = new Empresa2 ("Pepito", 7);
        
        Zona Z = new Zona ("denominacion1", 3);
        E.agregarZona(Z);
        
        Medicion M = new Medicion (4, 5678, 45, true);
        Z.agregarMedicion(2, M);
        M = new Medicion (7, 3521, 121, false);
        Z.agregarMedicion(3, M);
        M = new Medicion (9, 8096, 98, true);
        Z.agregarMedicion(1, M);
        
        Z = new Zona ("denominacion2", 1);
        E.agregarZona(Z);
        
        M = new Medicion (9, 5567, 100, false);
        Z.agregarMedicion(1, M);
        
        Z = new Zona ("denominacion3", 4);
        E.agregarZona(Z);
        
        M = new Medicion (2, 1134, 200, true);
        Z.agregarMedicion(3, M);
        M = new Medicion (1, 1111, 23, true);
        Z.agregarMedicion(2, M);
        M = new Medicion (6, 6767, 11, true);
        Z.agregarMedicion(1, M);
        M = new Medicion (8, 9999, 128, true);
        Z.agregarMedicion(4, M);
        
        System.out.println(E.obtenerZonaMax());
        System.out.println(E.toString());
    }
}

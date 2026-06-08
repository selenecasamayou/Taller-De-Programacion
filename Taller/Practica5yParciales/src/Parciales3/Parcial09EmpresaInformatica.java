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
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;


public class Parcial09EmpresaInformatica {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        String nombreEmpresa = GeneradorAleatorio.generarString(12);
        int cantProgramadores = 20;
        
        int antiguedad = GeneradorAleatorio.generarInt(30);
        int cantProyectos = GeneradorAleatorio.generarInt(40);
        String nombre = GeneradorAleatorio.generarString(8);
        int dni = GeneradorAleatorio.generarInt(20);
        double sueldoBasico = GeneradorAleatorio.generarDouble(2000);
        int lineasXHora = GeneradorAleatorio.generarInt(400);
        String lenguaje = GeneradorAleatorio.generarString(10);
        
        ProgramadorLider PL = new ProgramadorLider (antiguedad, cantProyectos, nombre, dni, sueldoBasico, lineasXHora, lenguaje);
        
        Empresa E = new Empresa (nombreEmpresa, PL, cantProgramadores);
        
        for (int i=0; i<5; i++) {
            nombre = GeneradorAleatorio.generarString(8);
            dni = GeneradorAleatorio.generarInt(20);
            sueldoBasico = GeneradorAleatorio.generarDouble(2000);
            lineasXHora = GeneradorAleatorio.generarInt(400);
            lenguaje = GeneradorAleatorio.generarString(10);
            
            Programador P = new Programador (nombre, dni, sueldoBasico, lineasXHora, lenguaje);
            
            System.out.println("Ingrese un puesto de trabajo");
            E.asignarProgramador(P, Lector.leerInt());
        }
        
        E.aumentarSueldos(30.5);
        System.out.println(E.toString());
        
    }
}

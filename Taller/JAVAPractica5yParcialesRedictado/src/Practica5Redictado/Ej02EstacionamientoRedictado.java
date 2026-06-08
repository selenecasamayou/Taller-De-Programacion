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
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej02EstacionamientoRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        System.out.println("1");
        String nombre = GeneradorAleatorio.generarString(8);
        int direcc = GeneradorAleatorio.generarInt(100);
        int horaApertura = GeneradorAleatorio.generarInt(25);
        int horaCierre = GeneradorAleatorio.generarInt(25);
        int Npisos = 3;
        int Mplazas = 3;
        System.out.println("2");
        Estacionamiento E = new Estacionamiento (nombre, direcc, horaApertura, horaCierre, Npisos, Mplazas);
        System.out.println("3");
        for (int i=0; i<6; i++) {
            String nombreDueño = GeneradorAleatorio.generarString(6);
            String patente = Lector.leerString();
            Auto A = new Auto (nombreDueño, patente);
            
            System.out.println("Ingrese piso y plaza: ");
            int piso = Lector.leerInt();
            int plaza = Lector.leerInt();
            E.agregarAuto(piso, plaza, A);
        }
        
        System.out.println(E.toString());
        System.out.println(E.cantAutos(1));
        
        System.out.println("Ingrese una patente: ");
        String patente = Lector.leerString();  // porque fuera del for tengo que escribir el tipo otra vez??
        System.out.println(E.buscarPatente(patente));
        
    }
    
    
}

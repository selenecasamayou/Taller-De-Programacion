/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales2;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;

public class Parcial06Alquiler {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        String nombreEmpresa = "Storage"; 
        String direcc = GeneradorAleatorio.generarString(5);
        double costoXMes = GeneradorAleatorio.generarDouble(300);
        int cantSectores = 5; 
        int cantBauleras = 3;
        
        Empresa E = new Empresa (nombreEmpresa, direcc, costoXMes, cantSectores, cantBauleras);
        
        int dni = GeneradorAleatorio.generarInt(20);
        String nombre = GeneradorAleatorio.generarString(8);
        int telefono = GeneradorAleatorio.generarInt(50);
        String localidad = "Los Hornos";
        boolean contrato = GeneradorAleatorio.generarBoolean();
        
        Cliente C = new Cliente (dni, nombre, telefono, localidad, contrato);
        E.ingresarCliente(C);
        
        for (int i=0; i<10; i++) {
            dni = GeneradorAleatorio.generarInt(20);
            nombre = GeneradorAleatorio.generarString(8);
            telefono = GeneradorAleatorio.generarInt(50);
            localidad = GeneradorAleatorio.generarString(10);
            contrato = GeneradorAleatorio.generarBoolean();
            
            C = new Cliente (dni, nombre, telefono, localidad, contrato);
            
            E.ingresarCliente(C);
        }
        
        E.clientesLosHornos(1);
        E.obtenerNumSectorMax();
        System.out.println(E.toString());
    }

    
}

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
public class EJ01UNLPRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        String nombre = GeneradorAleatorio.generarString(6);
        int codigo = GeneradorAleatorio.generarInt(100);
        String nombreDirec = GeneradorAleatorio.generarString(6);;
        
        Proyecto P = new Proyecto(nombre, codigo, nombreDirec);
        
        for (int i=0; i<3; i++) {
            String nombreInv = GeneradorAleatorio.generarString(8);
            int categoria = GeneradorAleatorio.generarInt(5) + 1;
            String especialidad = GeneradorAleatorio.generarString(5);
            
            Investigador I = new Investigador (nombreInv, categoria, especialidad);
            P.agregarInvestigador(I);
            
            for (int j=0; j<2; j++) {
                double monto = GeneradorAleatorio.generarDouble(2000);
                String motivo = GeneradorAleatorio.generarString(6);
                
                Subsidio S = new Subsidio (monto, motivo);
                I.agregarSubsidio(S);
            }
            
        }
        
        System.out.println(P.toString());
        
        
    }
    
    
    
    
}

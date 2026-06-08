/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialesextraredictado;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
public class Parcial14ParquesRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        Parque P = new Parque("Reserva Natural Punta Lara", "Buenos Aires", 20);
        
        Guardaparques G = new Guardaparques(63445109, "Pepe", 21);
        
        ParqueNacional PN = new ParqueNacional(4, G, "Parque Nacional Los Alerces", "Chubut", 10);
        
        for (int i=0; i<3; i++) {
            String nombre = GeneradorAleatorio.generarString(5);
            int cantEj = GeneradorAleatorio.generarInt(100) + 30;
            boolean protegida = GeneradorAleatorio.generarBoolean();
            Especie E = new Especie(nombre, cantEj, protegida);
            
            P.agregarEspecie(E);
            
            nombre = GeneradorAleatorio.generarString(5);
            cantEj = GeneradorAleatorio.generarInt(100) + 30;
            protegida = GeneradorAleatorio.generarBoolean();
            E = new Especie(nombre, cantEj, protegida);
            
            PN.agregarEspecie(E);
        }
        System.out.println(P.toString());
        PN.incrementarEjemplares("Pepe", 10);
        System.out.println(PN.toString());
        System.out.println(P.obtenerNivelProteccion());
        System.out.println(PN.obtenerNivelProteccion());
        
    }
    
    
    
}

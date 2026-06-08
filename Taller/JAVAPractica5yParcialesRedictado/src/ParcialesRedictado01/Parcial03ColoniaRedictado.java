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
import PaqueteLectura.GeneradorAleatorio;
public class Parcial03ColoniaRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        Exploradores E = new Exploradores(250, "Locuritas", 300, 1000, 7);
        
        Nadadores N = new Nadadores("Pablo", 200, "Free", 300, 1000, 7);
        
        for (int i=0; i<4; i++) {
            String nombre = GeneradorAleatorio.generarString(6);
            int telefono = GeneradorAleatorio.generarInt(100000000);
            boolean nadar = GeneradorAleatorio.generarBoolean();
            Chico C = new Chico(nombre, telefono, nadar);
            E.agregarChico(C);
            
            nombre = GeneradorAleatorio.generarString(6);
            telefono = GeneradorAleatorio.generarInt(100000000);
            nadar = GeneradorAleatorio.generarBoolean();
            C = new Chico(nombre, telefono, nadar);
            N.agregarChico(C);
            
        }
        System.out.println(E.toString());
        System.out.println(E.isRentable());
        System.out.println(N.toString());
        System.out.println(N.isRentable());
    }
    
    
    
}

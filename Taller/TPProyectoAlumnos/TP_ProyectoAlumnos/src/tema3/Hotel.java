/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Educación
 */
public class Hotel {
    private int N; // DF
    private Habitacion [] vector;
    
    
    public Hotel (int n) {  // PUNTO II
        this.N = n;
        this.vector = new Habitacion [N];
        for (int i=0; i<N; i++) {  // PARA INICIALIZAR EL VECTOR con habitaciones
            vector[i] = new Habitacion(GeneradorAleatorio.generarDouble(8000-2000)+2000); // monto
        }
    }

    public int getCapacidad() {  // PUNTO I, SE TIENE QUE CAMBIAR EL NOMBRE DEL GET DIML O DIMF Y NO TIENE SET
        return N;
    }
    
    // EL VECTOR NO TIENE NI GET NI SET PORQUE ES UNA ESTRUCTURA DE CONTROL
    
    public void agregarCliente (Cliente C, int X) {  
        this.vector[X-1].ocupar(C);
    }
    
    public void aumentarHabitacion (double monto) {
        for (int i=0; i<N; i++) {
            vector[i].aumentar(monto);
        }
    }
    
    public String toString () {
        String aux = "";
        for (int i = 0; i < N; i++) {
            aux += this.vector[i].toString() + "\n";
        }
        return aux;
    }
}

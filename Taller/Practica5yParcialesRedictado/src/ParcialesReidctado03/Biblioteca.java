/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesReidctado03;

/**
 *
 * @author Educación
 */
public class Biblioteca {
    private String nombre;
    private Bibliotecario bi;
    private int cantSocios;
    private int DF;  // cant libros
    private int DL;
    private Libro [] vector;
    
    
    public Biblioteca (String nombre, Bibliotecario bi, int cantSocios, int cantLibros) {
        this.nombre = nombre;
        this.bi = bi;
        this.cantSocios = cantSocios;
        DF = cantLibros;
        DL = 0;
        vector = new Libro [DF];  // inicialmente sin libros
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Bibliotecario getBi() {
        return bi;
    }

    private void setBi(Bibliotecario bi) {
        this.bi = bi;
    }

    public int getCantSocios() {
        return cantSocios;
    }

    private void setCantSocios(int cantSocios) {
        this.cantSocios = cantSocios;
    }

    public int getCantLibros() {
        return DF;
    }

    public int getCantLibrosActual() {
        return DL;
    }
    
    
    public void agregarLibro (Libro L) {  // PUNTO 2.A
        if (DL < DF) {
            this.vector[DL] = L;
            DL++;
        }
    }
    
    public void prestarLibro (String titulo) {  // PUNTO 2.B
        int i = 0; 
        while ((i < DL) && (!(vector[i].getTitulo().equals(titulo)))) {
            i++;
        }
        if (i < DL) {  // encontre el libro con ese titulo
            vector[i].actualizarLibro();
        }
    }
    
    public double obtenerCoeficienteR () {  // PUNTO 2.C
        double R, Rtotal = 0;
        for (int i=0; i<DL; i++) {
            R = this.vector[i].calcularR();
            Rtotal += R;
        }
        return Rtotal;
    }
    
    public String toString () {  // PUNTO 2.D
        String aux = "Biblioteca: " + nombre + " - Cantidad de socios: " + cantSocios + "\n" + bi.toString();
        for (int i=0; i<DL; i++) {
            aux += this.vector[i].toString();
        }
        return aux;
    }
    
    
}

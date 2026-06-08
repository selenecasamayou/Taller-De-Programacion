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
public class Libro {
    private String titulo;
    private int edadRecom;
    private int cantTotalEj;
    private int cantEjDisp;
    private int cantPrest;

    
    public Libro(String titulo, int edadRecom, int cantTotalEj, int cantEjDisp, int cantPrest) {
        this.titulo = titulo;
        this.edadRecom = edadRecom;
        this.cantTotalEj = cantTotalEj;
        this.cantEjDisp = cantEjDisp;
        this.cantPrest = cantPrest;
    }

    
    public String getTitulo() {  // no me interesa el set del titulo porque no lo voy a cambiar
        return titulo;
    }

    public int getEdadRecom() {
        return edadRecom;
    }

    private void setEdadRecom(int edadRecom) {
        this.edadRecom = edadRecom;
    }

    public int getCantTotalEj() {
        return cantTotalEj;
    }

    private void setCantTotalEj(int cantTotalEj) {
        this.cantTotalEj = cantTotalEj;
    }

    public int getCantEjDisp() {
        return cantEjDisp;
    }

    private void setCantEjDisp(int cantEjDisp) {
        this.cantEjDisp = cantEjDisp;
    }

    public int getCantPrest() {
        return cantPrest;
    }

    private void setCantPrest(int cantPrest) {
        this.cantPrest = cantPrest;
    }
    
    
    public void actualizarLibro() {
        this.cantEjDisp--;  // asumo que hay minimo 1 ejemplar disponible
        this.cantPrest++;
    }
    
    public double calcularR() {
        return (this.cantPrest/this.cantTotalEj);
    }

    @Override
    public String toString() {
        return "Titulo: " + titulo + " - Edad recomendada: " + edadRecom + " - Total ejemplares: " + cantTotalEj 
                + " - Disponibles: " + cantEjDisp + " - Prestamos anuales: " + cantPrest + "\n";
    }
    
    
    
}

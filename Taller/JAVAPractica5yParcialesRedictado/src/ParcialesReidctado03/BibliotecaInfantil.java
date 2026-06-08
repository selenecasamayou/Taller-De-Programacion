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
public class BibliotecaInfantil extends Biblioteca{
    private int visitasMes;
    private String nombreMascota;
    
    
    public BibliotecaInfantil (int visitasMes, String nombreMascota, String nombre, Bibliotecario bi, int cantSocios, int cantLibros) {
        super (nombre, bi, cantSocios, cantLibros);
        this.visitasMes = visitasMes;
        this.nombreMascota = nombreMascota;
    }

    
    public int getVisitasMes() {
        return visitasMes;
    }

    private void setVisitasMes(int visitasMes) {
        this.visitasMes = visitasMes;
    }

    public String getNombreMascota() {
        return nombreMascota;
    }

    private void setNombreMascota(String nombreMascota) {
        this.nombreMascota = nombreMascota;
    }
    
    
    public void agregarLibro (Libro L) {
        if (L.getEdadRecom() < 13) {
            super.agregarLibro(L);
        }
    }
    
    public String toString () {
        return (super.toString() + "Cantidad de visitas escolares: " + visitasMes + " - Mascota: " + nombreMascota);
    }
    
    
}

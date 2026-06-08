/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales;

/**
 *
 * @author Educación
 */
public class Viaje {
    private String nombreColegio;
    private String fecha;
    private String destino;
    private MiniBus MB1;
    private MiniBus MB2;
    
    
    public Viaje (String unNombreColegio, String unaFecha, String unDestino, MiniBus unMB1, MiniBus unMB2) {
        nombreColegio = unNombreColegio;
        fecha = unaFecha;
        destino = unDestino;
        MB1 = unMB1;
        MB2 = unMB2;
    }

    public String getNombreColegio() {
        return nombreColegio;
    }

    public void setNombreColegio(String nombreColegio) {
        this.nombreColegio = nombreColegio;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public MiniBus getMB1() {
        return MB1;
    }

    public void setMB1(MiniBus MB1) {
        this.MB1 = MB1;
    }

    public MiniBus getMB2() {
        return MB2;
    }

    public void setMB2(MiniBus MB2) {
        this.MB2 = MB2;
    }
    
    
    public String agregarAlumnoViaje (Alumno Alu) {  // PUNTO 2.A
        String aux;
        if ((MB1.getCapacidadMaxima() - MB1.getCapacidadActual()) < (MB2.getCapacidadMaxima() - MB2.getCapacidadActual())) {
            MB1.agregarAlumnoMinibus(Alu);
            aux = MB1.getPatente();
        }
        else {
            MB2.agregarAlumnoMinibus(Alu);
            aux = MB2.getPatente();
        }
        return aux;
    }
    
    public void asignarPoliza (int unDni, int unaPoliza) {  // PUNTO 2.B
        Alumno aux;
        aux = this.MB1.buscarAlumno(unDni);
        if (aux == null) {
            aux = this.MB2.buscarAlumno(unDni);
        }
        aux.setPoliza(unaPoliza);
    }
    
    public int obtenerCantObraSocialX (String unaObraSocialX) {  // PUNTO 2.C
        int cant = 0;
        cant += this.MB1.buscarConObraSocial(unaObraSocialX);
        cant += this.MB2.buscarConObraSocial(unaObraSocialX);
        return cant;
    }
    
    public String toString () {
        return ("VIAJE ESCOLAR: " + this.fecha + ", Cantidad de alumnos total" + 
                (this.MB1.getCapacidadActual() + this.MB2.getCapacidadActual()) + "/n*" + this.MB1.toString() + this.MB2.toString());
    }
}

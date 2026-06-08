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
public class Cancion {
    private String titulo;
    private String interprete;
    private int duracion;
    
    
    public Cancion (String titulo, String interprete, int duracion) {
        this.titulo = titulo;
        this.interprete = interprete;
        this.duracion = duracion;
    }

    
    public String getTitulo() {
        return titulo;
    }

    private void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getInterprete() {
        return interprete;
    }

    private void setInterprete(String interprete) {
        this.interprete = interprete;
    }

    public int getDuracion() {
        return duracion;
    }

    private void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    @Override
    public String toString() {
        return "Cancion{" + "titulo=" + titulo + ", interprete=" + interprete + ", duracion=" + duracion + "} \n";
    }
    
    
    
    
}

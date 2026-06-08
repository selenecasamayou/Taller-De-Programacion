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
public class Ingrediente extends Componente{
    private String grupo;
    
    
    public Ingrediente (String unGrupo, String nombre, double costo) {
        super(nombre, costo);
        grupo = unGrupo;
    }

    
    public String getGrupo() {
        return grupo;
    }

    private void setGrupo(String grupo) {
        this.grupo = grupo;
    }
    
    
    public double costoFinal () {
        double costo = this.getCosto();
        if (this.grupo.equals("B")) {
            costo = this.getCosto() %10;
        }
        return costo;
    }
    
    public String toString () {
        return ("Un Ingrediente: " + super.toString() + this.grupo + "\n");
    }
    
    
    
}

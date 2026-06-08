/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5;

/**
 *
 * @author Educación
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private int DF;
    private int DL;
    private Investigador [] vecInvestigador;
    
    
    public Proyecto (String unNombre, int unCodigo, String unNombreDirector) { // Cuando me limita lo que puede tener el constructor se refiere
        nombre = unNombre;                                                    // a las variables
        codigo = unCodigo;
        nombreDirector = unNombreDirector;
        DF = 50;
        DL = 0;
        this.vecInvestigador = new Investigador [DF];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }
    
    
    public void agregarInvestigador (Investigador I) {  // PUNTO II.A
        if (this.vecInvestigador [DL] == null) {
            this.vecInvestigador [DL] = I;
        DL++;
        }
    }
    
    public double recorrerVecP () {  // recorro investigadores de 1 proyecto  PUNTO II.C
        double cantP = 0;
        for (int j=0; j<DL; j++) {
            cantP += this.vecInvestigador[j].recorrerVecInv();
        }
        return cantP;
    }
    
    public void otorgarTodos(String nom) {  // PUNTO II.D
        int i=0;
        while (i<DL && !(vecInvestigador[i].getNombre().equals(nom))) {  // busco nombre
            i++;
        }
        if (vecInvestigador[i] != null){
        if (vecInvestigador[i].getNombre().equals(nom)) {  // si lo encontre llamo a cambiar otorgados
            this.vecInvestigador[i].cambiarAOtorgado();
        }
        }
    }

    @Override
    public String toString() {
        String aux;
        aux = "Proyecto{" + "nombre=" + nombre + ", codigo=" + codigo + ", nombreDirector=" + nombreDirector + 
                this.recorrerVecP() + '}';
        for (int i=0; i<DL; i++) {
            aux += vecInvestigador[i].toString();
        }
        
        return aux;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4ej3;

/**
 *
 * @author San Rojas
 */
public class Trabajador extends Persona {
    private String tarea;
    
    public Trabajador(String unNombre, int unDni, int unaEdad, String unaTarea){
        super(unNombre,unDni,unaEdad);
        setTarea(unaTarea);
    }
    
    public void setTarea(String unaTarea){
        this.tarea=unaTarea;
    }
    
    public String toString(){
        String aux;
        aux = super.toString()+" Soy "+this.tarea;
        return aux;
    }
    
    
    
}

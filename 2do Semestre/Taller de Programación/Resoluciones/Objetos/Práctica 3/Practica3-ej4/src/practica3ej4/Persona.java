/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3ej4;

/**
 *
 * @author San Rojas
 */
public class Persona {
    private String nombre;
    private int DNI;
    private int edad;
    
    public Persona (String unNombre, int unDNI, int unaEdad){
        this.nombre=unNombre;
        this.DNI=unDNI;
        this.edad=unaEdad;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = this.nombre+" "+this.DNI+" "+this.edad;
        return aux;
    }
}
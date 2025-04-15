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
public class Persona {
    private String nombre;
    private int dni;
    private int edad;

    public Persona (String unNombre, int unDni, int unaEdad){
        setNombre(unNombre);
        setDni(unDni);
        setEdad(unaEdad);
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    public String toString(){
        String aux;
        aux = "Mi nombre es: "+nombre+" mi DNI es: "+dni+" y tengo: "+edad+" años";
        return aux;
    }
    
}

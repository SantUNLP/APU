/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3ej3;

/**
 *
 * @author San Rojas
 */
public class Autor {
    private String nombre;
    private String bio;
    private String origen;

    public Autor(String unNombre,String unaBio, String unOrigen){
        setNombre(unNombre);
        setBio(unaBio);
        setOrigen(unOrigen);
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    @Override
    public String toString() {
        String aux;
        aux= nombre+" "+bio+" "+origen;
        return aux;
    }
}

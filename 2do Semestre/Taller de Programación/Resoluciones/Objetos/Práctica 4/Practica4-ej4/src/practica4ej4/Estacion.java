/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4ej4;

/**
 *
 * @author San Rojas
 */
public class Estacion {
    private String nombre;
    private double latitud;
    private double longitud;
    
    public Estacion (String unNombre, double unaLatitud, double unaLongitud){
        /*setNombre(unNombre);
        setLatitud(unaLatitud);
        setLongitud(unaLongitud);*/
        this.nombre=unNombre;
        this.latitud=unaLatitud;
        this.longitud=unaLongitud;
    }
    
    /*private void setNombre (String unNombre){
        nombre=unNombre;
    }
    
    private void setLatitud (double unaLatitud){
        latitud=unaLatitud;
    }
    
    private void setLongitud(double unaLongitud){
        longitud=unaLongitud;
    }*/
    
    
    public String representacionEstacion(){
        String aux;
        aux = nombre+" ("+latitud+" S - "+longitud+" O):";
        return aux;
    } 
}

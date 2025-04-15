/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnok2024;

/**
 *
 * @author San Rojas
 */
public class Programador {
    private String nombre;
    private int DNI;
    private double sueldoBasico;
    private int cantLineasPH;
    private String lenguajePreferido;
    
    public Programador(String unNombre, int unDNI, double unSueldo, int CLPH, String unLenguaje){
        this.nombre=unNombre;
        this.DNI=unDNI;
        this.sueldoBasico=unSueldo;
        this.cantLineasPH=CLPH;
        this.lenguajePreferido=unLenguaje;
    }
    
    private double getSueldo(){
        return this.sueldoBasico;
    }
    
    private int getCantLineas(){
        return this.cantLineasPH;
    }
    
    public double obtenerSueldoFinal(){
        double sueldoFinal=this.getSueldo();
        if (this.getCantLineas()>200){
            sueldoFinal+=50000;
        }
        return sueldoFinal;
    }
    
    private void setSueldoBasico(double M){
        this.sueldoBasico+=M;
    }
    
    public void setSueldo(double M){
        this.setSueldoBasico(M);
    }
    
    private String getNombre(){
        return this.nombre;
    }
    
    private String getLenguajePreferido(){
        return this.lenguajePreferido;
    }
    
    public String toString(){
        String aux;
        aux=this.getNombre()+" "+this.getLenguajePreferido()+" $"+this.obtenerSueldoFinal()+"\n";
        return aux;
    }
}

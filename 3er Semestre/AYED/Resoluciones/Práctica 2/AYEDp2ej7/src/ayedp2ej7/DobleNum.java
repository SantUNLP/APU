/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp2ej7;

/**
 *
 * @author San Rojas
 */
public class DobleNum {
    private int suma;
    private int resta;
    
    public DobleNum(int suma, int resta){
        this.suma = suma;
        this.resta = resta;
    }
    
    public int getSuma(){
        return this.suma;
    }
    
    public int getResta(){
        return this.resta;
    }
    
    public void setResta(int r){
        this.resta = r;
    }
    
    public void setSuma (int s){
        this.suma = s;
    }
    
    public String obtenerDatos(){
        String st = "("+this.suma + "|" + this.resta+")";
        return st;
    }
}

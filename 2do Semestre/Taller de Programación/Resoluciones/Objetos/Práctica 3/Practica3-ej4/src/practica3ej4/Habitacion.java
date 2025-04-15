/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3ej4;
import PaqueteLectura.*;
/**
 *
 * @author San Rojas
 */
public class Habitacion {
    private int costo=GeneradorAleatorio.generarInt(6001)+2000;
    private boolean ocupado=false;
    private Persona cliente=null;
    
    public boolean estaOcupado(){
        return (this.ocupado);
    }
    
    public void ocuparHabitacion(Persona C){
        this.cliente=C;
        this.ocupado=true;
    }
    
    public void aumentar(int monto){
        this.costo+=monto;
    }
    
    public int getPrecio(){
        return this.costo;
    }
    
    public String getCliente(){
        String aux;
        aux = this.cliente.toString();
        return aux;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoctema2;

/**
 *
 * @author San Rojas
 */
public class Butaca {
    private String descriptor;
    private double costo;
    private boolean estado;
    private int fila;
    private int asiento;
    
    public Butaca(int i, int j){
        this.estado=false;
        this.fila=i;
        this.asiento=j;
        this.descriptor="fila "+this.fila+" asiento "+this.asiento;
    }
    
    private boolean getEstado(){
        return this.estado;
    }
    
    public void setEstado(){
        this.estado=false;
    }
    
    public double ocupar(int B, int F){
        if (getEstado() != true){
            this.estado=true;
            this.costo=800+100*B;
        } else {
            System.out.println("BUTACA OCUPADA");
        }
        return this.costo;
    }
    
    public String representacion(){
        String aux="";
        aux+="Butaca "+this.descriptor+" "+this.costo+" "+this.estado+"\n";
        return aux;
    } 
    
}

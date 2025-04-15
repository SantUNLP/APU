/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnof2024;

/**
 *
 * @author San Rojas
 */
public class Ticket {
    private int numTicket;
    private int dniCliente;
    private int cantLibrosComprados;
    private double montoAbonado;
    private String medioDePago;
    
    public Ticket(int numTicketAct, int unDni, int unaCantidad, double unMonto, String unMedioDePago){
        this.numTicket=numTicketAct+1;
        this.dniCliente=unDni;
        this.cantLibrosComprados=unaCantidad;
        this.montoAbonado=unMonto;
        this.medioDePago=unMedioDePago;
    }
    
    private int getNumeroTicket(){
        return this.numTicket;
    }
    
    private String getMedio(){
        return this.medioDePago;
    }
    
    private int getDni(){
        return this.dniCliente;
    }
    
    public int getCantLibros(){
        return this.cantLibrosComprados;
    }
    
    public double getMonto(){
        return this.montoAbonado;
    }
    
    @Override
    public String toString(){
        String aux="";
        aux+=this.getNumeroTicket()+" "+this.getDni()+" "+this.getCantLibros()+" $"+this.getMonto()+" "+this.getMedio()+"\n";
        return aux;
    }
}

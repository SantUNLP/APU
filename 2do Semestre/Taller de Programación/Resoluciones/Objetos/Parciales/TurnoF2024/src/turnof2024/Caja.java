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
public class Caja {
    private boolean estado;
    private Ticket[] tickets;
    private int cantTicketsAct;
    private int maxCantidadTickets;
    
    public Caja(int maxTickets){
        this.estado=true;
        this.maxCantidadTickets=maxTickets;
        this.tickets = new Ticket[this.maxCantidadTickets];
        this.cantTicketsAct=0;
    }
    
    private void setDisponibilidad(){
        this.estado=false;
    }
    
    private int getCantTickets(){
        return this.cantTicketsAct;
    }
    
    private int getMaxTickets(){
        return this.maxCantidadTickets;
    }
    
    private void setCantTicketsAct(int unaCantidad){
        this.cantTicketsAct=unaCantidad;
    }
    
    public void registrarVenta(Ticket unaVenta){
        if(this.getCantTickets() < this.getMaxTickets()){
            this.tickets[this.getCantTickets()]=unaVenta;
            setCantTicketsAct((this.getCantTickets()+1));
        }
    }
    
    public void obtenerVentas(int X){
        int acumulador=0;
        for (int i=0;i<this.getCantTickets();i++){
                acumulador+=this.tickets[i].getCantLibros();
        }
        if (acumulador < X){
            this.setDisponibilidad();
        }
    }
    
    public Ticket obtenerTicket(){
        Ticket unTicket=null;
        double monto=-1;
        for (int i=0;i<this.getCantTickets();i++){
            if(this.tickets[i].getMonto() > monto){
                monto=this.tickets[i].getMonto();
                unTicket=this.tickets[i];
            }
        }
        return unTicket;
    }
    
    private boolean getEstado(){
        return this.estado;
    }
    
    private String estado(){
        String condicion;
        if (this.getEstado()){
            condicion="SI";
        } else {
            condicion="NO";
        }
        return condicion;
    }
    
    @Override
    public String toString(){
        String aux="";
        aux+="Disponibilidad: "+this.estado()+" Tickets emitidos: \n";
        if (this.getCantTickets() > 0){
            for(int i=0;i<this.getCantTickets();i++){
                aux+=this.tickets[i].toString();
            }
        } else {
            aux+="Sin tickets emitidos \n";
        }
        return aux;
    }
    
}

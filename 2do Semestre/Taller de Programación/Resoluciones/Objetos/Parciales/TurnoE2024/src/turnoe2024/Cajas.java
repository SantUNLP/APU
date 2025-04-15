/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoe2024;

/**
 *
 * @author San Rojas
 */
public class Cajas {
    private String nombreCajero;
    private Tickets[] informacionTicket;
    private int maxTickets;
    private int cantTickets;
    
    
    public Cajas(String unNombre, int T){
        this.cantTickets=0;
        this.nombreCajero=unNombre;
        this.maxTickets=T;
        this.informacionTicket = new Tickets[maxTickets];
        inicializarTickets();
    }

    private void inicializarTickets(){
        for (int i=0; i<this.maxTickets;i++){
            this.informacionTicket[i]=null;
        }
    }

    public String getNombreCajero() {
        return nombreCajero;
    }

    public int esMinimo(){
        int cant=0;
        for(int i=0;i<this.cantTickets;i++){
            if(this.informacionTicket[i].getMedioDePago().equals("Crédito")){ // METODO QUE DEVUELVA BOOLEAN SI ES "CRÉDITO"
                cant++;
            }
        }
        return cant;
    }
    
    public String getInformacionTickets() {
        String aux="";
        for (int i=0;i<this.cantTickets;i++){
            aux+=this.informacionTicket[i].getInformacion()+"\n";
        }
        return aux;
    }

    private int getCantTickets() {
        return cantTickets;
    }
    
    private void setCantTickets(int ticket){
        this.cantTickets=ticket;
    }
    
    
    public void agregarVenta(Tickets unaVenta){
        if (this.getCantTickets()<this.maxTickets){ // USAR GETTER PARA LA CANTIDAD DE TICKETS
            this.informacionTicket[this.getCantTickets()]=unaVenta;
            this.setCantTickets((this.getCantTickets()+1)); // USAR SETTER con getter +1 EN EL PARAMETRO 
        }
    }
    
    // METODO TO STRING QUE RETORNE EL NOMBRE DEL CAJERO + LA INFO TICKETS
    
    // METODO QUE RETORNE EL CODIGO MINIMO
    
    
}

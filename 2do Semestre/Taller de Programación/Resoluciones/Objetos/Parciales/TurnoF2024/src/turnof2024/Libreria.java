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
public class Libreria {
    private String nombre;
    private int numVentaAct;
    private Caja[] cajas;
    
    public Libreria(String unNombre, int maxTickets){
        setNombre(unNombre);
        this.numVentaAct=0;
        this.cajas = new Caja[4];
        generarCajas(maxTickets);
        
    }
    
    private void setNombre(String unNombre){
        this.nombre=unNombre;
    }
    
    private void generarCajas(int maxTickets){
        for (int i=0;i<4;i++){
            this.cajas[i] = new Caja(maxTickets);
        }
    }
    
    private int getNumeroVenta(){
        return this.numVentaAct;
    }
    
    public void generarVenta(int N, int unDni, int unaCantidad, double unMonto, String unMetodoDePago){
        Ticket venta = new Ticket(this.getNumeroVenta(),unDni,unaCantidad,unMonto,unMetodoDePago);
        this.cajas[(N-1)].registrarVenta(venta);
        this.numVentaAct++;
    }
    
    public void cambiarDisponibilidad(int X){
        for (int i=0;i<4;i++){ 
            this.cajas[i].obtenerVentas(X);                
        }
    } 
    
    
    public Ticket obtenerTicketConMayorMonto(){
        Ticket elTicket=null;
        double monto=-1;
        for(int i=0;i<4;i++){
            if (this.cajas[i].obtenerTicket() != null && this.cajas[i].obtenerTicket().getMonto() > monto){
                monto=this.cajas[i].obtenerTicket().getMonto();
                elTicket=this.cajas[i].obtenerTicket();
            }
            
        }
        return elTicket;
    }
    
    private String getNombre(){
        return this.nombre;
    }
    @Override
    public String toString(){
        String aux="";
        aux+="Librería "+this.getNombre()+"\n";
        for (int i=0;i<4;i++){
            aux+="Caja "+(i+1)+": "+this.cajas[i].toString();
        }
        return aux;
    }
}

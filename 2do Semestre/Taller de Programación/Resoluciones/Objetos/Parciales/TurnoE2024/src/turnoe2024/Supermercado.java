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
public class Supermercado {
    private String direccion;
    private int numVentaAct;
    private Cajas[] cajas;
    private int cantidadCajasAct;
    
    
    public Supermercado(String unaDireccion){
        this.cajas = new Cajas[5];
        this.numVentaAct=0;
        this.cantidadCajasAct=0;
        this.direccion=unaDireccion;
        inicializarCajas();
    }
    
    private void inicializarCajas(){
        for (int i=0; i<5;i++){
            this.cajas[i]=null;
        }
    }
    
    public void agregarCaja(Cajas unaCaja){
        if(this.cantidadCajasAct<5){
            cajas[this.cantidadCajasAct]=unaCaja;
            this.cantidadCajasAct++;
        }
    }
    
    // SE ASUME QUE N VA DE 1 A 5
    public void registrarTicket(int N, int CUIT, int cant, double monto, String medioPago){
        Tickets venta = new Tickets(this.numVentaAct,CUIT,cant,monto,medioPago);
        this.numVentaAct++;
        this.cajas[(N-1)].agregarVenta(venta);
    }
    
    public String representacion(){
        String aux="";
        aux="Supermercado: "+this.direccion+", "+this.cantidadCajasAct+"\n";
        for (int i=0; i<this.cantidadCajasAct;i++){ // USAR TO STRING DE CAJA QUE RETORNE LA INFO DE LA CAJA Y LA INFO DE LOS TICKETS
            aux+="Caja "+(i+1)+":"+this.cajas[i].getNombreCajero()+";"+" Tickets emitidos:\n"+this.cajas[i].getInformacionTickets();
        }
        System.out.println(aux);
        return aux;
    }
    
    // METODO QUE RECORRE LAS CAJAS Y PREGUNTA POR EL MINIMO
    public int minimo(){
        int cant=9999,pos=-1;
        for (int i=0; i<this.cantidadCajasAct;i++){
            if(this.cajas[i].esMinimo()<cant){ // NOMBRES APROPIADOS
                cant=this.cajas[i].esMinimo();
                pos=i;
            }
        }
        return pos+1;
    }       
}

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
public class Tickets {
    private int numeroTicket;
    private int CUITcliente;
    private int cantProductos;
    private double montoAbonado;
    private String medioDePago;
    
    public Tickets(int nTicket, int CUIT, int cantP, double monto, String medioPago){
        this.numeroTicket=nTicket;
        this.CUITcliente=CUIT;
        this.cantProductos=cantP;
        this.montoAbonado=monto;
        this.medioDePago=medioPago;
    }

    public String getMedioDePago() {
        return medioDePago;
    }
    
    
    
    public String getInformacion(){
        String aux="";
        aux=this.numeroTicket+" "+this.CUITcliente+" "+this.cantProductos+" "+this.montoAbonado+" "+this.medioDePago;
        return aux;
    }
}

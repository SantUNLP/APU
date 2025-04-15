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
public class TurnoE2024 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Supermercado NINI = new Supermercado("520 e/ 23 y 25");
        Cajas caja = new Cajas("Santiago",5);
        Cajas caja2 = new Cajas("Luis",5);
        NINI.agregarCaja(caja);
        NINI.agregarCaja(caja2);
        NINI.registrarTicket(0, 455732215, 10, 5000, "Crédito");
        NINI.registrarTicket(0, 455732215, 10, 2000, "Crédito");
        NINI.registrarTicket(1, 455732215, 10, 8000, "Efectivo");
        NINI.registrarTicket(0, 455732215, 10, 2000, "Débito");
        NINI.registrarTicket(1, 455732215, 10, 10000, "Débito");
        NINI.representacion();
        NINI.minimo();
        // TODO code application logic here
    }
    
}

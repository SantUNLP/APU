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
public class TurnoF2024 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Libreria libreria = new Libreria("Santiago", 15);
        // LA CAJA VA DE 1 A 4
        // LOS TICKETS VAN DEL 1 AL N TICKETS EMITIDOS
        libreria.generarVenta(1, 45573215, 100, 15000, "Débito");
        libreria.generarVenta(3, 45573215, 1000, 15000, "Débito");
        libreria.generarVenta(2, 45573215, 150, 30000, "Débito");
        libreria.generarVenta(1, 45573215, 100, 25000, "Débito");
        libreria.generarVenta(1, 45573215, 30, 115000, "Débito");
        // SI LA CAJA ESTA VACIA YA NO TIRA ERROR NULL POINTER
        System.out.println(libreria.toString());
        System.out.println(libreria.obtenerTicketConMayorMonto());
        // TODO code application logic here
    }
    
}

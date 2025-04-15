/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4ej4;

/**
 *
 * @author San Rojas
 */
public class Practica4ej4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // LEER AÑO COMIENZO
        // LEER AÑO FIN
        // CALCULAR LA DIMENSION FISICA = AÑO FIN - AÑO COMIENZO
        // ASIGNAR DIMENSION FISICA AL VECTOR DE AÑOS
        // TODO code application logic here
        int aCom=2020,consecutivo=3;
        Estacion estacion = new Estacion ("La Plata",34.921,57.955);
        SistemaAnual reg = new SistemaAnual(aCom,consecutivo,estacion);
        SistemaMensual reg2 = new SistemaMensual(aCom,consecutivo,estacion);
        System.out.println(reg.getTemperatura());
        System.out.println(reg2.getTemperatura());
    }
    
}

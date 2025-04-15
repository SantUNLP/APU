/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Practica1 {

    /**
     * Carga un vector que representa la tabla del 2
     * @param args
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int ale = GeneradorAleatorio.generarInt(12);
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i = 0;
        while ((ale != 11) && (i<11)) {
            tabla2[i]=ale;
            i++;
            ale = GeneradorAleatorio.generarInt(12);
        }
        for (int a=0; a < i; a++){
            System.out.println("POS ["+a+"]: "+tabla2[a]+"x2 = "+tabla2[a]*2);
        }
    }
    
}

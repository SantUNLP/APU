/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej2;

import java.util.Scanner;

/**
 *
 * @author San Rojas
 */
public class AYEDp1ej2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
         System.out.println("Ingresar valor");
        Scanner b = new Scanner(System.in);
        int[] a;
        int n;
        n = b.nextInt();
        while (n != 0){
            a = metodos.generarArreglo(n);
            for (int valor: a){
                System.out.println(valor);
            }
            n = b.nextInt();
        }
        // TODO code application logic here
    }
    
}

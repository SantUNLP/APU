/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej2;
/**
 *
 * @author San Rojas
 */
public class metodos {
    public static int[] generarArreglo(int n){
        int i;
        int[] arreglo = new int[n];
        for (i=0;i<n;i++){
            arreglo[i] = n*(i+1);
        }
        return arreglo;
    }
    
}

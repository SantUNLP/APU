/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej1;

/**
 *
 * @author San Rojas
 */
public class ejercicio1 {
    
    public static String imprimirConFor(int a, int b){
        int i;
        String st="";
        for (i=a;i<=b;i++){
            st+=i+" ";
        }
    return st;
    }
    public static String imprimirConWhile(int a, int b){
        String st="";
        while (a<=b){
            st+=a++ + " ";
        }
        return st;
    }
    public static String imprimirSinEstructuras(int a, int b){
        String st="";
        if (a <= b){
            st+=a++ + " "+imprimirSinEstructuras(a,b);
        }
        return st;
    }
}

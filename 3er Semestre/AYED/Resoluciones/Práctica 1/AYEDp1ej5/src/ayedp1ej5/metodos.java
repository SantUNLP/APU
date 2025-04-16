/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej5;
import java.util.Scanner;
/**
 *
 * @author San Rojas
 */
public class metodos {
    public static String retornarMaxMinProm(int[] vE){
        String st;
        int max=-9999; int min=9999; int suma=0;
        for(int num:vE){
            suma+=num;
            if(num < min) min=num;
            if(num > max) max=num;
        }
        st = "minimo: "+min+" maximo: "+max+" promedio: "+suma/vE.length;
        return st;
    }
    
    public static String retornarMaxMinProm(int num){
        String st;
        int[] vE = new int[num];
        for(int i=0;i<num;i++){
            vE[i]=i+1*2;
        }
        st = metodos.retornarMaxMinProm(vE);
        return st;
    }
    
    public static void retornarMaxMinProm(){
        String st;
        Scanner num = new Scanner(System.in);
        int n = num.nextInt();
        int[] vE = new int[n];
        for(int i=0;i<n;i++){
            vE[i]=i+5*2;
        }
        System.out.println(metodos.retornarMaxMinProm(vE));
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1.ej3;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author San Rojas
 */
public class Practica1Ej3 {

    /**
     * 3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
        la matriz con números aleatorios entre 0 y 30.
        Luego realice las siguientes operaciones:
        - Mostrar el contenido de la matriz en consola.
        - Calcular e informar la suma de los elementos de la fila 1
        - Generar un vector de 5 posiciones donde cada posición j contiene la suma
        de los elementos de la columna j de la matriz. Luego, imprima el vector.
        - Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
        encontrarse indique su ubicación (fila y columna) en caso contrario
        imprima “No se encontró el elemento”.
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int i,j,fila=5,colum=5;
        int [][] matriz = new int [fila][colum];
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        // CARGAR MATRIZ
        for (i=0; i<5;i++){
            for(j=0; j<5;j++){
                matriz[i][j]=GeneradorAleatorio.generarInt(31);
            }
        }
        // IMPRIMIR MATRIZ
        for (i=0; i<5;i++){
            System.out.println();
            for(j=0; j<5;j++){
                System.out.print(matriz[i][j]+"|");
            }
        }
        System.out.println();
        // Calcular e informar la suma de los elementos de la fila 1
        int sum=0;
        for (i=0; i<1;i++){
            for(j=0; j<5;j++){
                sum=sum+matriz[i][j];
            }
        }
        System.out.println("LA SUMA DE LA PRIMERA FILA ES = "+sum);
        /* - Generar un vector de 5 posiciones donde cada posición j contiene la suma
        de los elementos de la columna j de la matriz. Luego, imprima el vector.*/
        int [] vector = new int [fila];
        for (i=0;i<5;i++){
            for(j=0;j<5;j++){
                vector[j]=vector[j]+matriz[i][j];
            }
        }
        for (i=0;i<5;i++){
            System.out.print("|"+vector[i]+"|");
        }
        System.out.println();
        /* Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
        encontrarse indique su ubicación (fila y columna) en caso contrario
        imprima “No se encontró el elemento”. */
        int posf=0,posc=0;
        System.out.println("LEER UN VALOR");
        int valor = Lector.leerInt();
        boolean ok=false;
        while ((!ok) && (posf < 5)){
            posc=0;
            while ((!ok) && (posc < 5)){
                if (valor == matriz[posf][posc]){
                    ok=true;
                } else {
                posc++;
                }
            }
            if (!ok)
            posf++;
        }
        if (ok == true){
            System.out.println(valor+" EN POSICIÓN "+posf+"|"+posc);
        } else {
            System.out.println("NO SE ENCONTRO");
        }
        
    }
}

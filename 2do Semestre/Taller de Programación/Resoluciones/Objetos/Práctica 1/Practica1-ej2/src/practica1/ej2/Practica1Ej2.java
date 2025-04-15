
package practica1.ej2;
import PaqueteLectura.Lector;
//Paso 1: Importar la funcionalidad para lectura de datos


public class Practica1Ej2 {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        int DF = 15;
        double [] vector = new double [DF];
        //Paso 3: Crear el vector para 15 double 
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i,cant = 0;
        double alt,prom=0,tot=0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0; i<15; i++){
            System.out.println("INGRESAR ALTURA");
            alt = Lector.leerDouble();
            vector[i] = alt;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        for (i=0; i<15; i++){
            tot=tot+vector[i];
        }
        prom=tot/15;
        System.out.println("EL PROMEDIO ES"+prom);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i=0; i<15; i++){
            if (vector[i] > prom) {
                cant++;
            }
        }
        //Paso 9: Informar la cantidad.
        System.out.println("LA CANTIDAD DE JUGADORES QUE SUPERAN EL PROMEDIO "+prom+" ES: "+cant);
    }
    
}

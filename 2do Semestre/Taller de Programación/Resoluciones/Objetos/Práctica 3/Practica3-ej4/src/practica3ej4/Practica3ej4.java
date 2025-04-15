/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3ej4;
import PaqueteLectura.*;
/**
 *
 * @author San Rojas
 */
public class Practica3ej4 {

    /**
     * 4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/ 2000
y 8000.
(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
- Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está
en el rango 1..N) y que la habitación está libre.
- Aumentar el precio de todas las habitaciones en un monto recibido.
- Obtener la representación String del hotel, siguiendo el formato:
{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
…
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
NOTAS: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe
delegar la responsabilidad de la operación.
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        int cantHab,dni,edad,i,numHab,habitaciones=2;//GeneradorAleatorio.generarInt(3);
        Hotel hot = new Hotel(habitaciones);
        String nom;
        int precio;
        Persona per;
        cantHab=habitaciones;
        cantHab--;
        for (i=0;i<habitaciones;i++){
            System.out.println("INGRESAR NOMBRE");
            nom=Lector.leerString();
            System.out.println("LEER DNI");
            dni=Lector.leerInt();
            System.out.println("LEER EDAD");
            edad=Lector.leerInt();
            System.out.println("LEER HABITACIÓN ENTRE 0 y "+cantHab);
            numHab=Lector.leerInt();
            per = new Persona (nom,dni,edad);
            hot.setCliente(per, numHab);
            // Hacer un while hasta que se ingrese una habitación desocupada
            //System.out.println("SE AÑADIO EL CLIENTE "+per.toString()+" A LA HABITACIÓN NÚMERO: "+numHab);
        }
        System.out.println("\n");
        System.out.println(hot.representacion());
        System.out.println("LEER PRECIO");
        precio=Lector.leerInt();
        hot.aumentarPrecio(precio);
        //System.out.println("SE AUMENTO EL ALQUILER DE CADA HABITACIÓN");
        System.out.println(hot.representacion());
    }
    
}

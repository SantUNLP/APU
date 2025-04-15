/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
 */
package practica2.ej3;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author San Rojas
 */
public class Practica2Ej3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int i,j,F=5,C=8;
        Persona [][] casting = new Persona [F][C];
        Persona p;
        // TODO code application logic here
        for (i=0;i<F;i++){
            for(j=0;j<C;j++){
                casting[i][j]=null;
            }
        }
        int dia=0,turno;
        p = new Persona (GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarInt(5000)+50000,GeneradorAleatorio.generarInt(100));
        while ((dia < 5) && (!p.getNombre().equals("ZZZ"))){
            turno=0;
            while ((turno < 8) && (!p.getNombre().equals("ZZZ"))){
                casting[dia][turno]=p;
                p = new Persona (GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarInt(5000)+50000,GeneradorAleatorio.generarInt(100));
                turno++;
            }
            dia++;
        }
        i=0;j=0;
        while (i<5){
            j=0;
            System.out.println("-------------------------");
            while ((j<8) && (casting[i][j] != null)){
                System.out.println("NOMBRE DE LA PERSONA: "+casting[i][j].getNombre());
                j++;
            }
            i++;
        }
    }
    
}

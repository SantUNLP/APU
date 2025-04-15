/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2ej5;
import PaqueteLectura.*;
/**
 *
 * @author San Rojas
 * Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.
 */
public class Practica2ej5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int dimF=20,dimL=0,golL,golV;
        String loc,vis,mensaje;
        Partido [] par = new Partido [20];
        System.out.println("INGRESAR EQUIPO LOCAL");
        loc=Lector.leerString();
        System.out.println("INGRESAR EQUIPO VISITANTE");
        vis=Lector.leerString();
        System.out.println("INGRESAR GOLES LOCAL");
        golL=Lector.leerInt();
        System.out.println("INGRESAR GOLES VISITANTE");
        golV=Lector.leerInt();
        // TODO code application logic here
        while (dimL < dimF && !loc.equals("ZZZ")){
            par[dimL]=new Partido (loc,vis,golL,golV);
            dimL++;
            System.out.println("INGRESAR EQUIPO LOCAL");
            loc=Lector.leerString();
            if (!loc.equals("ZZZ")){
                System.out.println("INGRESAR EQUIPO VISITANTE");
                vis=Lector.leerString();
                System.out.println("INGRESAR GOLES LOCAL");
                golL=Lector.leerInt();
                System.out.println("INGRESAR GOLES VISITANTE");
                golV=Lector.leerInt();
            }
        }
        int i=0,cantR=0,cantB=0;
        while (i < dimL) {
            mensaje=par[i].getLocal();
            mensaje+=par[i].getGolesLocal();
            mensaje+=" VS ";
            mensaje+=par[i].getVisitante();
            mensaje+=par[i].getGolesVisitante();
            System.out.println(mensaje);
            if(par[i].getGanador().equals("RIVER"))
                cantR++;
            if(par[i].getLocal().equals("BOCA"))
                cantB+=par[i].getGolesLocal();
            i++;
        }
        System.out.println("CANTIDAD DE PARTIDOS QUE GANO RIVER: "+cantR);
        System.out.println("CANTIDAD DE GOLES DE BOCA COMO LOCAL: "+cantB);
    }
    
}

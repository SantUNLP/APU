/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3ej4;

/**
 *
 * @author San Rojas
 */
public class Hotel {
    private Habitacion[] habitaciones;
    private int cuartos;
    
    public Hotel (int N){
        this.cuartos=N;
        this.habitaciones=new Habitacion[cuartos];
        for (int i=0; i<cuartos;i++){
            this.habitaciones[i]=new Habitacion();
        }
    }
    
    public void setCliente(Persona C, int numeroHabitacion){
        if (!this.habitaciones[numeroHabitacion].estaOcupado())
            this.habitaciones[numeroHabitacion].ocuparHabitacion(C);
        else
            System.out.println("OCUPADA, ELIJA OTRA HABITACIÓN");
    }
    
    public void aumentarPrecio(int monto){
        for (int i=0;i<cuartos;i++){
            this.habitaciones[i].aumentar(monto);
        }
    }
    
    public double obtenerPrecio(int i){
        return this.habitaciones[i].getPrecio();
    }
    
    public String representacion(){
        String aux="";
        if (this.cuartos==0){
            aux="HOTEL SIN HABITACIONES";
        } else {
            for (int i=0; i<cuartos;i++){
                if (habitaciones[i].estaOcupado()){
                    aux+="Habitacion ["+i+"] "+"$"+habitaciones[i].getPrecio()+" Ocupado"+" Por: "+habitaciones[i].getCliente()+"\n";
                } else {
                    aux+="Habitacion ["+i+"] "+"$"+habitaciones[i].getPrecio()+" Desocupada"+"\n";
                }
            }
        }
        return aux;
    }
}

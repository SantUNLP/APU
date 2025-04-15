/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnop2024;

/**
 *
 * @author San Rojas
 */
public class Pan {
    private String nombre;
    private double costo;
    private String calidad;
    
    public Pan (String unNombre, double unCosto, String unaCalidad){
        this.nombre=unNombre;
        this.costo=unCosto;
        this.calidad=unaCalidad;
    }
    
    private String getCalidad(){
        return this.calidad;
    }
    
    public boolean Calidad(){
        return (this.getCalidad().equals("Premium"));
    }
    
    private double getCosto(){
        return this.costo;
    }
    
    public double obtenerPrecio(){
        double aux=this.getCosto();
        if (this.calidad.equals("Premium")){
            aux+=this.getCosto()*20/100;
        }
        return aux;
    }
    
    private String getNombre(){
        return this.nombre;
    }
    
    @Override
    public String toString(){
        String aux="";
        aux+="Un Pan: "+this.getNombre()+" - $"+this.getCosto()+" - "+this.getCalidad();
        return aux;
    }
}

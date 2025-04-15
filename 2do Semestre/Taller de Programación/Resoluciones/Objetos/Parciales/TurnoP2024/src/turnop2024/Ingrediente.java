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
public class Ingrediente {
    private String nombre;
    private double costo;
    private String grupo;
    
    public Ingrediente(String unNombre, double unCosto, String unGrupo){
        this.nombre=unNombre;
        this.costo=unCosto;
        this.grupo=unGrupo;
    }
    
    private double getCosto(){
        return this.costo;
    }
    
    private String getGrupo(){
        return this.grupo;
    }
    
    public double obtenerPrecioIngrediente(){
        double aux=this.getCosto();
        if (this.getGrupo().equals("B")){
            aux+=this.getCosto()*10/100;
        }
        return aux;
    }
    
    private String getNombre(){
        return this.nombre;
    }
    
    @Override
    public String toString(){
        String aux="";
        aux+="Un ingrediente: "+this.getNombre()+" - $"+this.getCosto()+" "+this.getGrupo();
        return aux;
    }
}

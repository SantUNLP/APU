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
public class Sandwich {
    private String nombre;
    private Pan pan;
    private Ingrediente[] ingredientes;
    private int capacidad;
    private int capActual;
    
    public Sandwich (String unNombre, Pan unPan, int unaCapacidad){
        this.nombre=unNombre;
        this.pan=unPan;
        this.capacidad=unaCapacidad;
        this.capActual=0;
        this.ingredientes = new Ingrediente[this.capacidad];
        // java inicializa el vector en null
    }
    
    private int getCapacidadAct(){
        return this.capActual;
    }
    
    private int getCapacidadMax(){
        return this.capacidad;
    }
    
    public void agregarIngrediente(Ingrediente unIngrediente){
        if(this.getCapacidadAct()<this.getCapacidadMax()){
            this.ingredientes[this.getCapacidadAct()]=unIngrediente;
            this.capActual++;
        }
    }
    
    public double retornarCostoPan(){
        double aux=0;
        aux+=this.pan.obtenerPrecio();
        return aux;
    }
    
    public double retornarCostoIngrediente(){
        double aux=0;
        for(int i=0;i<this.getCapacidadAct();i++){
            aux+=this.ingredientes[i].obtenerPrecioIngrediente();
        }
        return aux;
    }
    
    private String getNombre(){
        return this.nombre;
    }
    
    @Override
    public String toString(){
        String aux="";
        aux+=this.getNombre()+" "+this.pan.toString()+" "+this.getCapacidadAct()+"\n";
        for (int i=0;i<this.getCapacidadAct();i++){
            aux+=this.ingredientes[i].toString()+"\n";
        }
        aux+="Coste final: $"+(this.retornarCostoPan()+this.retornarCostoIngrediente());
        return aux;
    }
}

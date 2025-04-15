/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnok2024;

/**
 *
 * @author San Rojas
 */
public class Empresa {
    private String nombre;
    private ProgramadorLider lider;
    private Programador[] programadores;
    private int cantProgramadores;
    private int maxProgramadores;
    
    public Empresa(String unNombre, ProgramadorLider unLider, int N){
        this.nombre=unNombre;
        this.lider=unLider;
        this.cantProgramadores=0;
        this.maxProgramadores=N;
        this.programadores = new Programador [this.maxProgramadores];
    }


    private int getCantProgramadores() {
        return cantProgramadores;
    }

    private void setCantProgramadores(int cantProgramadores) {
        this.cantProgramadores = cantProgramadores;
    }
    
    private int getMaxProgramadores(){
        return this.maxProgramadores;
    }
    
    public void agregarProgramador(Programador unProgramador){
        if (this.getCantProgramadores()<this.getMaxProgramadores()){
            this.programadores[this.getCantProgramadores()]=unProgramador;
            this.setCantProgramadores((this.getCantProgramadores()+1));
        }
    }
    
    public double calcularMontoTotal(){
        double monto=0;
        monto+=this.lider.obtenerSueldoFinal();
        for(int i=0;i<this.getCantProgramadores();i++){
            monto+=this.programadores[i].obtenerSueldoFinal();
        }
        return monto;
    }
    
    public void aumentarSueldo(double M){
        this.lider.setSueldo(M);
        for (int i=0;i<this.getCantProgramadores();i++){
            this.programadores[i].setSueldo(M);
        }
    }
    
    private String getNombre(){
        return this.nombre;
    }
    
    @Override
    public String toString(){
        String aux;
        aux="Empresa: "+this.getNombre()+"\n"+"Programador lider: "+this.lider.toString();
        for (int i=0;i<this.getCantProgramadores();i++){
            aux+="Programador "+(i+1)+": "+this.programadores[i].toString();
        }
        return aux;
    }
}

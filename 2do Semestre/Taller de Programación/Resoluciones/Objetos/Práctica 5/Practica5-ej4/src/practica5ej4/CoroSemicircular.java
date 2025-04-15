/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej4;

/**
 *
 * @author San Rojas
 */
public class CoroSemicircular extends Coro {
    private Coristas [] corosemi;
    private int dimL;
    private int dimF;

    public CoroSemicircular(String nombre, Director director, int dimF) {
        super(nombre,director);
        this.corosemi=new Coristas[dimF];
        this.dimF=dimF;
        inicializarCoro();
    }
    
    public void agregarCorista(Coristas corista){
        this.corosemi[this.dimL]=corista;
        this.dimL++;
    }
    
    @Override
    public boolean estaLleno(){
        return (this.dimL == this.dimF);
    }
    
    @Override
    public void inicializarCoro(){
        this.dimL=0;
        for (int i=0; i<dimF;i++){
            this.corosemi[i]=null;
        }
    }
    
    @Override
    public boolean bienFormado(){
        boolean ok=true;
        for (int i=0;i<(this.dimL-1);i++){
            if (this.corosemi[i].getTono() < this.corosemi[i+1].getTono())
                ok=false;
        }
        return ok;
    }
}

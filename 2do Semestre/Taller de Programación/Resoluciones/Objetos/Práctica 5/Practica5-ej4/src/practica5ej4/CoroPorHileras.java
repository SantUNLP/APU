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
public class CoroPorHileras extends Coro {
    private Coristas[][] corohileras;
    private int fila;
    private int colum;
    private int dimFilas;
    private int dimColumnas;
    private int dimL;

    public CoroPorHileras(String nombre, Director director, int filas, int columnas) {
        super(nombre,director);
        this.corohileras=new Coristas[filas][columnas];
        this.dimFilas=filas;
        this.dimColumnas=columnas;
        inicializarCoro();
    }
    
    public void agregarCorista(Coristas corista){
        if (this.colum < this.dimColumnas){
            this.corohileras[this.fila][this.colum]=corista;
            this.colum++;
            this.dimL++;
        } else {
            this.colum=0;
            if (this.fila < this.dimFilas){
                this.corohileras[this.fila][this.colum]=corista;
                this.dimL++;
                this.fila++;
            }
        }
        
    }
    
    @Override
    public boolean estaLleno(){
        return (this.dimL == this.dimColumnas*this.dimFilas);
    }
    
    @Override
    public void inicializarCoro(){
        this.fila=0; this.colum=0;
        this.dimL=0;
        for (int i=0; i<this.fila;i++){
            for (int j=0; j<this.colum;j++)
                this.corohileras[i][j]=null;
        }
    }
    
    @Override
    public boolean bienFormado(){
        boolean ok=true;
        int i,j=0;
        for (i=0; i<(this.dimFilas-1);i++){
            for (j=0; j<(this.dimColumnas-1);j++){
                // ENCONTRAR LA MANERA DE PREGUNTAR EN LA MATRIZ
                System.out.println(this.corohileras[i][j].getTono()+" "+ this.corohileras[i][j+1].getTono());
                System.out.println(this.corohileras[i][j].getTono()+" "+ this.corohileras[i+1][j].getTono());
                    
            }
        }
        return ok;
    }
}

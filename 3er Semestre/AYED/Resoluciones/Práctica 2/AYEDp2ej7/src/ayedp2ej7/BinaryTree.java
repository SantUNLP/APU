package ayedp2ej7;



public class BinaryTree <T> {
	
	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	@Override
	public String toString() {
		return this.getData().toString();
	}

	public  int contarHojas() {
            if (!this.isEmpty()){
                if(this.isLeaf()){
                    return 1;
                } else {
                    if ((this.hasLeftChild()) && (this.hasRightChild())){
                        return this.leftChild.contarHojas() + this.rightChild.contarHojas();
                    } else {
                        if (this.hasLeftChild()){
                            return this.leftChild.contarHojas();
                        } else {
                            if (this.hasRightChild()){
                                return this.rightChild.contarHojas();
                            }
                        }
                    }
                }
            }
            return 0;
	}
		
		
    	 
        public BinaryTree<T> espejo(){
            if (!this.isEmpty()){
                BinaryTree<T> a = new BinaryTree<>(this.data);
                if ((this.hasLeftChild() && (this.hasRightChild()))){
                    a.addLeftChild(this.getRightChild().espejo());
                    a.addRightChild(this.getLeftChild().espejo());
                } else{ 
                    if (this.hasLeftChild()){
                        a.addRightChild(this.getLeftChild().espejo());
                    }
                    if (this.hasRightChild()) {
                        a.addLeftChild(this.getRightChild().espejo());
                    }
                }
                return a;
            }
            return null;
        }

	// 0<=n<=m
	public void entreNiveles(int n, int m){
		if (!this.isEmpty()){
                    if ((n >= 0) && (n <= m)){
                        System.out.println(this.data.toString());
                        if ((this.hasLeftChild()) && (this.hasRightChild())){
                            this.leftChild.entreNiveles(n+1,m);
                            this.rightChild.entreNiveles(n+1,m);
                        } else {
                            if (this.hasLeftChild()){
                                this.leftChild.entreNiveles(n+1,m);
                            }
                            if (this.hasRightChild()){
                                this.rightChild.entreNiveles(n+1, m);
                            }
                        }
                    }
                }
        }
        
        
        
        public void recorrido(){
            System.out.println(this.getData());
            if (this.hasLeftChild()){
                this.getLeftChild().recorrido();
            }
            if (this.hasRightChild()){
                this.getRightChild().recorrido();
            }
        }	
}


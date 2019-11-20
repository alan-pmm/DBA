package FaireMesObjets;

public class ClassInput {


	private int longueur;
	private int largeur;

	
	
	public int getLongueur() {
		return longueur;
	}


	public void setLongueur(int longueur) {
		this.longueur = longueur;
	}


	public int getLargeur() {
		return largeur;
	}


	public void setLargeur(int largeur) {
		this.largeur = largeur;
	}


	//CONSTRUCTEUR
	public ClassInput(int longueur, int largeur) {
		this.longueur = longueur;
		this.largeur = largeur;
	}
	
	
	//METHOD 1
	public int mTHDSum () {
	    int superficie = longueur * largeur; 
		return superficie;
	}
	
	//METHOD 2
		public int mTHDSum2 (int lo, int la) {
			longueur = lo;
			largeur = la;
		    int superficie = longueur * largeur; 
			return superficie;
		}
		
	
}

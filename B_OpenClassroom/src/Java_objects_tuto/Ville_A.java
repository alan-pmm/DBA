package Java_objects_tuto;

public class Ville_A{   
  
	  //Les variables et les constructeurs n'ont pas changé…
    
	  
	
	//*************   ACCESSEURS *************

	public String getNomVille() {
		return nomVille;
	}


	public String getNomPays() {
		return nomPays;
	}

	public int getNbreHabitants() {
		return nbreHabitants;
	}

	//*************   MUTATEURS   *************
	
	public void setNomVille(String nomVille) {
		this.nomVille = nomVille;
	}
	
	public void setNomPays(String nomPays) {
		this.nomPays = nomPays;
	}

	public void setNbreHabitants(int nbreHabitants) {
		this.nbreHabitants = nbreHabitants;
	}

//Stocke le nom de notre ville
  private String nomVille;
  //Stocke le nom du pays de notre ville
  private String nomPays;
  //Stocke le nombre d'habitants de notre ville
  private int nbreHabitants;
     
  //Constructeur par défaut
  public Ville_A(){
    System.out.println("Création d'une ville !");      
    nomVille = "Inconnu";
    nomPays = "Inconnu";
    nbreHabitants = 0; 
  }
  
  //Constructeur avec paramètres
  //J'ai ajouté un « p » en première lettre des paramètres.
  //Ce n'est pas une convention, mais ça peut être un bon moyen de les repérer.
  public Ville_A(String pNom, int pNbre, String pPays)
  {
    System.out.println("Création d'une ville avec des paramètres !");
    nomVille = pNom;
    nomPays = pPays;
    nbreHabitants = pNbre;
  }       
  
  
  

  
}

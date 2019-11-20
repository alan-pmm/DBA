package Java_objects_tuto;
public class Ville_B {
 
  protected String nomVille;
  protected String nomPays;
  protected int nbreHabitants;
  private char categorie;
  
  //Les autres variables n'ont pas changé
  //CONSTRUCTEUR
  public Ville_B(){
    System.out.println("Création d'une ville !");          
    nomVille = "Inconnu";
    nomPays = "Inconnu";
    nbreHabitants = 0;
    this.setCategorie();
  }
  //CONSTRUCTEUR
  public Ville_B(String pNom, int pNbre, String pPays)
  {
    System.out.println("Création d'une ville avec des paramètres !");
    nomVille = pNom;
    nomPays = pPays;
    nbreHabitants = pNbre;
    this.setCategorie();
  }  
  

  //Retourne le nom de la ville
  public String getNom()  {  
    return nomVille;
  }

  //Retourne le nom du pays
  public String getNomPays()
  {
    return nomPays;
  }

  // Retourne le nombre d'habitants
  public int getNombreHabitants()
  {
    return nbreHabitants;
  } 

  //Retourne la catégorie de la ville
  public char getCategorie()
  {
    return categorie;
  } 
 
  //Définit le nom de la ville
  public void setNom(String pNom)
  {
    nomVille = pNom;
  }

  //Définit le nom du pays
  public void setNomPays(String pPays)
  {
    nomPays = pPays;
  }

  //Définit le nombre d'habitants
  public void setNombreHabitants(int nbre)
  {
    nbreHabitants = nbre;
    this.setCategorie();
  }  
 
  //Définit la catégorie de la ville
  protected void setCategorie() {
 
    int bornesSuperieures[] = {0, 1000, 10000, 100000, 500000, 1000000, 5000000, 10000000};
    char categories[] = {'?', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'};

    int i = 0;
    while (i < bornesSuperieures.length && this.nbreHabitants > bornesSuperieures[i])
      i++;

    this.categorie = categories[i];
  }

  //Retourne la description de la ville
  public String decrisToi(){
    return "\t"+this.nomVille+" est une ville de "+ this.nomPays+ ", elle comporte : "+this.nbreHabitants+" habitant(s) => elle est donc de catégorie : "+ this.categorie;
  }

  //Retourne une chaîne de caractères selon le résultat de la comparaison
  public String comparer(Ville_B v1){
    String str = new String();

    if (v1.getNombreHabitants() > this.nbreHabitants)
      str = v1.getNom()+" est une ville plus peuplée que "+this.nomVille;
     
    else
      str = this.nomVille+" est une ville plus peuplée que "+v1.getNom();
     
    return str;
  }
  
  // I HAVE CREATED THIS METHOD THIS MAKE AN ADDITION
  public String Addition(Ville_B some_B_Ville, Ville_B again_B_Ville) {
	  int b = this.nbreHabitants + some_B_Ville.getNombreHabitants() + again_B_Ville.getNombreHabitants();
	  return "avec la ville de: " + this.nomVille + " et la ville de: "  + some_B_Ville.nomVille + " et la ville de " + again_B_Ville.nomVille + " ,la somme est de: " + b;
  }
  
} 

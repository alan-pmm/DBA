package Java_objects_tuto;

	public class Ville_C extends Ville_B{
		   
		  //Variables publiques qui comptent les instances
		  public static int nbreInstances = 0;

		  //Variable privée qui comptera aussi les instances
		  private static int nbreInstancesBis = 0;        
		  
		  //Les autres variables n'ont pas changé

		  public Ville_C(){
		    //On incrémente nos variables à chaque appel aux constructeurs
		    nbreInstances++;
		    nbreInstancesBis = nbreInstancesBis + 5;          
		    //Le reste ne change pas.
		  }

		  public Ville_C(String pNom, int pNbre, String pPays)
		  {  
		    //On incrémente nos variables à chaque appel aux constructeurs
		    nbreInstances++;
		    nbreInstancesBis = nbreInstancesBis + 5;  
		    //Le reste ne change pas
		  }
		  public static int getNombreInstancesBis()
		  {
		    return nbreInstancesBis;
		  }  
		  //Le reste du code est le même qu'avant
		}
	


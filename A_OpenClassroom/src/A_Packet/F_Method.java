package A_Packet;


	
	public class F_Method
	{
		
	  public static void main(String[] args)
	  {
	    String[] tab = {"toto", "tata", "titi", "tete","pepe","mami"};
	    //parcourirTableau(tab); 
	   // parcourirTableau2(tab);  
	    System.out.println(toString(tab));
	  }
	 
	  static void parcourirTableau(String[] LeTableauRange) //MY METHOD
	  {
	    for(String header : LeTableauRange)
	      System.out.println(header);
	  }

		  static void parcourirTableau2(String[] tab)
		  {
		    for(String str : tab)
		    System.out.println(str);
		  }
		           
		  static String toString(String[] tab)
		  {
		    System.out.println("Méthode toString() !\n----------");
		    String retour = "";
		                   
		    for(String str : tab)
		      retour += str + "\n"; 
		                   
		    return retour;
		  }         
		}
	  
	  
	
	


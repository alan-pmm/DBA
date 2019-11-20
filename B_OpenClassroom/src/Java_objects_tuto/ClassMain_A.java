package Java_objects_tuto;
class ClassMain_A{

  public static void main(String[] args){ 
	  Ville_A v  = new Ville_A();
	  Ville_A v1 = new Ville_A("Marseille", 123456, "France");       
	  Ville_A v2 = new Ville_A("Rio", 321654, "Brésil");
	  Ville_A v3 = new Ville_A("Porto", 4321654, "Portugal");
	  
	  System.out.println("\n v = "+v.getNomVille()+" ville de  "+v.getNbreHabitants()+ " habitants se situant en "+v.getNomPays());
	  System.out.println(" v1 = "+v1.getNomVille()+" ville de  "+v1.getNbreHabitants()+ " habitants se situant en "+v1.getNomPays());
	  System.out.println(" v2 = "+v2.getNomVille()+" ville de  "+v2.getNbreHabitants()+ " habitants se situant en "+v2.getNomPays()+"\n\n");
	  System.out.println(" v3 = "+v3.getNomVille()+" ville de  "+v3.getNbreHabitants()+ " habitants se situant en "+v3.getNomPays()+"\n\n");
	          
	  /*
	    Nous allons interchanger les Villes v1 et v2
	    tout ça par l'intermédiaire d'un autre objet Ville.        
	  */       
	  Ville_A temp = new Ville_A();
	  temp = v1;
	  v1 = v2;
	  v2 = temp;
	         
	  System.out.println(" v1 = "+v1.getNomVille()+" ville de  "+v1.getNbreHabitants()+ " habitants se situant en "+v1.getNomPays());
	  System.out.println(" v2 = "+v2.getNomVille()+" ville de  "+v2.getNbreHabitants()+ " habitants se situant en "+v2.getNomPays()+"\n\n");

	  /*       
	    Nous allons maintenant interchanger leurs noms
	    cette fois par le biais de leurs mutateurs.
	  */   
	  v1.setNomPays("Hong Kong");
	  v2.setNomVille("Djibouti");
	        
	  System.out.println(" v1 = "+v1.getNomVille()+" ville de  "+v1.getNbreHabitants()+ " habitants se situant en "+v1.getNomPays());
	  System.out.println(" v2 = "+v2.getNomVille()+" ville de  "+v2.getNbreHabitants()+ " habitants se situant en "+v2.getNomPays()+"\n\n");
  
	  Ville_B v0 = new Ville_B();
	  System.out.println(v0.comparer(v0));
  }
}
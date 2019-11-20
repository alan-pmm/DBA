package Java_objects_tuto;

public class ClassMain_C {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ville_C v = new Ville_C();                
		System.out.println("Le nombre d'instances de la classe C_Ville est : " + Ville_C.nbreInstances);
		System.out.println("Le nombre d'instances de la classe C_Ville est : " + Ville_C.getNombreInstancesBis());
			                        
		Ville_C v1 = new Ville_C("Marseille", 1236, "France");        
		System.out.println("Le nombre d'instances de la classe C_Ville est : " + Ville_C.nbreInstances);
		System.out.println("Le nombre d'instances de la classe C_Ville est : " + Ville_C.getNombreInstancesBis());
		                
		Ville_C v2 = new Ville_C("Rio", 321654, "Brésil");        
		System.out.println("Le nombre d'instances de la classe C_Ville est : " + Ville_C.nbreInstances);
		System.out.println("Le nombre d'instances de la classe C_Ville est : " + Ville_C.getNombreInstancesBis());
		
		Ville_D_Capitale capital = new Ville_D_Capitale("Blois",600012,"France", "Chateau de Blois"); 
		System.out.println(capital.decrisToi() + "Il ya le monument: " + capital.getMonument());
		
		Ville_D_Capitale capital2 = new Ville_D_Capitale(); 
		System.out.println(capital2.decrisToi());
		
		Ville_D_Capitale cap = new Ville_D_Capitale("Paris", 654987, "France", "la tour Eiffel ");
		System.out.println(cap.decrisToi());
	}
}

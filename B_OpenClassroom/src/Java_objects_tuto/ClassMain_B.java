package Java_objects_tuto;

public class ClassMain_B {

	 public static void main(String[] args){ 
	
		 Ville_B v = new  Ville_B();
		 Ville_B v1 = new Ville_B("Marseille", 88881236, "France");       
		 Ville_B v2 = new Ville_B("Rio", 888921654, "Brésil");
		 Ville_B v3 = new Ville_B("Perigueux", 21654, "France");
		 
		 
		 //System.out.println("\n\n"+v1.decrisToi());
		 //ystem.out.println("\n\n"+v.Addition(v3,v1));
		 //System.out.println(v.decrisToi());
		 System.out.println(v2.decrisToi()+"\n\n");
		 //System.out.println(v1.comparer(v2));
		 

  
	 }
}
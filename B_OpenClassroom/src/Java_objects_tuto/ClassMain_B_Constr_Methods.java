package Java_objects_tuto;

public class ClassMain_B_Constr_Methods {

	 public static void main(String[] args){ 
	
		 Ville_B_Constr_Get_Set v = new  Ville_B_Constr_Get_Set();
		 Ville_B_Constr_Get_Set v1 = new Ville_B_Constr_Get_Set("Marseille", 88881236, "France");       
		 Ville_B_Constr_Get_Set v2 = new Ville_B_Constr_Get_Set("Rio", 888921654, "Brésil");
		 Ville_B_Constr_Get_Set v3 = new Ville_B_Constr_Get_Set("Perigueux", 21654, "France");
		 
		 
		 //System.out.println("\n\n"+v1.decrisToi());
		 //ystem.out.println("\n\n"+v.Addition(v3,v1));
		 //System.out.println(v.decrisToi());
		 System.out.println(v2.decrisToi()+"\n\n");
		 //System.out.println(v1.comparer(v2));
  
	 }
}
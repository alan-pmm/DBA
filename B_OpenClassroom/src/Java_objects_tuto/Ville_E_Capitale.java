package Java_objects_tuto;

public class Ville_E_Capitale extends Ville_B_Constr_Get_Set {

	private String monument;

	
	//CONSTRUCTOR 1 FROM CLASS Ville_B 
			public Ville_E_Capitale() {
				super(); // APPEL LE CONSTRUCTEUR DE LA CLASSE MERE (extends)
				monument = "aucun";
			}
	//CONSTRUCTOR 2 FROM CLASS Ville_B
			public Ville_E_Capitale(String pNom, int pNbre, String pPays, String monument) {
				super(pNom, pNbre, pPays);
				this.monument = monument;
			}
			
			//METHOD 1 // HERE IT UNHERITS FROM CLASS Ville_B BUT WE ADD AN EXTRA VARIABLE 'monument'
			public String decrisToi() {
			    String str =  super.decrisToi() + "\n \t ==>>" + this.monument+ " en est un monument";
			    System.out.println("Invocation de super.decrisToi()");    
			    return str;
			   }
			//METHOD 2 // RETURN STRING OBJECT
			public String toString(){
				  String str = super.toString() + "\n \t ==>>" + this.monument + " en est un monument";
				  return str;
				  }
			
			//GETTERS SETTERS FOR VARIABLE 'monument'
			public String getMonument() {
				return monument;
			}
			public void setMonument(String monument) {
				this.monument = monument;
			}
			

	}
	


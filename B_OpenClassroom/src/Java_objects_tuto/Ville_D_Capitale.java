package Java_objects_tuto;

public class Ville_D_Capitale extends Ville_C_heritage  {
	private String monument;
	
	//CONSTRUCTOR 1
	Ville_D_Capitale (String nomVille, int nbreHabitants, String nomPays, String monument){
		this.nomVille = nomVille ;
		this.nbreHabitants = nbreHabitants;
		this.nomPays = nomPays;
		this.setCategorie();
		this.setMonument(monument);
	}
	
	//CONSTRUCTOR 2
	Ville_D_Capitale (){
		this.nomVille = "Toulouse" ;
		this.nbreHabitants = 1000077;	
		this.nomPays = "France";
		this.setCategorie();
		this.monument = "Le Capitole ";
	}
	
		
	
	//UNHERITED METHOD FROM Ville_D_Capitale
	//public String decrisToi(){
	//    String str = super.decrisToi() + "\n \t ==>>" + this.monument + "en est un monument";
	//    return str;
	//    } 
	
	
	
	
	public String getMonument() {
		return monument;
	}

	public void setMonument(String monument) {
		this.monument = monument;
	}
	

}

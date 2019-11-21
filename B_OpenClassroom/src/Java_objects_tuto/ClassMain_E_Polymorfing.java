package Java_objects_tuto;

public class ClassMain_E_Polymorfing {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//OBJECT 1
		Ville_E_Capitale capitale_E = new Ville_E_Capitale();
		//OBJECT 2
		Ville_E_Capitale capitale_EA = new Ville_E_Capitale("Marseille", 1236, "France", " Cathédrale la Major ");
		//OBJECT 3 // POLYMORFING
		//Définition d'un tableau de villes null
		Ville_B_Constr_Get_Set[] tableauB = new Ville_B_Constr_Get_Set[6];
		
		//CALL OBJECT 1 AND 2 + METHOD decrisToi
		System.out.println(capitale_E.decrisToi());
		System.out.println(capitale_EA.decrisToi());
		        
		//Définition d'un tableau de noms de villes et un autre de nombres d'habitants
		String[] tab = {"Marseille", "lille", "caen", "lyon", "paris", "madrid"}; //CITY
		String[] tab1 = {"", "", "", "", "Montparnasse", "Plaza Mayor"}; //MONUMENT
		String[] tab3 = {" FRANCE ", " FRANCE ", " FRANCE ", " FRANCE ", " FRANCE ", "ESPAGNE"}; //MONUMENT
		
		int[] tab2 = {123456, 78456, 654987, 75832165, 25000000, 20000000};
		         
		//Les 4 premiers éléments du tableau seront des villes,et le reste, des capitales
		for(int i = 0; i < 6; i++){
		  if (i <4){
		    Ville_B_Constr_Get_Set prefecture = new Ville_B_Constr_Get_Set(tab[i], tab2[i], "france");//-->nomVille,nbreHabitants,nomPays
		    tableauB[i] = prefecture;
		  }
		         
		  else{
			 Ville_E_Capitale Capital = new Ville_E_Capitale(tab[i], tab2[i],tab3[i], tab1[i]);//--->nomVille,nbreHabitants,nomPays,monument
		    tableauB[i] = Capital;
		  }
		}
		                 
		//Il ne nous reste plus qu'à décrire tout notre tableau !
		for(Ville_B_Constr_Get_Set Z : tableauB){
		  System.out.println(Z.decrisToi()+" (decris toi) :  \n ");
		}
		
		//Il ne nous reste plus qu'à décrire tout notre tableau !
		for(Object obj : tableauB){
		  System.out.println(obj.toString()+" (toString) :  \n ");
		}
				   
		}
	}



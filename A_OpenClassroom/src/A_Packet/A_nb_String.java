package A_Packet;

import java.util.Scanner;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


public class A_nb_String {
	//variables de type numérique
	static int nbre1 = 3; 
	static int nbre2 = 2;

	static char caractere = 'A'; 
       
	
	//Première méthode de déclaration
	static String phrase = "Titi et Grosminet";
	
	

	 //Deuxième méthode de déclaration
	static String str = new String();


	 //Troisième méthode de déclaration
	static String string = "Une autre chaîne";

	static //Quatrième méthode de déclaration
	String chaine = new String("Et une de plus !");
	
	
	static double nbre3 = 1;
	static double nbre4 = 3;
	static double calc;
	
	int nbre5 = 3, nbre6 = 2;
	static double resultat2; 

	
	
	static double nombre_ = 1000000000000d; // cast en d
	//Peut s'écrire ainsi
	static double _nombre_ = 1____000____000___000_000d; // cast en d
    //Le nombre d'underscore n'a pas d'importance

	//Voici quelques autres exemple d'utilisation
	static int entier = 32_000;
	double monDouble = 12_34_56_78_89_10d; // cast en d
	double monDouble2 = 1234_5678_8910d;   // cast en d
	
	static int entier_ = 0b1111_1111; //Est équivalent à : « int entier = 255; »
	static int entier__ = 0b1000_0000_0000; //Est équivalent à : « int entier = 2048; »
	static int entier___ = 0b100011100000; //Est équivalent à : « int entier = 2272; »
	
	
	
	static String chaine1 = new String("coucou ! "); 
	static int longueur = 0;
	  //Renvoie 9
	
	public static void main(String[] args) {
	
	str = "Une autre chaîne de caractères";
  
	//variables de type char et String
	double resultat = (double)(nbre1) / (double)(nbre2);
	System.out.println("Le résultat est = " + resultat); 	//affiche : Le résultat est = 1.5
	System.out.println(caractere);
	caractere = 'B';
	System.out.println(caractere);		
	System.out.println(phrase);
	string = string + " et un changement string";
	System.out.println(string);
	chaine = chaine + " une deuxime fois chaine";
	System.out.println(chaine);
	
	calc = nbre3 / nbre4;	//calc = (int)(nbre3 / nbre4);
	System.out.println(nbre3 / nbre4);
	System.out.println("Le résultat est = " + calc);
	
	System.out.println("Le résultat est = " + resultat2); 
	//affiche : Le résultat est = 1.5
	
	System.out.println("Le résultat est = " + entier); 
	System.out.println("Le résultat est = " + nombre_); 
	System.out.println("Le résultat est = " + _nombre_); 
	System.out.println("Le résultat est = " + entier_); 
	System.out.println("Le résultat est = " + entier__); 
	System.out.println("Le résultat est = " + entier___); 
	
	
	longueur = chaine1.length(); 
	
	Scanner sc = new Scanner(System.in);
	System.out.println("Veuillez saisir un mot :");
	String str = sc.nextLine();
	System.out.println("Vous avez saisi : " + str);
	
	Scanner sc1 = new Scanner(System.in);
	System.out.println("Veuillez saisir un nombre :");
	int str1 = sc1.nextInt();
	System.out.println("Vous avez saisi le nombre : " + str1);
	System.out.println("Voici la chaine : " + chaine1);
	}    
}



	




